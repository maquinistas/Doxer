from rest_framework import status
from django.core.exceptions import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import *
from .models import *
from django.db.models import F, Sum
from django.conf import settings
from django.core.mail import send_mail
from django.contrib.auth.hashers  import make_password,check_password
from time import gmtime, strftime
from sms import send_sms
from datetime import datetime, timedelta   
import datetime

date = datetime.date.today()
start_week = date - datetime.timedelta(days=11)
end_week = start_week + datetime.timedelta(6)


# Function to convert string to datetime
def convert(date_time):
    format = '%I:%M%p' # The format
    datetime_str = datetime.datetime.strptime(date_time, format)
    realtime = datetime_str.strftime('%H:%M')
    return realtime 

# Driver code
# Create your views here.

email_pattern = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$' 
mobile_pattern = '^[0-9]{10}$'

import math,random
import re

def Average(l): 
    avg = sum(l) / len(l) 
    return avg

def genrateOtp():
    digits = '0123456789'
    OTP = ''
    for i in range(4):
        OTP += digits[math.floor(random.random()*10)]
    return OTP
#  _ ____     ____   ________            _______   ____  
#   |    \   |    \     |      |       | |        |    \ 
#   |     |  |____/     |      |       | |____    |____/ 
#   |     |  |  \       |       \     /  |        |  \   
#  _|____/   |   \   ___|____    \___/   |______  |   \
      
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@api_view(['POST'])
def SignUpDriver(request):
    if request.method  == "POST":
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        name = data['name'].casefold()
        per_km_price = '00' #data['per_km_price']
        raw = data['email_or_num'].casefold()
        nks = data['token']
        DeviceId = data['DeviceId']
        otp = genrateOtp()
        if(not raw):
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
        password = data['password']
        cpassword = data['cpassword']

        if(not name):
            return Response({'status' : 0 , 'msg' : "Full Name Is Required"})
        if(not per_km_price):
            return Response({'status' : 0 , 'msg' : "Price For Per Km Is Required"})
        if(not password):
            return Response({'status' : 0 , 'msg' : "Password Field Is Required"})
        if(not cpassword):
            return Response({'status' : 0 , 'msg' : "Confirm Password Field Is Required"})
        
        devi = Driver.objects.filter(DeviceId=DeviceId,status = 'Deactive')
        if len(devi) > 0:
            devis = Driver.objects.filter(DeviceId=DeviceId)
            for i in devis:
                i.status = 'Deactive'
                i.save()
            return Response({'status' : 0 , 'msg' : "This Device has Block By Admin"})
        else:   
            if(re.search(mobile_pattern,raw)):
                em = '' 
                num = Driver.objects.filter(contact_no=raw)
                if len(num) > 0:
                    getid = Driver.objects.get(id=num[0].id)
                    if getid.status == 'Deactivate':
                        return Response({'status' : 0 , 'msg' : "This Account has been Block"})
                    else:
                        if getid.active_ac_with_otp == "0":
                            if password != cpassword:
                                    return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
                            else:
                                getid.password = make_password(password)
                                getid.cpassword = cpassword
                                getid.otp = otp
                                getid.name = name
                                getid.fare_per_km = per_km_price
                                getid.status = 'Active'
                                getid.create_at = showtime
                                getid.DeviceId = DeviceId
                                getid.update_at = showtime
                                getid.ntk = nks
                                getid.save()
                                # send_sms(
                                #         f'Hii {getid.name} \n Your Verification Code Is Here \n {getid.otp} ',
                                #         '+91634545811120',
                                #         [getid.contact_no,]
                                # )
                                return Response({'status' : 1,'msg':'Driver Register Succesfully',"Id":getid.id,'Type':"Mobile",'OTP':getid.otp})
                        else:
                            return Response({'status' : 0 , 'msg' : "Phone Num Is Alread Used"})  
                else:
                    mo = raw     
            elif(re.search(email_pattern, raw)):
                mo = ''
                mail = Driver.objects.filter(email=raw)
                if len(mail) > 0:
                    getid = Driver.objects.get(id=mail[0].id)
                    if getid.status == 'Deactivate':
                        return Response({'status' : 0 , 'msg' : "This Account has been Block"})
                    else:
                        if getid.active_ac_with_otp == "0":
                            if password != cpassword:
                                    return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
                            else:
                                getid.password = make_password(password)
                                getid.cpassword = cpassword
                                getid.otp = otp
                                getid.name = name
                                getid.fare_per_km = per_km_price
                                getid.create_at = showtime
                                getid.update_at = showtime
                                getid.status = 'Active'
                                getid.ntk = nks
                                getid.DeviceId = DeviceId
                                getid.save()
                                mail_subject = 'Sign Up With Otp.'
                                message = f'Hi {getid.email},\n Mail Sent Properly \n Otp is:-\'{getid.otp}\'\n Thank You' 
                                email_from = settings.EMAIL_HOST_USER
                                to_email = [getid.email,]
                                send_mail(mail_subject, message, email_from, to_email)
                                return Response({'status' : 1,'msg':'Driver Register Succesfully',"Id":getid.id,'Type':'Email','OTP':getid.otp})
                        else:
                            return Response({'status' : 0 , 'msg' : "Email Is Alread Used"})
                else:
                    em = raw
            else:
                return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})

            if password != cpassword:
                return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
            else:
                driver = Driver.objects.create(
                    email_or_num = raw,
                    name = name,
                    fare_per_km = per_km_price,
                    email = em,
                    contact_no = mo,
                    DeviceId = DeviceId,
                    password = password,
                    cpassword = cpassword,
                    status = 'Active',
                    ntk = nks,
                    create_at = showtime,
                    update_at = showtime,
                )
                driver.password = make_password(driver.password)
                driver.cpassword = driver.cpassword
                driver.otp = otp
                driver.save()
                if driver.email:
                    types = 'Email'
                    mail_subject = 'Sign Up With Otp.'
                    message = f'Hi {driver.name},\n Mail Sent Properly \n Otp is:-\'{driver.otp}\'\n Thank You' 
                    email_from = settings.EMAIL_HOST_USER
                    to_email = [driver.email,]
                    send_mail(mail_subject, message, email_from, to_email)
                if driver.contact_no:
                    types = 'Mobile'
                    # send_sms(
                    #         f'Hii {driver.name} \n Your Verification Code Is Here \n {driver.otp} ',
                    #         '+91634545811120',
                    #         [driver.contact_no,]
                    # )
            return Response({'status' : 1,'msg':'Driver Register Succesfully','Id' :driver.id,'Type':types,'OTP':driver.otp})

@api_view(["POST"])
def LoginDriver(request):
    data = request.data
    raw = data['email_or_num'].casefold()
    getpass = data['password']
    nks = data['token']
    DeviceId = data['DeviceId']
    if(not raw):
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Required"})
    if(not getpass):
            return Response({"status" : 0 , "msg" : "Password Is Required"})
    
    devi = Driver.objects.filter(DeviceId=DeviceId,status = 'Deactive')
    if len(devi) > 0:
        devis = Driver.objects.filter(DeviceId=DeviceId)
        for i in devis:
            i.status = 'Deactive'
            i.save()
        return Response({'status' : 0 , 'msg' : "This Device has Block By Admin"})
    else:       
        if(re.search(mobile_pattern,raw)):
            num = Driver.objects.filter(contact_no=raw)
            if len(num) > 0:
                dri = Driver.objects.get(id=num[0].id)
                if dri.active_ac_with_otp == "0":
                    return Response({"status" : 0 , "msg" : "Unknow User"})
                else:
                    if dri.status == 'Active':
                        passwrd = check_password(getpass, dri.password)
                        if passwrd:
                            # if dri.DeviceId == None:
                            #     dri.DeviceId = DeviceId
                            #     dri.save()
                            #     print("please add Driverid with num",DeviceId)
                            dri = Driver.objects.get(id=dri.id)
                            dri.ntk = nks
                            dri.save()
                            Driver_name = dri.name #if dri.name else dri.email_or_num
                            return Response({"status" : 1 , "msg" : "Login Success","id":dri.id,'Driver_name':Driver_name})
                        else:
                            return Response({"status" : 0 , "msg" : "Password Is Wrong"})
                    else:
                        return Response({"status" : 0 , "msg" : "Account Is Blocked"})
                        
            else:
                return Response({"status" : 0 , "msg" : "Unknow User"})
        elif(re.search(email_pattern, raw)):
            mail = Driver.objects.filter(email=raw)
            if len(mail) > 0:
                dri = Driver.objects.get(id=mail[0].id)
                if dri.active_ac_with_otp == "0":
                    return Response({"status" : 0 , "msg" : "Account Is Not Created"})
                else:
                    if dri.status == 'Active':
                        passwrd = check_password(getpass, dri.password)
                        if passwrd:
                            # if dri.DeviceId == None:
                            #     dri.DeviceId = DeviceId
                            #     dri.save()
                            #     print("please add Driverid",DeviceId)
                            dri = Driver.objects.get(id=dri.id)
                            dri.ntk = nks
                            dri.save()
                            Driver_name = dri.name #if dri.name else dri.email_or_num
                            return Response({"status" : 1 , "msg" : "Login Success","id":dri.id,'Driver_name':Driver_name})
                        else:
                            return Response({"status" : 0 , "msg" : "Password Is Wrong"})
                    else:
                        return Response({"status" : 0 , "msg" : "Account Is Blocked"})
            else:
                return Response({"status" : 0 , "msg" : "Unknow User"})  
        else:
            return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Not Valid"})

@api_view(["POST"])
def VerifyOtpDriver(request):
    data = request.data
    raw = data['email_or_num'].casefold()
    getotp = data['otp']
    newotp = genrateOtp()
    if(not raw):
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Required"})
    if(not getotp):
            return Response({"status" : 0 , "msg" : "OTP Field Is Required"})
        
    if(re.search(mobile_pattern,raw)):
        num = Driver.objects.filter(contact_no=raw)
        if len(num) > 0:
            dri = Driver.objects.get(id=num[0].id)
            if dri.active_ac_with_otp == "1":
                return Response({"status" : 0 , "msg" : "Otp Already Verify"})
            # elif dri.active_ac_with_otp == "0":
            #     if dri.otp == getotp:
            #         dri.active_ac_with_otp = "1"
            #         dri.otp = newotp
            #         dri.save()
            #         return Response({"status" : 1 , "msg" : "Otp Verify Successfully",'id':dri.id})
            #     else:
            #         return Response({"status" : 0 , "msg" : "Otp Is Not Match"})
            else:
                if dri.otp == getotp:
                    dri.active_ac_with_otp = "1"
                    dri.otp = newotp
                    dri.save()
                    return Response({"status" : 1 , "msg" : "Otp Verify Successfully",'id':dri.id})
                else:
                    return Response({"status" : 0 , "msg" : "Otp Is Not Match"})
        else:
            return Response({"status" : 0 , "msg" : "Unknow User"})
    elif(re.search(email_pattern, raw)):
        mail = Driver.objects.filter(email=raw)
        if len(mail) > 0:
            dri = Driver.objects.get(id=mail[0].id)
            if dri.active_ac_with_otp == "1":
                return Response({"status" : 0 , "msg" : "Otp Already Verify",'id':dri.id})
            # elif dri.active_ac_with_otp == "0":
            #     if dri.otp == getotp:
            #         dri.active_ac_with_otp = "1"
            #         dri.otp = newotp
            #         dri.save()
            #         return Response({"status" : 1 , "msg" : "Otp Verify Successfully",'id':dri.id})
            #     else:
            #         return Response({"status" : 0 , "msg" : "Otp Is Not Match"})
            else:
                if dri.otp == getotp:
                    dri.active_ac_with_otp = "1"
                    dri.otp = newotp
                    dri.save()
                    return Response({"status" : 1 , "msg" : "Otp Verify Successfully",'id':dri.id})
                else:
                    return Response({"status" : 0 , "msg" : "Otp Is Not Match"})
        else:
            return Response({"status" : 0 , "msg" : "Unknow User"})  
    else:
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Not Valid"})

@api_view(["POST"])
def ResendOtpDriver(request):
    data = request.data
    raw = data['email_or_num']
    getotp = genrateOtp()
    if(not raw):
        return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
    if(re.search(mobile_pattern,raw)):
        num = Driver.objects.filter(contact_no=raw,active_ac_with_otp='0')
        if len(num) > 0:
            driver = Driver.objects.get(id=num[0].id)
            if driver.status == 'Active':
                driver.otp = getotp
                driver.save()
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Text","otp":driver.otp,'Type':"Mobile","token":driver.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Number Is Not Found.!"})
    elif(re.search(email_pattern, raw)):
        mail = Driver.objects.filter(email=raw,active_ac_with_otp='0')
        if len(mail) > 0:
            driver = Driver.objects.get(id=mail[0].id)
            if driver.status == 'Active':
                driver.otp = getotp
                driver.save()
                    
                mail_subject = 'Sign Up With Otp'
                message = f'Hi {driver.email},\n Mail Sent Properly \n Otp is:- \'{driver.otp}\' \n Thank You' 
                email_from = settings.EMAIL_HOST_USER
                to_email = [raw,]
                send_mail(mail_subject, message, email_from, to_email)
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Email","otp":driver.otp,'Type':"Email","token":driver.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Email Is Not Found.!"})
    else:
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})
 
@api_view(["POST"])
def ForgotOtpSendDriver(request):
    data = request.data
    raw = data['email_or_num']
    getotp = genrateOtp()
    if(not raw):
        return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
    if(re.search(mobile_pattern,raw)):
        num = Driver.objects.filter(contact_no=raw).exclude(active_ac_with_otp='0')
        if len(num) > 0:
            driver = Driver.objects.get(id=num[0].id)
            if driver.status == 'Active':
                driver.otp = getotp
                driver.active_ac_with_otp = "2"
                driver.save()
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Text","otp":driver.otp,'Type':"Mobile","token":driver.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Number Is Not Found.!"})
    elif(re.search(email_pattern, raw)):
        mail = Driver.objects.filter(email=raw).exclude(active_ac_with_otp='0')
        if len(mail) > 0:
            driver = Driver.objects.get(id=mail[0].id)
            if driver.status == 'Active':
                driver.otp = getotp
                driver.active_ac_with_otp = "2"
                driver.save()
                    
                mail_subject = 'Forgot Password From Doxer'
                message = f'Hi {driver.email},\n Set New Password Help Of This Otp \n Your Otp is:- \'{driver.otp}\' \n Thank You' 
                email_from = settings.EMAIL_HOST_USER
                to_email = [raw,]
                send_mail(mail_subject, message, email_from, to_email)
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Email","otp":driver.otp,'Type':"Email","token":driver.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Email Is Not Found.!"})
    else:    
        return Response({'status' : 0 , 'msg' : "Email Or Number Not Found.!"})

@api_view(['POST'])
def ForgotSetPasswordDriver(request):
    data = request.data
    showtime = strftime("%Y-%m-%d %H:%M:%S", )
    raw = data['email_or_num'].casefold()
    otp = genrateOtp()
    if(not raw):
        return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
    
    password = data['password']
    cpassword = data['cpassword']
    
    if(not password):
        return Response({'status' : 0 , 'msg' : "Password Field Is Required"})
    if(not cpassword):
        return Response({'status' : 0 , 'msg' : "Confirm Password Field Is Required"})
    
    if password != cpassword:
        return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
    else:
        if(re.search(mobile_pattern,raw)):
            num = Driver.objects.filter(contact_no=raw)
            if len(num) > 0:
                dri = Driver.objects.get(id=num[0].id)
                dri.password = make_password(password)
                dri.cpassword = cpassword
                dri.active_ac_with_otp = '1'
                dri.update = showtime
                dri.otp = otp
                dri.save()
                return Response({'status' : 1 , 'msg' : "Password Updated"})
            else:
                return Response({'status' : 0 , 'msg' : "Email Or Phone Is Not Found"})
        elif(re.search(email_pattern, raw)):
            mail = Driver.objects.filter(email=raw)
            if len(mail) > 0:
                dri = Driver.objects.get(id=mail[0].id)
                dri.password = make_password(password)
                dri.cpassword = cpassword
                dri.active_ac_with_otp = '1'
                dri.update = showtime
                dri.otp = otp
                dri.save()
                return Response({'status' : 1 , 'msg' : "Password Updated"})
            else:
                return Response({'status' : 0 , 'msg' : "Email Or Phone Is Not Found"})
        else:
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})

@api_view(['POST'])
def AddRideForCar(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        pick = data['pickUp'].casefold()
        pickUp_latitude = data['pickUp_latitude']
        pickUp_longitude = data['pickUp_longitude']
        drop = data['dropout'].casefold()
        dropout_latitude = data['dropout_latitude']
        dropout_longitude = data['dropout_longitude']
        date = data['date']
        ls = data['route'].casefold()
        time = data['time'].upper()
        dtime = data['dtime'].upper()
        capacity = data['capacity']
        seats = data['seats']
        km = data['fees']
        
        route = []
        st = ""
        for i in ls:
            if i == '[':
                route.append(pick)
            else:
                st = st + f"{i.replace(',','').replace(']','')}"
                if i == ',':
                    route.append(st)
                    st = ''
                if i == ']':
                    route.append(st)
                    route.append(drop)
                    
        ca = data['carid']
        if ca == '0':
            return Response({'status':0,"msg": "Please Add Car"})
        add_information = data['add_information']
        per_price = data['per_km_price']
        pickup_address1 = data['pickup_address1']
        pickup_address2 = data['pickup_address2']
        dropout_address1 = data['dropout_address1']
        dropout_address2 = data['dropout_address2']
        getdriver = Driver.objects.get(id=pk)
        

        if(not pickUp_latitude):
            return Response({'status':0,"msg":"pickUp_latitude is Not Add"})
        if(not pickUp_longitude):
            return Response({'status':0,"msg":"pickUp_longitude is Not Add"})
        if(not dropout_latitude):
            return Response({'status':0,"msg":"dropout_latitude is Not Add"})
        if(not dropout_longitude):
            return Response({'status':0,"msg":"dropout_longitude is Not Add"})
        if(not pick):
            return Response({"status":0,"msg":"pick Point is not Add"})
        if(not drop):
            return Response({"status":0,"msg":"drop Point is not Add"})
        if(not date):
            return Response({"status":0,"msg":"select Date for Ride"})
        if(not getdriver):
            return Response({"status":0,"msg":"User Doesn't Login"})
        if(not time):
            return Response({'status':0,'msg':'Pick Up Time is Not Add'})
        if(not dtime):
            return Response({'status':0,'msg':'Drop off Time is Not Add'})
        if(not per_price):
            return Response({'status':0,'msg':'KM Is Required'})
        
        fees = round(float(km)) * int(per_price)

        getdriver.fare_per_km = per_price
        getdriver.save()
        
        cars = Vehicle.objects.get(id=ca)
        getname = getdriver.name if getdriver.name else getdriver.email_or_num
        tims = re.sub(" ","",time)
        
        ride_time = f"{str(date)} {str(convert(tims))}"
        rideserach = Ride.objects.filter(getdriver = getdriver,date = date,car = cars,publish='1',trip_status="P").exclude(status='2')
        
        if len(rideserach) > 0:
            for i in rideserach:
                print(i.id)
            return Response({"status" : 0 , "msg" : f"This Car Is Already Book For This Date {date}"})
        else:
            addrsd = Ride.objects.filter(
                as_user = 'Driver',
                getdriver = getdriver,
                pickUp = pick,
                dropout = drop,
                date = date,
                car = cars,
                ride_type = "C",
                publish = "0"
            )
            if len(addrsd) > 0:
                addrsd[0].pickUp_latitude = pickUp_latitude
                addrsd[0].pickUp_longitude = pickUp_longitude
                addrsd[0].car_latitude = pickUp_latitude
                addrsd[0].car_longitude = pickUp_longitude
                addrsd[0].dropout_latitude = dropout_latitude
                addrsd[0].dropout_longitude = dropout_longitude
                addrsd[0].capacity = capacity
                addrsd[0].seats = seats
                addrsd[0].Max_seats = seats
                addrsd[0].fees = fees
                addrsd[0].per_km = per_price
                addrsd[0].route = route
                addrsd[0].pickup_address1 = pickup_address1
                addrsd[0].pickup_address2 = pickup_address2
                addrsd[0].dropout_address1 = dropout_address1
                addrsd[0].dropout_address2 = dropout_address2
                addrsd[0].add_information = add_information
                addrsd[0].ride_time = ride_time
                addrsd[0].create_at = showtime
                addrsd[0].update_at = showtime
                addrsd[0].save()
                return Response({
                    "Ride_Id" : addrsd[0].id,
                    "status":1,
                    "msg":"Ride Added Successfully"
                    })
            else:
                addrid = Ride.objects.create(
                    as_user = 'Driver',
                    getdriver = getdriver,
                    pickUp_latitude = pickUp_latitude,
                    pickUp_longitude = pickUp_longitude,
                    car_latitude = pickUp_latitude,
                    car_longitude = pickUp_longitude,
                    dropout_latitude = dropout_latitude,
                    dropout_longitude = dropout_longitude,
                    pickUp = pick,
                    dropout = drop,
                    date = date,
                    per_km = per_price,
                    car = cars,
                    route = route,
                    time = time,
                    dtime = dtime,
                    ride_type = "C",
                    capacity = capacity,
                    seats = seats,
                    Max_seats = seats,
                    fees = fees,
                    pickup_address1 = pickup_address1,
                    pickup_address2 = pickup_address2,
                    dropout_address1 = dropout_address1,
                    dropout_address2 = dropout_address2,
                    # pet_allowed = pet,
                    # max_seat_in_back = seatinback,
                    # smoke_allowed = smoke,
                    ride_time = ride_time,
                    add_information = add_information,
                    create_at = showtime,
                    update_at = showtime
                )
                return Response({
                    "Ride_Id" : addrid.id,
                    "status":1,
                    "msg":"Ride Added Successfully"
                    })
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong Or Data Missing"})

@api_view(['POST'])
def AddRideForTruck(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        pick = data['pickUp'].casefold()
        pickUp_latitude = data['pickUp_latitude']
        pickUp_longitude = data['pickUp_longitude']
        drop = data['dropout'].casefold()
        dropout_latitude = data['dropout_latitude']
        dropout_longitude = data['dropout_longitude']
        date = data['date']
        time = data['time'].upper()
        dtime = data['dtime'].upper()
        pickup_address1 = data['pickup_address1']
        pickup_address2 = data['pickup_address2']
        dropout_address1 = data['dropout_address1']
        dropout_address2 = data['dropout_address2']
        capacity = data['capacity']
        fees = data['fees']
        ls = data['route']
        add_information = data['add_information']
        
        route = []
        st = ""
        for i in ls:
            if i == '[':
                route.append(pick)
            else:
                st = st + f"{i.replace(',','').replace(']','')}"
                if i == ',':
                    route.append(st)
                    st = ''
                if i == ']':
                    route.append(st)
                    route.append(drop)  
        getdriver = Driver.objects.get(id=pk)
        
        if(not pickUp_latitude):
            return Response({'status':0,"msg":"PickUp_latitude is Not Add"})
        if(not pickUp_longitude):
            return Response({'status':0,"msg":"DickUp_longitude is Not Add"})
        if(not dropout_latitude):
            return Response({'status':0,"msg":"Dropout_latitude is Not Add"})
        if(not dropout_longitude):
            return Response({'status':0,"msg":"dropout_longitude is Not Add"})
        if(not pick):
            return Response({"status":0,"msg":"Pick Point is not Add"})
        if(not drop):
            return Response({"status":0,"msg":"Drop Point is not Add"})
        if(not date):
            return Response({"status":0,"msg":"Select Date for Ride"})
        if(not time):
            return Response({"status":0,"msg":"Select Pick Up Time for Ride"})
        if(not dtime):
            return Response({"status":0,"msg":"Select Drop off Time for Ride"})
        if(not getdriver):
            return Response({"status":0,"msg":"User Doesn't Login"})
        if(not capacity):
            return Response({'status':0,'msg':'Parcel Capacity is Not Add'})
        if(not fees):
            return Response({'status':0,'msg':'Fees is Not Add'})
        tims = re.sub(" ","",time)
        ride_time = f"{str(date)} {str(convert(tims))}"
        addrid = Ride.objects.create(
            as_user = 'Driver',
            getdriver = getdriver,
            pickUp_latitude = pickUp_latitude,
            pickUp_longitude = pickUp_longitude,
            dropout_latitude = dropout_latitude,
            dropout_longitude = dropout_longitude,
            car_latitude = pickUp_latitude,
            car_longitude = pickUp_longitude,
            pickUp = pick,
            dropout = drop,
            date = date,
            time = time,
            dtime = dtime,
            ride_type = "T",
            seats = '0',
            route = route,
            capacity = capacity,
            fees = fees,
            add_information = add_information,
            publish = '1',
            pickup_address1 = pickup_address1,
            pickup_address2 = pickup_address2,
            dropout_address1 = dropout_address1,
            dropout_address2 = dropout_address2,
            ride_time = ride_time,
            create_at = showtime,
            update_at = showtime
        )
        # pickUp = addrid.pickUp_latitude , addrid.pickUp_longitude
        # dropout = addrid.dropout_latitude , addrid.dropout_longitude
        return Response({
            "Ride_Id" : addrid.id,
            "status":1,
            "msg":"Ride Added Successfully"
            })
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def RidePublishedStop(request,pk):
    try:
        rde = Ride.objects.get(id=pk,publish='1')
        if rde.trip_status == "P":
            ridepin = Ride_pin.objects.filter(getride=pk)
            for i in ridepin:
                if i.status == '1':
                    i.staus = '3'
                i.status = '3'
                i.save()
            rde.status = '3'
            rde.delete()
            return Response({"status" : 1,'msg': "Ride stop"})
        else:
            rde = Ride.objects.get(id=pk,publish='1')
            if rde.trip_status == "O":
                Trip = "On The Way"
            if rde.trip_status == "E":
                Trip = "End"
            return Response({"status" : 0,'msg': f"Ride Is {Trip}"})
    except ObjectDoesNotExist:
        return Response({"status" : 0,'msg': "Ride Not found"})

@api_view(['PUT'])
def AddInformationRide(request,pk):
    showtime = strftime("%Y-%m-%d %H:%M:%S", )
    try:
        data = request.data
        updateride = Ride.objects.get(id=pk,publish='1')
        updateride.driver = updateride.getdriver.name if updateride.getdriver.name else updateride.getdriver.email_or_num
        updateride.update = showtime
        getdrop = RideSerializer(updateride,data=data)
        if getdrop.is_valid():
            getdrop.save()
        updateride.save()
        return Response({"status" : "1",'msg': "Ride Publish","Ride_Id" : updateride.id})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['PUT'])
def UpdateDriver(request,pk):
    showtime = strftime("%Y-%m-%d %H:%M:%S", )
    try:
        data = request.data
        getdr = Driver.objects.get(id=pk)
        getdr.name = data['username'] if data['username'] else getdr.name
        # getdr.fare_per_km = data['per_km_price'] if data['per_km_price'] else getdr.fare_per_km
        getdr.email_or_num = getdr.email if getdr.email else getdr.contact_no
        email = data['email']
        num = data['contact_no']    
        if(re.search(email_pattern, email)):
            getmail = Driver.objects.filter(email=email)
            if len(getmail) > 0:
                for i in getmail:
                    if getdr.email == i.email:
                        getdr.email =getdr.email
                    elif email == i.email and getdr.email != i.email:
                        return Response({"status" : "0",'msg': "Email Is Already Used"})
                    else:
                        getdr.email = email
            else:
                getdr.email = email
        else:
            getdr.email = getdr.email
        
        if(re.search(mobile_pattern, num)):
            getnum = Driver.objects.filter(contact_no=num)
            if len(getnum) > 0:
                for i in getnum:
                    if getdr.contact_no == i.contact_no:
                        getdr.contact_no =getdr.contact_no
                    elif num == i.contact_no and getdr.contact_no != i.contact_no:
                        return Response({"status" : "0",'msg': "Mobile Num Is Already Used"})
                    else:
                        getdr.contact_no = num
            else:
                getdr.contact_no = num
        else:
            getdr.contact_no = getdr.contact_no
        
        getdr.gender = data['gender'] if data['gender'] else getdr.gender
        # getdr.dob = data['dob'] if data['dob'] else getdr.dob
        city = data['city']
        getdr.city = city.capitalize() if city.capitalize() else getdr.city
        # getdr.bio = data['bio'] if data['bio'] else getdr.bio
        try:
            getdr1 = data['pro_image']# if data['pro_image'] else  getdr.pro_image
            ex = getdr1.name
            if ex.endswith('.jpg'):
                getdr.pro_image = getdr1
            elif ex.endswith('.png'):
                getdr.pro_image = getdr1
            elif ex.endswith('.gif'):
                getdr.pro_image = getdr1
            elif ex.endswith('.jpeg'):
                getdr.pro_image = getdr1
            else:
                return Response({"status": 0, "msg" : "File Formate use jpg,jpeg,png"})
        except:
            getdr.pro_image = getdr.pro_image
        getdr.update = showtime
        getdr.save()
        name = getdr.name if getdr.name else getdr.email_or_num
        return Response({"status" : "1",'msg': f"{name.capitalize()} Is Updated","Driver_Id" : getdr.id})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def RequestForBooking(request,bid,did):
    showtime = strftime("%Y-%m-%d %H:%M:%S", )
    try:
        data = request.data
        ofprice = data['bid_price']
        ca = data['car']
        if ca == 'Truck':
            car = None
        else:
            car = Vehicle.objects.get(id=ca)
        bookingid = Ride.objects.get(id=bid,publish='1')
        if bookingid.status == '0':    
            driverid = Driver.objects.get(id=did)
            passid = Passanger.objects.get(id=bookingid.getpassenger.id)
            booking = Ride.objects.filter(getdriver=did,pickUp=bookingid.pickUp,dropout=bookingid.dropout,date=bookingid.date,as_user='Driver',ride_type=bookingid.ride_type)
            print(booking)
            if len(booking) > 0:
                rids = booking[0].id
                rid = Ride.objects.get(id=rids)
            else:
                rid = bookingid
            getbo = Ride_pin.objects.filter(getride=bookingid,getdriver=driverid,status='0')
            if getbo:
                return Response({"status": 0, "msg" : f"Already Request Send"})
            else:    
                createReq = Ride_pin.objects.create(
                    as_user = 'Driver_bid',
                    getdriver = driverid,
                    getride = bookingid,
                    getride1 = rid,
                    passengerid = passid,
                    car = car,
                    ride_type = bookingid.ride_type,
                    ride_date = bookingid.date,
                    ride_time = bookingid.dtime,
                    offer_price = ofprice,
                    pickUp = bookingid.pickUp,
                    dropout = bookingid.dropout,
                    fees = ofprice,
                    request_date = showtime,
                )
                return Response({"status": 1, "msg" : f"Request Send","Request_Book_Id" : createReq.id})
        else:
            return Response({"status": 0, "msg" : "Driver Select For This Ride"})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})
    # except KeyError:
    #     return Response({"status": 0, "msg" : "Please Update"})

@api_view(['GET'])
def GetOwnBookin_PinListing(request,pk):
    try:
        # status__range=['0','1']
        getreq = Ride_pin.objects.filter(getdriver=pk,as_user='Driver_bid').exclude(status='2')
        sr = DriverBookingpinSerializer(getreq,many=True)
        return Response({'status': 1, 'msg': 'success','data' : sr.data})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})        

@api_view(['GET'])
def PassengerProfileViewByPassenger(request,pk):
    try:
        getdri = Passanger.objects.get(id=pk)
        return Response({"status" : 1,"msg" : "Success",
                         "Passenger_name" : getdri.name,
                         "pro_image" : getdri.pro_image.url,
                         "Email" : getdri.email,
                         "Contact" : getdri.contact_no,
                         "Gender" : getdri.gender,
                         "dob" : getdri.dob,
                         "city" : getdri.city,
                         "bio" : getdri.bio,
                         })
    except ObjectDoesNotExist:
        return Response({"status" : 0,"msg" : "Id Not Found"})

@api_view(['GET'])
def RidesBookingFilter(request,pk):
    try:
        getr = Ride.objects.get(id=pk,publish='1')
        getreq = Ride_pin.objects.filter(getride=getr.id,status="1")
        sr = []
        for instance in getreq:
            ratw = Passenger_Rating.objects.filter(tri=instance.id,mine=instance.passengerid.id,driverid=instance.getdriver.id)
            repo = Passenger_Report.objects.filter(tri=instance.id,mine=instance.passengerid.id,driverid=instance.getdriver.id)
            representations = {}
            representations['bid'] = instance.id
            if len(ratw) > 0 or len(repo) > 0:
                representations['rat'] = "Yes"
                representations['report'] = "Yes"
            else:
                representations['rat'] = "No"
                representations['report'] = "No"
            representations['Passenger_id'] = instance.passengerid.id
            representations['passenger_name'] = instance.passengerid.name
            representations['passenger_profile'] = instance.passengerid.pro_image.url
            representations['for_passenger'] = instance.for_passenger
            representations['for_parcel'] = instance.for_parcel
            representations['Trip_status'] = instance.pas_status
            representations["Driver_Token"] = instance.getdriver.ntk
            representations["Passenger_Token"] = instance.passengerid.ntk
            representations['Location'] = instance.pickUp
            representations['fees'] = f"{instance.fees}"
            representations['Location_latitude'] = instance.pickUp_latitude
            representations['Location_longitude'] = instance.pickUp_longitude
            representations['Destination'] = instance.dropout
            representations['Destination_latitude'] = instance.dropout_latitude
            representations['Destination_longitude'] = instance.dropout_longitude
            representations['request_date'] = instance.request_date
            sr.append(representations)
        return Response({'status':1, 'msg':"Success",
                        "id": getr.id,
                        "driver": getr.getdriver.name,
                        "per_km_price" : f"{getr.getdriver.fare_per_km}",
                        "Profile": getr.getdriver.pro_image.url,
                        "pickUp": getr.pickUp,
                        "ride_type" : getr.ride_type,
                        "ride_status" : getr.trip_status,
                        "pickUp_latitude" : getr.pickUp_latitude,
                        "pickUp_longitude" : getr.pickUp_longitude,
                        "pickup_address1" : getr.pickup_address1,
                        "pickup_address2" : getr.pickup_address2,
                        "dropout": getr.dropout,
                        "dropout_latitude" : getr.dropout_latitude,
                        "dropout_longitude" : getr.dropout_longitude,
                        "dropout_address1" : getr.dropout_address1,
                        "dropout_address2" : getr.dropout_address2,
                        "time" : getr.time,
                        "dtime" : getr.dtime,
                        "seats": getr.seats,
                        "capacity": getr.capacity,
                        "date": getr.date,
                        "fees": f"{getr.fees}",
                        "add_information": getr.add_information,
                        "data":sr})      
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def RideListingOfFilter(request,pk):
    try:
        getreq = Ride_pin.objects.filter(getride=pk,status="0").exclude(as_user='Driver_bid')
        sr = MineRidepinSerializer(getreq,many=True)
        ride_st = Ride.objects.get(id=pk,publish='1')
        return Response({'status':1, 'msg':"Success",
                            "data":sr.data})      
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def DriverProfile(request,pk):
    try:
        driver = Driver.objects.get(id=pk)
        rea = Drivers_Rating.objects.filter(mine=pk)
        ls = []
        for i in rea:
            ls.append(int(i.rates))
        if ls == []:
            average = 0.0
        else:
            average = Average(ls) 
        getcar = Vehicle.objects.filter(driverid=pk,status='1')
        carss = ModelsSeializer(getcar,many=True)
        return Response({'status': 1, 'msg' : "Success",
                        'pro_image' : driver.pro_image.url,'username' : driver.name.capitalize(),'Total_rating': average,
                        'email' : driver.email,'contact_no' : driver.contact_no,"per_km_price" : f"{driver.fare_per_km}",
                        'gender' : driver.gender,'dob' : driver.dob,'city' : driver.city,
                        'bio' : driver.bio,'cars':carss.data})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def RejectRequestForTripByDriver(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        getbooking = Ride_pin.objects.get(id=pk)
        if getbooking.status == '0':
            getbooking.status = '2'
            getbooking.save()
            return Response({'status':1, 'msg': f"Request Rejected",'Driver_token':getbooking.getdriver.ntk,"Passenger_token":getbooking.passengerid.ntk})
        else:
            return Response({'status':0,'msg':'Request is Accpeted'})
    except ObjectDoesNotExist:
        return Response({"status" : "0",'msg': "Wrong Id"})

@api_view(['GET'])
def GetMyCarRide(request,pk):
    try:
        getdri = Driver.objects.get(id=pk)
        getride = Ride.objects.filter(getdriver=getdri,ride_type='C',publish='1').exclude(status='2').order_by('-trip_status','date')
        if getride:
            serial = CarRideFilterserializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Ride Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def GetMyTruckRide(request,pk):
    try:
        getdri = Driver.objects.get(id=pk)
        getride = Ride.objects.filter(getdriver=getdri,ride_type='T',publish='1').exclude(status='3').order_by('-trip_status')
        if len(getride) > 0:
            serial = TruckRideFilterserializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Ride Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def DriverChangePassword(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        data = request.data
        getdriver = Driver.objects.get(id=pk)
        curpass = data['curpass']
        npass = data['npass']
        ncpass = data['ncpass']
        pas = check_password(curpass, getdriver.password)
        if pas:
            if npass != ncpass:
                return Response({'status' : 0,'msg': 'New Password And Confirm Password Not Match..'})
            else:
                getdriver.password = make_password(npass)
                # getdriver.cpassword = make_password(ncpass)
                getdriver.cpassword = ncpass
                getdriver.update = showtime
                getdriver.save()
                return Response({'status':1,'msg':'Password Is Changed..'})
        else:
            return Response({'status':0,'msg':'Wrong Current Password'})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})

@api_view(['POST'])
def DriverAddCar(request,pk,mid):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        getdri = Driver.objects.get(id=pk)
        model = Car_name.objects.get(id=mid)
        if getdri:
            if model:
                rnum = data['reg_num']
                color = data['vehicle_color']
                ad = Vehicle.objects.filter(reg_num=rnum)
                if len(ad) > 0:
                    return Response({"status":0,"msg":"Register Number Is Already Used"})
                else:
                    addcar = Vehicle.objects.create(
                        driverid = getdri,
                        reg_num = rnum,
                        created = showtime,
                        vehical_variant = model,
                        vehicle_color = color
                    )
                    return Response({"status":1,"msg":"Vehicle Add Successfully","Car_id":addcar.id})
            else:
                return Response({"status":0,"msg":"Wrong Car's Id"})
        else:
            return Response({"status":0,"msg":"Wrong Driver's Id"})
    except ObjectDoesNotExist:
        return Response({"status":0,"msg":"Wrong Id"})

@api_view(['POST'])
def SerchBookingFilter(request,dd):
    data = request.data
    pickup = data['pickUp'].casefold()
    dropout = data['dropout'].casefold()
    pick = re.sub(" ","",pickup)
    drop = re.sub(" ","",dropout)
    date = data['date']
    driverid = data['driverid']
    book = Ride.objects.filter(ride_type=dd,pickUp__startswith=pick,dropout__startswith=drop,date=date,as_user="Passenger",publish='1',trip_status='P')
    if len(book) > 0:
        lis = []
        for i in book:
            res = {}
            if driverid:
                booki = Ride_pin.objects.filter(getride=i.id,getdriver=driverid).exclude(status='3')
                if booki:
                    res['bid_status'] = "Yes"
                else:
                    res['bid_status'] = "No"
            res['id'] = i.id
            res['Passanger_Id'] = i.getpassenger.id
            res['Passenger_name'] = i.getpassenger.name.capitalize()
            res['pro_image'] = i.getpassenger.pro_image.url
            res['pickUp'] = i.pickUp.capitalize()
            res['dropout'] = i.dropout.capitalize()
            res['date'] = i.date
            res['time'] = i.time
            res['dtime'] = i.dtime
            res['ride_status'] = i.status
            res['Passengers'] = i.seats
            res['Parcels'] = i.capacity
            lis.append(res)
        return Response({"status" : 1,"msg" : "success","data" :lis})
    else:
        return Response({'status': 0, 'msg':"Record Not Found"})

@api_view(['POST'])
def DriverGiveRating(request,Rid):
    try:
        showtime = strftime("%Y-%m-%d")
        data = request.data
        ra = float(data["rate"])
        rat = round(ra)
        review = data["review"]
        getride = Ride_pin.objects.get(id=Rid)
        getpas = Passanger.objects.get(id=getride.passengerid.id)
        getdri = Driver.objects.get(id=getride.getdriver.id)    
        rate = Passenger_Rating.objects.filter(
            mine = getpas,
            tri = getride,
            driverid = getdri,
        )
        if len(rate) > 0:
            return Response({'status':0,'msg' : 'Rating has been Given'})
        else:
            rat = Passenger_Rating.objects.create(
                mine = getpas,
                tri = getride,
                driverid = getdri,
                rates = rat,
                review = review,
                create = showtime,
            )
            return Response({'status':1,'msg' : 'Rating Add Successfully'})
    except ObjectDoesNotExist:
        return Response({'status':0,'msg' : 'Ride Is Not Found'})
        
@api_view(['GET'])
def DriverGetRating(request,pk):
    try:
        getdri = Driver.objects.get(id=pk)
        getride = Drivers_Rating.objects.filter(mine=getdri)
        if getride:
            serial = DriverGetRatingSeializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Rating List Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})
        
@api_view(['GET'])
def DriverDrivenRatingList(request,pk):
    try:
        getdri = Driver.objects.get(id=pk)
        getride = Passenger_Rating.objects.filter(driverid=getdri)
        if getride:
            serial = DriverDrivenRatingSeializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Rating List Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def CarsListing(request,pk):
    try:
        cas = Vehicle.objects.filter(driverid=pk,status='1')
        serial = CarListingSerializer(cas,many=True)
        return Response({"status":1,"msg":"Success",'data':serial.data})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})

@api_view(['POST'])
def AcceptRequestForTripByDriver(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        getbooking = Ride_pin.objects.get(id=pk)
        getbok = Ride.objects.get(id=getbooking.getride.id,publish='1')
        if getbok.ride_type == "C":
            if getbok.status == '0' :
                if getbooking.status == '0':
                    if int(getbooking.for_passenger):
                        if int(getbok.Max_seats) >= int(getbooking.for_passenger):
                            pas = getbok.Max_seats - getbooking.for_passenger
                            if pas == 0:
                                getbok.status = "1"
                                getbok.Max_seats = pas
                            else:
                                getbok.Max_seats = pas
                            getbok.save()
                            getbooking.status = "1"
                            getbooking.save()
                            return Response({'status':1, 'msg': f"Request Accept",'Driver_token':getbooking.getdriver.ntk,"Passenger_token":getbooking.passengerid.ntk})
                        else :
                            return Response({'status':0, 'msg': "You Have Limited Seats"})
                    if int(getbooking.for_parcel):
                        if int(getbok.Max_parcel) >= int(getbooking.for_parcel):
                            pas = getbok.Max_parcel - getbooking.for_parcel
                            if pas == 0:
                                getbok.status = "1"
                                getbok.Max_parcel = pas
                            else:
                                getbok.Max_parcel = pas
                            getbok.save()
                            getbooking.status = "1"
                            getbooking.save()
                            return Response({'status':1, 'msg': f"Request Accept",'Driver_token':getbooking.getdriver.ntk,"Passenger_token":getbooking.passengerid.ntk})
                        else :
                            return Response({'status':0, 'msg': "You Have Limited Capecity"})
                else :
                    return Response({'status':0, 'msg': "Passenger Request Accepted"})
            else :
                return Response({'status':0, 'msg': "Seats Full"})
        else:
            if getbok.status == '0' :
                getbooking.status = "1"
                getbooking.save()
                return Response({'status':1, 'msg': f"Request Accept",'Driver_token':getbooking.getdriver.ntk,"Passenger_token":getbooking.passengerid.ntk})
            else :
                return Response({'status':0, 'msg': "Seats Full"})
            
            return Response({'status':0, 'msg': "this Is Truck Ride"})
            
    except ObjectDoesNotExist:
        return Response({"status" : "0",'msg': "Wrong Id"})

@api_view(['POST'])
def SendIDProofe(request,pk):
    try:
        getdriver = Driver.objects.get(id=pk)
        data = request.data
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        # if getdriver.img_status == "0":
        try:
            image1 = data['image1']# if data['pro_image'] else  getdr.pro_image
            ex = image1.name
            if ex.endswith('.jpg'):
                getdriver.image1 = image1
            elif ex.endswith('.png'):
                getdriver.image1 = image1
            elif ex.endswith('.gif'):
                getdriver.image1 = image1
            elif ex.endswith('.jpeg'):
                getdriver.image1 = image1
            else:
                getdriver.image1 = getdriver.image1
                return Response({"status": 0, "msg" : "File Formate use jpg,jpeg,png"})
        except:
            getdriver.image1 = getdriver.image1
        try:
            image2 = data['image2']# if data['pro_image'] else  getdr.pro_image
            ex = image2.name
            if ex.endswith('.jpg'):
                getdriver.image2 = image2
            elif ex.endswith('.png'):
                getdriver.image2 = image2
            elif ex.endswith('.gif'):
                getdriver.image2 = image2
            elif ex.endswith('.jpeg'):
                getdriver.image2 = image2
            else:
                getdriver.image2 = getdriver.image2
                return Response({"status": 0, "msg" : "File Formate use jpg,jpeg,png"})
        except:
            getdriver.image2 = getdriver.image2
        # getdriver.img_status == "1"
        getdriver.save()
        return Response({"status": 1,"msg" : "Success","Proofe_id" : getdriver.id})
        # else:
        #     return Response({"status": 1,"msg" : "Document Updated"})
    except ObjectDoesNotExist:
        return Response({"status": 0,"msg" : "Wrong Id"})

@api_view(['GET'])
def MyIdProofe(request,pk):
    ids = Id_proofe.objects.filter(driverid=pk)
    prof = Id_proofeSerializerForDriver(ids,many=True)
    return Response({"status": 1,"msg" : "Success","Proofe_id" : prof.data})
    
@api_view(['POST'])
def CancelRideRequest(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        getbooking = Ride_pin.objects.get(id=pk)
        dird = Ride.objects.get(id=getbooking.getride.id)
        if dird.trip_status == 'P':
            if getbooking.status == '0' or getbooking.status == "1":
                getbooking.status = '3'
                getbooking.save()
                dird.status = '0'
                dird.save()
                getbooking.delete()
                return Response({'status':1 ,"msg":"Cancel Booking"})    
            else:
                return Response({'status':0 ,"msg":"Booking Already Reject Or Cancel"})
        else:
            return Response({'status': 0 ,"msg":"Booking Not Cancel"})    
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Ride Booking Id Not Found"})

@api_view(['POST'])
def ReportPassengerBehavior(request,Rid):
    try:
        showtime = strftime("%Y-%m-%d")
        data = request.data
        report_text = data["report_text"]
        getride = Ride_pin.objects.get(id=Rid)
        getpas = Passanger.objects.get(id=getride.passengerid.id)
        getdri = Driver.objects.get(id=getride.getdriver.id)    
        ratw = Passenger_Report.objects.filter(
            mine = getpas,
            tri = getride,
            driverid = getdri
        )
        if len(ratw) > 0:
            return Response({'status':0,'msg' : 'Report has been Given'})
        else:
            rat = Passenger_Report.objects.create(
                mine = getpas,
                tri = getride,
                driverid = getdri,
                report_text = report_text,
                create = showtime,  
            )
            getride.pas_status = 'E'
            getride.save()
            return Response({'status':1,'msg' : 'Report Add Successfully'})
    except ObjectDoesNotExist:
        return Response({'status':0,'msg' : 'Ride Is Not Found'})
    
@api_view(['POST'])
def AddHistory(request,pk):
    try:
        data = request.data
        showtime = strftime("%Y-%m-%d", )
        pick = data['pick']
        drop = data['drop']
        pick_lat = data['pick_lat']
        pick_lng = data['pick_lng']
        drop_lat = data['drop_lat']
        drop_lng = data['drop_lng']
        date = data['date']
        location = data['location']
        getdri = Driver.objects.get(id=pk)
        adda = Search_History.objects.filter(driverid = getdri,pick = pick,drop = drop,pick_lat = pick_lat,pick_lng = pick_lng,drop_lat = drop_lat,drop_lng = drop_lng,date = date,location = location,create = showtime,)
        if len(adda) > 0:
            for i in adda:
                i.delete()
            add = Search_History.objects.create(
                driverid = getdri,
                pick = pick,
                drop = drop,
                pick_lat = pick_lat,
                pick_lng = pick_lng,
                drop_lat = drop_lat,
                drop_lng = drop_lng,
                date = date,
                location = location,
                create = showtime,
            )
        else:
            add = Search_History.objects.create(
                driverid = getdri,
                pick = pick,
                drop = drop,
                pick_lat = pick_lat,
                pick_lng = pick_lng,
                drop_lat = drop_lat,
                drop_lng = drop_lng,
                date = date,
                location = location,
                create = showtime,
            )
        return Response({'status' : 1,'msg' : 'History Added'})
    except ObjectDoesNotExist:
        return Response({'status' : 0,'msg' : 'Driver Id Wrong'})

@api_view(['GET'])
def HistoryView(request,pk,ll):
    try:
        his = Search_History.objects.filter(driverid=pk,location=ll)[:4]
        if len(his)> 0:
            serial = HistoryViewForDriver(his,many=True)
            return Response({'status':1 ,"msg": "Success", 'data' : serial.data})
        else:
            return Response({'status':0 ,"msg": "No Record"})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg": "Fail"})
    
@api_view(['POST'])
def tripsetting(request,pk):
    try:
        date = datetime.date.today()
        yesterday = date - datetime.timedelta(days=1)
        tomorrow = date + datetime.timedelta(days=1)
        showtime1 = strftime("%Y-%m-%d", )
        hour = strftime("%H")
        mins = strftime("%M")
        ride = Ride.objects.get(id=pk,publish='1')
        rr = Ride_pin.objects.filter(getride=ride.id)
        hh = ride.ride_time.strftime("%H")
        mi = ride.ride_time.strftime("%M")
        mm = ride.ride_time.strftime("%I:%M %p")
        if ride.trip_status == 'P':
            if str(ride.date) == str(showtime1):
                if int(hh) <= int(hour):
                    if (int(mi) <= int(mins)) or (int(hh) < int(hour) and int(mi) >= int(mins)):
                        ride.trip_status = 'O'
                        for i in rr:
                            if i.status == '0':
                                i.status = '2'
                                i.save()
                        ride.save()
                        return Response({'status':1 ,"msg": f"Trip Started"})
                    else:
                        return Response({'status':0 ,"msg": f"Wait For Few Minutes"})
                else:
                    return Response({'status':0 ,"msg": f"Ride Can't start Beacuse Ride Time is {mm}","ride_date" : f"{mm}"})
            else:
                ride = Ride.objects.get(id=pk,publish='1')
                value = True
                i = 0
                while (value):
                    
                    yesterday = date - datetime.timedelta(days=i)
                    tomorrow = date + datetime.timedelta(days=i)
                    i = i + 1
                    if str(ride.date) == str(yesterday):
                        value = False
                        return Response({'status':0 ,"msg": f"This Ride Date Has A Previous Date {ride.date} which is Gone before {i} days Ago", "ride_date" : ride.date,"days" : i})
                    if str(ride.date) == str(tomorrow):
                        return Response({'status':0 ,"msg": f"Ride couldn't be able to start as it is on {ride.date} Please Come Again After {i} days", "ride_date" : ride.date,"days" : i})
                        value = False
                        
        if ride.trip_status == 'O':
            for i in rr:
                if i.status == '1':
                    i.pas_status = "E"
                    i.today = showtime1
                    i.save()
                if i.status == '2':
                    i.delete()    
            ride.trip_status = 'E'
            ride.save()
            return Response({'status':1 ,"msg": f"Trip Complete"})
        
        if ride.trip_status == 'E':
            return Response({'status':1 ,"msg": f"Trip Complete"})
              
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg": "Something Wrong"})

@api_view(['GET'])
def MyCars(request,pk):
    try:
        cars = Vehicle.objects.filter(driverid=pk,status='1')
        if cars:
            lius = [{'Cid':'0','car':"Select Car"}]
            for instance in cars:
                res = {}
                res['Cid'] = instance.id
                res['car'] = f"{instance.vehical_variant.brand} {instance.vehical_variant}"
                # res['car'] = f"{instance.vehical_variant}"
                lius.append(res)
            return Response({'status':1 ,"msg": f"Success",'data' : lius})
        else:
            return Response({'status':0 ,"msg": 'No Cars'})            
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg": 'ID Found'})

@api_view(['GET'])
def BlockStatusForDriver(request,pk):
    getd = Driver.objects.get(id=pk)
    if getd.status == 'Active':
        return Response({'status':0,'msg':'Unblock'})
    else:
        return Response({'status':1,'msg':'Block'})

@api_view(['POST'])
def ContactUsDriver(request):
    data = request.data
    name = data['name']
    email = data['email'].casefold()
    message = data['messages']
    if (not name):
        return Response({"status":0,"msg":'Name Is Required..!'})
    if (not email):
        return Response({"status":0,"msg":'Email Is Required..!'})
    if (not message):
        return Response({"status":0,"msg":'Message Is Required..!'})
    
    if(re.search(email_pattern, email)):
        mail_subject = f'Contact By {name} Regarding Doxer App'
        message = f'{name}\n{email}\n{message}' 
        email_from = settings.EMAIL_HOST_USER
        to_email = [email_from,]
        send_mail(mail_subject, message, f'{name}', to_email)
        return Response({'status' : 1,'msg':'Mail Sent Successfully'})
    else:
        return Response({'status' : 0 , 'msg' : "Email Is Not Proper"})
    
@api_view(['POST','PUT'])
def CurrentLoc(request,pk):
    try:
        data = request.data
        ar = Ride.objects.filter(getdriver=pk,publish='1')
        if len(ar) > 0:    
            for i in ar:
                if i.trip_status == 'O':
                    i.car_latitude = float(data['car_latitude']) if float(data['car_latitude']) else i.car_latitude
                    i.car_longitude = float(data['car_longitude']) if float(data['car_longitude']) else i.car_longitude
                    i.save()
                    return Response({'status':1 ,"msg": "success"})
                else:
                    return Response({'status':0 ,"msg": "Ride Is Not The Start"})
        else:
            return Response({'status':0 ,"msg": "No Ride Founded"})
    except ObjectDoesNotExist:
        return Response({'status':3 ,"msg": "Fail"})

@api_view(['GET'])
def RatingDetailsPageForRecieve(request,pk):
    rat = Drivers_Rating.objects.get(id=pk)
    context = {
        'status' : 1,
        'msg' : 'success',
        "Passenger_name" : rat.passengerid.name.capitalize(),
        "Passenger_pro_image" : rat.passengerid.pro_image.url,
        "ride_id" : rat.tri.id,
        "pickup" : rat.tri.pickUp.capitalize(),
        "dropout" : rat.tri.dropout.capitalize(),
        "ride_date" : rat.tri.date,
        "create" : rat.create,
        "rate" : float(rat.rates),
        "review" : rat.review,
    }
    return Response(context)
    
@api_view(['GET'])
def GivenRatingDetailsPageFor(request,pk):
    rat = Passenger_Rating.objects.get(id=pk)
    context = {
        'status' : 1,
        'msg' : 'success',
        "Passenger_name" : rat.mine.name.capitalize(),
        "Passenger_pro_image" : rat.mine.pro_image.url,
        "ride_id" : rat.tri.getride.id,
        "pickup" : rat.tri.getride.pickUp.capitalize(),
        "dropout" : rat.tri.getride.dropout.capitalize(),
        "ride_date" : rat.tri.getride.date,
        "create" : rat.create,
        "rate" : float(rat.rates),
        "review" : rat.review,
    }
    
    return Response(context)

@api_view(['GET'])
def BidDetalis(request,pk,dd):
    try:
        ri = Ride.objects.get(id=pk,publish='1')
        print(ri.as_user)
        if ri.as_user == 'Passenger':
            di = Ride_pin.objects.filter(getride=ri.id,getdriver=dd).exclude(status='2')            
            if di[0].status == '1':
                context = {
                    'status':1,
                    'msg':'success',
                    'id':ri.id,
                    # 'rate':rate,
                    # 'report':repo,
                    'pickup' : ri.pickUp.capitalize(),
                    'pickup_address1' : ri.pickup_address1.capitalize(),
                    'pickup_address2' : ri.pickup_address2.capitalize(),
                    'dropout' : ri.dropout.capitalize(),
                    'dropout_address1' : ri.dropout_address1.capitalize(),
                    'dropout_address2' : ri.dropout_address2.capitalize(),
                    'ride_type' : ri.ride_type,
                    'trip_pas_status' : ri.trip_status,
                    'seat' : ri.seats,
                    'time' : ri.time,
                    'dtime' : ri.dtime,
                    'capacity' : ri.capacity,
                    'Passenger_id' : ri.getpassenger.id,
                    'Passenger_name' : ri.getpassenger.name.capitalize(),
                    'Passenger_image' : ri.getpassenger.pro_image.url,
                    'fees' : f"{di[0].fees}",
                    }
                return Response(context)
            else:
                context = {
                    'status':1,
                    'msg':'success',
                    'id':ri.id,
                    # 'rate':rate,
                    # 'report':repo,
                    'pickup' : ri.pickUp.capitalize(),
                    'pickup_address1' : ri.pickup_address1.capitalize(),
                    'pickup_address2' : ri.pickup_address2.capitalize(),
                    'dropout' : ri.dropout.capitalize(),
                    'dropout_address1' : ri.dropout_address1.capitalize(),
                    'dropout_address2' : ri.dropout_address2.capitalize(),
                    'ride_type' : ri.ride_type,
                    'time' : ri.time,
                    'dtime' : ri.dtime,
                    'trip_pas_status' : ri.ride_type,
                    'seat' : ri.seats,
                    'capacity' : ri.capacity,
                    'Passenger_id' : "",
                    'Passenger_name' : "",
                    'Passenger_image' : "",
                    'fees' : f"{di[0].fees}",
                    }
                return Response(context)
        else:
            return Response({"status":0,'msg':'No Record'})
    except:
        return Response({"status":0,'msg':'Wrong Id'})
