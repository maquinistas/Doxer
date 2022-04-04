from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import *
from .models import *
from django.conf import settings
from django.core.exceptions import *
from django.core.mail import send_mail
from django.contrib.auth.hashers  import make_password,check_password
from time import strftime
from django.db.models import Max
# from django.template.loader import render_to_string

# Create your views here.

email_pattern = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$' 
mobile_pattern = '^[0-9]{10}$'


# from datetime import datetime
# time = datetime.now().time()
# print(time)
# start_week = date - datetime.timedelta(date.weekday())
# end_week = start_week + datetime.timedelta(7)
# entries = Entry.objects.filter(created_at__range=[start_week, end_week])



import math,random
import re
def genrateOtp():
    digits = '0123456789'
    OTP = ''
    for i in range(4):
        OTP += digits[math.floor(random.random()*10)]
    return OTP

#   ____      ____   
#  |    \    /    \     
#  |____/   |______|     
#  |        |      |     
#  |        |      |  

@api_view(['POST'])
def SignUpPassanger(request):
    if request.method  == "POST":
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        name = data['name'].casefold()
        raw = data['email_or_num'].casefold()
        nks =data['token']
        password = data['password']
        cpassword = data['cpassword']
        otp = genrateOtp()
        if(not raw):
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
        if(not password):
            return Response({'status' : 0 , 'msg' : "Password Field Is Required"})
        if(not cpassword):
            return Response({'status' : 0 , 'msg' : "Confirm Password Field Is Required"})
        
        if(re.search(mobile_pattern,raw)):
            em = '' 
            num = Passanger.objects.filter(contact_no=raw)
            if len(num) > 0:
                getid = Passanger.objects.get(id=num[0].id)
                if getid.active_ac_with_otp == '0':
                    if password != cpassword:
                            return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
                    else:
                        getid.password = make_password(password)
                        getid.cpassword = cpassword
                        getid.otp = otp
                        getid.name = name
                        getid.ntk = nks
                        getid.create = showtime
                        getid.update = showtime
                        getid.save()
                        return Response({'status' : 1,'msg':'Passanger Register Succesfully','Id' :getid.id,'Type':"Mobile",'OTP':getid.otp})
                else:
                    return Response({'status' : 0 , 'msg' : "Phone Num Is Alread Use"})
            else:
                mo = raw     
        elif(re.search(email_pattern, raw)):
            mo = ''
            mail = Passanger.objects.filter(email=raw)
            if len(mail) > 0:
                getid = Passanger.objects.get(id=mail[0].id)
                if getid.active_ac_with_otp == '0':
                    if password != cpassword:
                            return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
                    else:
                        getid.password = make_password(password)
                        getid.cpassword = cpassword
                        getid.otp = otp
                        getid.name = name
                        getid.ntk = nks
                        getid.create = showtime
                        getid.update = showtime
                        getid.save()
                        mail_subject = 'Otp Sent With API.'
                        # message = render_to_string('doxer_admin/mail.html', {
                        #     'name': getid.name.capitalize(),
                        #     'otp': getid.otp,
                        # })
                        message = f'Hi {getid.email},\n Mail Sent Properly \n Otp is:-\'{getid.otp}\'\n Thank You' 
                        email_from = settings.EMAIL_HOST_USER
                        to_email = [getid.email,]
                        send_mail(mail_subject, message, email_from, to_email)
                        return Response({'status' : 1,'msg':'Passanger Register Succesfully','Id' :getid.id,'Type':"Email",'OTP':getid.otp})
                else:
                    return Response({'status' : 0 , 'msg' : "Email Is Alread Use"})
            else:
                em = raw  
        else:
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})
        
    if password != cpassword:
        return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
    else:
        passanger = Passanger.objects.create(
            email_or_num = raw,
            email = em,
            name = name,
            ntk = nks,
            contact_no= mo,
            password = password,
            cpassword = cpassword,
            status = 'Active',
            create = showtime,
            update = showtime,
        )
        passanger.password = make_password(passanger.password)
        passanger.cpassword = passanger.cpassword
        passanger.otp = otp
        passanger.save()
        serial = PassangerSerializer(passanger,many=False)
        if passanger.email:
            types = 'Email'
            mail_subject = 'Otp Sent With API.'
            message = f'Hi {passanger.email},\n Mail Sent Properly \n Otp is:-\'{passanger.otp}\'\n Thank You' 
            # message = render_to_string('doxer_admin/mail.html', {
            #                             'name': passanger.name.capitalize(),
            #                             'otp': passanger.otp,
            # })
            email_from = settings.EMAIL_HOST_USER
            to_email = [raw,]
            send_mail(mail_subject, message, email_from, to_email)
            
        if passanger.contact_no:
            types = 'Mobile'
            
        return Response({'status' : 1,'msg':'Passanger Register Succesfully','Id' :passanger.id,'Type':types,'OTP':passanger.otp})

@api_view(['POST'])
def LoginPassanger(request):
    data = request.data
    raw = data['email_or_num'].casefold()
    getpass = data['password']
    nks = data['token']
    if(not raw):
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Required"})
    if(not getpass):
            return Response({"status" : 0 , "msg" : "Password Field Is Required"})
        
    if(re.search(mobile_pattern,raw)):
        print("this is Num")
        num = Passanger.objects.filter(contact_no=raw)
        if len(num) > 0:
            pas = Passanger.objects.get(id=num[0].id)
            if pas.active_ac_with_otp == "0":
                return Response({"status" : 0 , "msg" : "Account Is Not Created",})
            else:
                if pas.status == 'Active':
                    passwrd = check_password(getpass, pas.password)
                    if passwrd:
                        dri = Passanger.objects.get(id=pas.id)
                        dri.ntk = nks
                        dri.save()
                        Passenger_name = dri.name #if dri.name else dri.email_or_num
                        return Response({"status" : 1 , "msg" : "Login Success","id":dri.id,"Passenger_name":Passenger_name})
                    else:
                        return Response({"status" : 0 , "msg" : "Password Is Wrong"})
                else:
                    return Response({"status" : 0 , "msg" : "Account Is Blocked",})
        else:
            return Response({"status" : 0 , "msg" : "Unknow User"})
    elif(re.search(email_pattern, raw)):
        mail = Passanger.objects.filter(email=raw)
        if len(mail) > 0:
            pas = Passanger.objects.get(id=mail[0].id)
            if pas.active_ac_with_otp == "0":
                return Response({"status" : 0 , "msg" : "Account Is Not Created",})
            else:
                if pas.status == 'Active':
                    passwrd = check_password(getpass, pas.password)
                    if passwrd:
                        dri = Passanger.objects.get(id=pas.id)
                        dri.ntk = nks
                        dri.save()
                        Passenger_name = dri.name #if dri.name else dri.email_or_num
                        return Response({"status" : 1 , "msg" : "Login Success","id":dri.id,'Passenger_name':Passenger_name})
                    else:
                        return Response({"status" : 0 , "msg" : "Password Is Wrong"})
                else:
                    return Response({"status" : 0 , "msg" : "Account Is Blocked",})
        else:
            return Response({"status" : 0 , "msg" : "Unknow User"})  
    else:
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Not Valid"})
    
@api_view(['POST'])
def VerifyOtpPassanger(request):
    data = request.data
    raw = data['email_or_num'].casefold()
    getotp = data['otp']
    newotp = genrateOtp()
    if(not raw):
        return Response({"status" : 0 , "msg" : "Email Or Phone Number Is Required"})
    if(not getotp):
            return Response({"status" : 0 , "msg" : "OTP Field Is Required"})
        
    if(re.search(mobile_pattern,raw)):
        print("this is Num")
        num = Passanger.objects.filter(contact_no=raw)
        if len(num) > 0:
            dri = Passanger.objects.get(id=num[0].id)
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
    elif(re.search(email_pattern, raw)):
        mail = Passanger.objects.filter(email=raw)
        if len(mail) > 0:
            dri = Passanger.objects.get(id=mail[0].id)
            if dri.active_ac_with_otp == "1":
                return Response({"status" : 1 , "msg" : "Otp Already Verify",'id':dri.id})
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
def ResendOtpPassanger(request):
    data = request.data
    raw = data['email_or_num']
    getotp = genrateOtp()
    if(not raw):
        return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
    if(re.search(mobile_pattern,raw)):
        num = Passanger.objects.filter(contact_no=raw,active_ac_with_otp="0")
        if len(num) > 0:
            passanger = Passanger.objects.get(id=num[0].id)
            if passanger.status == 'Active':
                passanger.otp = getotp
                passanger.save()
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Text",'Type':"Mobile","OTP":passanger.otp})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Not Created"})
        else:
            return Response({'status' : 0 , 'msg' : "Number Is Not Found.!"})
    elif(re.search(email_pattern, raw)):
        mail = Passanger.objects.filter(email=raw,active_ac_with_otp='0')
        if len(mail) > 0:
            passanger = Passanger.objects.get(id=mail[0].id)
            if passanger.status == 'Active':
                passanger.otp = getotp
                passanger.save()
                mail_subject = 'Otp Sent With API.'
                message = f'Hi {passanger.email},\n Mail Sent Properly \n Otp is:- \'{passanger.otp}\' \n Thank You' 
                email_from = settings.EMAIL_HOST_USER
                to_email = [raw,]
                send_mail(mail_subject, message, email_from, to_email)
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Email",'Type':"Email","OTP":passanger.otp})
            else:
                return Response({'status' : 0 , 'msg' : "Account Is Not Created"})
        else:
            return Response({'status' : 0 , 'msg' : "Email Is Not Found.!"})
    else:
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})

@api_view(["POST"])
def ForgotOtpSendPassanger(request):
    data = request.data
    raw = data['email_or_num']
    getotp = genrateOtp()
    if(not raw):
        return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
    
    if(re.search(mobile_pattern,raw)):
        num = Passanger.objects.filter(contact_no=raw).exclude(active_ac_with_otp='0')
        if len(num) > 0:
            passanger = Passanger.objects.get(id=num[0].id)
            if passanger.status == 'Active':
                passanger.otp = getotp
                passanger.active_ac_with_otp = "2"
                passanger.save()
                print('Message Is Not Send')
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Text",'Type':"Mobile","OTP":passanger.otp,"token":passanger.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Number Is Not Found.!"})
    elif(re.search(email_pattern, raw)):
        mail = Passanger.objects.filter(email=raw).exclude(active_ac_with_otp='0')
        if len(mail) > 0:
            passanger = Passanger.objects.get(id=mail[0].id)
            if passanger.status == 'Active':
                passanger.otp = getotp
                passanger.active_ac_with_otp = "2"
                passanger.save()
                    
                mail_subject = 'Forgot Password Otp From Doxer'
                message = f'Hi {passanger.email},\n Set New Password Help of This Otp. \n Your Otp is:- {passanger.otp} \n Thank You' 
                email_from = settings.EMAIL_HOST_USER
                to_email = [raw,]
                send_mail(mail_subject, message, email_from, to_email)
                return Response({'status' : 1 , 'msg' : "Otp Send Successfully Via Email",'Type':"Email","OTP":passanger.otp,"token":passanger.ntk})
            else:
                return Response({'status' : 0 , 'msg' : "Account is Blocked"})
        else:
            return Response({'status' : 0 , 'msg' : "Email Is Not Found.!"})
    else:
        return Response({'status' : 0 , 'msg' : "Email Or Number Not Found.!"})

@api_view(['POST'])
def ForgotSetNewPasswordPassenger(request):
    if request.method  == "POST":
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        data = request.data
        raw = data['email_or_num'].casefold()
        otp = genrateOtp()
        print(otp,'------------------>')
        if(not raw):
            return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Required"})
        
        password = data['password']
        cpassword = data['cpassword']
        
        if(not password):
            return Response({'status' : 0 , 'msg' : "Password Doesn't Match.!"})
        if(not cpassword):
            return Response({'status' : 0 , 'msg' : "Confirm Password Field Is Required"})
        
        if password != cpassword:
            return Response({'status' : 0 , 'msg' : "Password Doesn't Match"})
        else:    
            if(re.search(mobile_pattern,raw)):
                print("this is Num")
                num = Passanger.objects.filter(contact_no=raw)
                if len(num) > 0:
                    pas = Passanger.objects.get(id=num[0].id)
                    pas.password = make_password(password)
                    pas.cpassword = cpassword
                    pas.active_ac_with_otp = '1'
                    pas.otp = otp
                    pas.update = showtime
                    pas.save()
                    return Response({'status' : 1 , 'msg' : "Password Updated"})
                else:
                    return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Found"})
            elif(re.search(email_pattern, raw)):
                print("this is email")
                mail = Passanger.objects.filter(email=raw)
                if len(mail) > 0:
                    pas = Passanger.objects.get(id=mail[0].id)
                    pas.password = make_password(password)
                    pas.cpassword = cpassword
                    pas.active_ac_with_otp = '1'
                    pas.update = showtime
                    pas.otp = otp
                    pas.save()
                    return Response({'status' : 1 , 'msg' : "Password Updated"})
                else:
                    return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Found"})
            else:
                return Response({'status' : 0 , 'msg' : "Email Or Phone Number Is Not Valid"})

@api_view(['PUT'])
def UpdatePassenger(request,pk):
    try:
        data = request.data
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        getpas = Passanger.objects.get(id=pk)
        getpas.name = data['username'] if data['username'] else getpas.name
        getpas.email_or_num = getpas.email if getpas.email else getpas.contact_no
        try:
            getdr1 = data['pro_image']# if data['pro_image'] else  getdr.pro_image
            ex = getdr1.name
            if ex.endswith('.jpg'):
                getpas.pro_image = getdr1
            elif ex.endswith('.png'):
                getpas.pro_image = getdr1
            elif ex.endswith('.gif'):
                getpas.pro_image = getdr1
            elif ex.endswith('.jpeg'):
                getpas.pro_image = getdr1
            else:
                return Response({"status": 0, "msg" : "File Formate use jpg,jpeg,png"})
        except:
            getpas.pro_image = getpas.pro_image
        # getpas.pro_image = data['pro_image'] if data['pro_image'] else getpas.pro_image
        email = data['email']
        num = data['contact_no']    
        if(re.search(email_pattern, email)):
            getmail = Passanger.objects.filter(email=email)
            if len(getmail) > 0:
                for i in getmail:
                    if getpas.email == i.email:
                        getpas.email =getpas.email
                    elif email == i.email and getpas.email != i.email:
                        return Response({"status" : "0",'msg': "Email Is Already Used"})
                    else:
                        print('Email Not Use')
                        getpas.email = email
            else:
                getpas.email = email
        else:
            getpas.email = getpas.email
        
        if(re.search(mobile_pattern, num)):
            getnum = Passanger.objects.filter(contact_no=num)
            if len(getnum) > 0:
                for i in getnum:
                    if getpas.contact_no == i.contact_no:
                        getpas.contact_no =getpas.contact_no
                    elif num == i.contact_no and getpas.contact_no != i.contact_no:
                        return Response({"status" : "0",'msg': "Mobile Num Is Already Used"})
                    else:
                        print('Number Not Use')
                        getpas.contact_no = num
            else:
                getpas.contact_no = num
        else:
            getpas.contact_no = getpas.contact_no
        getpas.gender = data['gender'] if data['gender'] else getpas.gender
        # getpas.dob = data['dob'] if data['dob'] else getpas.dob
        getpas.city = data['city'] if data['city'] else getpas.city
        # getpas.bio = data['bio'] if data['bio'] else getpas.bio
        getpas.update = showtime
        getpas.save()
        name = getpas.name if getpas.name else getpas.email_or_num
        return Response({"status" : "1",'msg': f"'{name}' Passenger Is Updated","Driver Id" : getpas.id})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def RequestForRide(request,pid,rid):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        ridegid = Ride.objects.get(id=rid)
        data = request.data
        pas = data['passenger']
        print(pas)
        par = data['parcel']
        print(par)
        if ridegid.ride_type == "C":
            if(not par):
                par = 0
                pas = pas
                muls = ridegid.fees * int(pas)
            if(not pas):
                pas = 0
                par = par
                muls = ridegid.fees * int(par)
            
            if pas and par:
                pas = pas
                par = par
                pasw = ridegid.fees * int(pas)
                parw = ridegid.fees * int(par)
                muls = pasw + parw
        
        if ridegid.ride_type == "T":
                pas = 0
                par = par
                muls = ridegid.fees * int(par)
            
        if ridegid.status == '0':
            pasid = Passanger.objects.get(id=pid)
            driid = ridegid.getdriver
            getdr = Driver.objects.get(id=driid.id)
            getbo = Ride_pin.objects.filter(getride=ridegid,passengerid=pasid,status='0')
            if getbo:
                return Response({"status": 0, "msg" : f"Already Booked"})
            else:      
                createReq = Ride_pin.objects.create(
                    as_user = 'Passenger_bid',
                    getdriver = getdr,
                    getride = ridegid,
                    ride_type = ridegid.ride_type,
                    ride_date = ridegid.date,
                    ride_time = ridegid.time,
                    for_passenger = pas,
                    fees = muls,
                    pickUp = ridegid.pickUp,
                    dropout = ridegid.dropout,
                    for_parcel = par,
                    passengerid = pasid,
                    request_date = showtime,
                )
                return Response({"status": 1, "msg" : f"Request Send To {getdr}","Request_Book_Id" : createReq.id,"Driver_token":getdr.ntk,"Passenger_token":pasid.ntk})
        else:
            return Response({"status": 0, "msg" : "This Ride Full"})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"}) 

@api_view(['POST'])
def AcceptRequestForTripByPassenger(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        getbooking = Ride_pin.objects.get(id=pk)
        getbok = Ride.objects.get(id=getbooking.getride1.id)
        if getbooking.status == '0':
            getbooking.status = "1"
            getbok.status = "1"
            getbooking.save()
            getbok.save()
            return Response({'status':1, 'msg': f"Req Accept"})
        else:
            return Response({'status':0, 'msg': "Something Wrong"})
    except ObjectDoesNotExist:
        return Response({"status" : "0",'msg': "Wrong Id"})

@api_view(['POST'])
def RejectRequestForTripByPassenger(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        getbooking = Ride_pin.objects.get(id=pk)
        if getbooking.status == '0':
            # getbooking.delete()
            getbooking.status = '3'
            getbooking.save()
            return Response({'status':1, 'msg': f"Request Rejected"})
        else:
            return Response({'status':0,'msg':'Request is Accpeted'})
    except ObjectDoesNotExist:
        return Response({"status" : "0",'msg': "Wrong Id"})

# Passanger Own Requestes
@api_view(['GET'])
def ViewPassengerRide(request,pk):
    try:
        getpas = Ride.objects.get(id=pk)
        getreq = Ride_pin.objects.filter(getride1=getpas.id,status='0',as_user='Driver_bid')
        sr = BookingpinSerializer(getreq,many=True)
        return Response({'status': 1, 'msg': 'success',
                        'data' : sr.data})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})        

@api_view(['GET'])
def PassengerProfile(request,pk):
    try:
        pas = Passanger.objects.get(id=pk)
        serializer = getPassangerSerializer(pas)
        return Response(serializer.data)
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def SearchForRide(request,dd):
    data = request.data
    pickup = data["pickUp"]
    dropout = data["dropout"]
    date = data["date"]  
    if pickup and dropout:
        pp = Ride.objects.filter(ride_type=dd,pickUp=pickup,dropout=dropout,date=date,status='0',trip_status='P',as_user = 'Driver').exclude(status='3')
        if len(pp) > 0:
            serial = Filterserializer(pp,many=True)
            return Response({'status':1 ,"msg":"Success", 'data':serial.data})    
        else:
            return Response({'status':0 ,"msg":"No Record Founded"})    
    else:
        return Response({'status':0 ,"msg":"No Record Founded"})    

@api_view(['GET'])
def FilterRideType(request,pk):
    try:
        pp = Ride.objects.filter(ride_type=pk,status='0')
        if len(pp) > 0:
            serial = Filterserializer(pp,many=True)
            return Response({"status": 1,"msg": "success","data": serial.data})
        else:
            return Response({'status':0 ,"msg":"Record Not Founded"})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})

@api_view(['GET'])
def ViewRideDetails(request,pk,pp):
    try:
        pa = Passanger.objects.get(id=pp)
        getr = Ride.objects.get(id=pk)
        if getr.status == '0' :
            getq = Ride_pin.objects.filter(getride=pk,status='1').exclude(passengerid=pp)
            sera = RidepinSerializer(getq,many=True)
            if getr.ride_type == 'C':
                return Response({'status':1, 'msg':"Success","ride_type" : getr.ride_type,"driver_id": getr.getdriver.id,"driver": getr.getdriver.name,"Profile": getr.getdriver.pro_image.url,"car_name": f"{getr.car.vehical_variant.brand.brand} {getr.car.vehical_variant.cars}","car_color": getr.car.vehicle_color,"pickUp": getr.pickUp,"dropout": getr.dropout,"seats": getr.seats,"capacity": getr.capacity,"date": getr.date,"adda" : getr.status,"fees": f"{getr.fees}","add_information": getr.add_information,'data' : sera.data})
            if getr.ride_type == 'T':
                return Response({'status':1, 'msg':"Success","ride_type" : getr.ride_type,"driver_id": getr.getdriver.id,"driver": getr.getdriver.name,"Profile": getr.getdriver.pro_image.url,"pickUp": getr.pickUp,"dropout": getr.dropout,"seats": getr.seats,"capacity": getr.capacity,"date": getr.date,"adda" : getr.status,"fees": f"{getr.fees}","add_information": getr.add_information,'data' : sera.data})
        else:
            return Response({'status' : 0,'msg':'No Ride'})
        # # getride = Ride.objects.get(id=pk)
        # # if getride.status == "0":
        # #     pcity = Cities.objects.get(id=getride.pickUp.id)
        # #     dcity = Cities.objects.get(id=getride.dropout.id)
        # #     driver = Driver.objects.get(id=getride.getdriver.id)
        # #     dnmae = driver.name
        # #     return Response({'status':1, 'msg':"Success",
        # #                 'driver_id' : getride.getdriver.id,
        # #                 'driver_name' : dnmae,
        # #                 'driver_profile' : getride.getdriver.pro_image.url,
        # #                 'ride_type' : getride.ride_type,
        # #                 'capacity' : getride.capacity,
        # #                 'pickUp' : pcity.name,
        # #                 # 'pickUp_latitude' : getride.pickUp_latitude,
        # #                 # 'pickUp_longitude' : getride.pickUp_longitude,
        # #                 'dropout' : dcity.name,
        # #                 # 'dropout_latitude' : getride.dropout_latitude,
        # #                 # 'dropout_longitude' : getride.dropout_longitude,
        # #                 'date' : getride.date,
        # #                 'seats' : getride.seats,
        # #                 'fees' : getride.fees,
        # #                 'add_information' : getride.add_information,
        # #                 }) 
        # else:
        #     return Response({'status':0,'msg':'No Ride Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def PassengerChangePassword(request,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        data = request.data
        getdriver = Passanger.objects.get(id=pk)
        curpass = data['curpass']
        print(curpass)
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
def PassengerAddBooking(request,pk):
    try:
        data = request.data
        pickUp = data["pickUp"]
        dropout = data["dropout"]
        pickUp_lat = data["pickUp_lat"]
        dropout_lat = data["dropout_lat"]
        pickUp_lan = data["pickUp_lan"]
        dropout_lan = data["dropout_lan"]
        date = data["date"]
        time = data["time"]
        passenger = data["passenger"]
        parcel = data["parcel"]
        pickup_address1 = data['pickup_address1']
        pickup_address2 = data['pickup_address2']
        dropout_address1 = data['dropout_address1']
        dropout_address2 = data['dropout_address2']
        showtime = strftime("%Y-%m-%d %H:%M:%S", )
        getpas = Passanger.objects.get(id=pk)
        getname = getpas.name if getpas.name else getpas.email_or_num 
        if (not parcel):
            parcel = '0'
        if (not passenger):
            passenger = '0'
        if parcel != '0' and passenger != '0':
            typ = 'C'
        elif passenger != '0':
            typ = 'C'
        elif parcel != '0':
            typ = 'T'  
        else:
            pass
        
        if(not pickUp):
            return Response({'status':0,'msg': 'PickUp Is Not Added..'})
        if(not dropout):
            return Response({'status':0,'msg': 'Dropout Is Not Added..'})
        if(not date):
            return Response({'status':0,'msg': 'Date Is Not Added..'})
        
        addbooking = Ride.objects.create(
            as_user = 'Passenger',
            getpassenger = getpas,
            capacity = parcel,
            seats = passenger,
            ride_type = typ,
            pickUp_latitude = pickUp_lat,
            pickUp_longitude = pickUp_lan,
            dropout_latitude = dropout_lat,
            dropout_longitude = dropout_lan,
            pickup_address1 = pickup_address1,
            pickup_address2 = pickup_address2,
            dropout_address1 = dropout_address1,
            dropout_address2 = dropout_address2,
            pickUp = pickUp,
            dropout = dropout,
            date = date,
            time = time,
            create_at = showtime,
            update_at = showtime
        )
        return Response({
                "Booking_Id" : addbooking.id,
                "status":1,
                "msg":"Booking Added Successfully"
                })
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def BookingPublishedStop(request,pk):
    try:
        rde = Ride.objects.get(id=pk)
        bookingpin = Ride_pin.objects.filter(getbooking=pk)
        for i in bookingpin:
            if i.status == '1':
                i.staus = '3'
            i.status = '3'
            i.save()
        rde.status = '3'
        rde.save()
        return Response({"status" : 1,'msg': "Ride Request stop"})
    except ObjectDoesNotExist:
        return Response({"status" : 0,'msg': "Ride Request Not found"})

# I'm Get My Ride Listing Now
@api_view(['GET'])
def PassengerRideList(request,pk):
    try:
        getpas = Passanger.objects.get(id=pk)
        bb = Ride.objects.filter(getpassenger=pk).exclude(status='3')
        print(bb)
        lis = []
        for i in bb:
            if i.status == '0' or i.status == '1':
                bb2 = Ride_pin.objects.filter(getride1=i.id,status='1')
                representation = {}
                representation["id"] = i.id
                representation["Passanger_Id"] = i.getpassenger.id
                representation["Passenger_name"] = i.getpassenger.name
                representation["pickUp"] = i.pickUp
                representation["dropout"] = i.dropout
                representation["date"] = i.date
                representation["ride_status"] = i.status
                representation["trip_pas_status"] = i.trip_status
                if i.status == '1':
                    for bb2 in bb2:
                        representation["Driver_name"] = bb2.getdriver.name
                        representation["Driver_Image"] = bb2.getdriver.pro_image.url
                        representation["offer_price"] = bb2.offer_price
                        if bb2.pas_status == "W":
                            representation["trip_pas_status"] = "P"
                        else:
                            representation["trip_pas_status"] = bb2.pas_status
                representation["Passengers"] = i.seats
                representation["Parcels"] = i.capacity
                lis.append(representation)
                
        return Response({"status": 1,"msg": "success","data": lis})
            
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})

@api_view(['GET'])
def PassengerBookingList(request,pk):
    try:
        bb = Ride_pin.objects.filter(passengerid=pk,ride_type="C",as_user='Passenger_bid').exclude(status='3')
        serial = GetRidepinSerializer(bb,many=True)
        return Response({"status": 1,"msg": "success","data": serial.data})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})
    
@api_view(['GET'])
def PassengerBookingListByT(request,pk):
    try:
        bb = Ride_pin.objects.filter(passengerid=pk,ride_type="T").exclude(status='3')
        serial = GetRidepinSerializer(bb,many=True)
        return Response({"status": 1,"msg": "success","data": serial.data})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Wrong Id"})

@api_view(['GET'])
def OwnBookingFilterDetails(request,pk,pp):
    try:
        pa = Passanger.objects.get(id=pp)
        getr = Ride.objects.get(id=pk,as_user='Driver')
        getq = Ride_pin.objects.filter(getride=pk,status='1').exclude(passengerid=pp)
        getfe = Ride_pin.objects.get(getride=pk,passengerid=pp)#.exclude(status='3')
        sera = RidepinSerializer(getq,many=True)
        if getr.ride_type == "T":
            return Response({'status':1, 'msg':"Success",
                            "ride_type": getr.ride_type,
                            "RID": getr.id,
                            "driver_id" : getr.getdriver.id,
                            "driver": getr.getdriver.name.capitalize(),
                            "Profile": getr.getdriver.pro_image.url,
                            "pickUp": getr.pickUp.capitalize(),
                            "pickup_address1": getr.pickup_address1,
                            "pickup_address2": getr.pickup_address2,
                            "pickUp_latitude": getr.pickUp_latitude,
                            "pickUp_longitude": getr.pickUp_longitude,
                            "dropout": getr.dropout.capitalize(),
                            "dropout_address1": getr.dropout_address1,
                            "dropout_address2": getr.dropout_address2,
                            "dropout_latitude": getr.dropout_latitude,
                            "dropout_longitude": getr.dropout_longitude,
                            "time": getr.time,
                            "dtime": getr.dtime,
                            "trip_status": getr.trip_status,
                            "capacity": getfe.id,
                            "date": getr.date,
                            "fees": f"{getfe.fees}",
                            "add_information": getr.add_information.capitalize(),
                            'data' : sera.data
                            })
        if getr.ride_type == "C":
            return Response({'status':1, 'msg':"Success",
                            "ride_type": getr.ride_type,
                            "RID": getr.id,
                            "driver_id" : getr.getdriver.id,
                            "driver": getr.getdriver.name.capitalize(),
                            "Profile": getr.getdriver.pro_image.url,
                            "pickUp": getr.pickUp.capitalize(),
                            "pickup_address1": getr.pickup_address1,
                            "pickup_address2": getr.pickup_address2,
                            "pickUp_latitude": getr.pickUp_latitude,
                            "pickUp_longitude": getr.pickUp_longitude,
                            "dropout": getr.dropout.capitalize(),
                            "dropout_address1": getr.dropout_address1,
                            "dropout_address2": getr.dropout_address2,
                            "dropout_latitude": getr.dropout_latitude,
                            "dropout_longitude": getr.dropout_longitude,
                            "time": getr.time,
                            "dtime": getr.dtime,
                            "seats": getfe.for_passenger,
                            "trip_status": getr.trip_status,
                            # "capacity": getfe.for_parcel,
                            "date": getr.date,
                            "fees": f"{getfe.fees}",
                            "add_information": getr.add_information.capitalize(),
                            'data' : sera.data
                            })
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['POST'])
def PassengerGiveRating(request,Rid,pp):
    try:
        showtime = strftime("%Y-%m-%d")
        data = request.data
        ra = float(data["rate"])
        rat = round(ra)
        review = data["review"]
        getride = Ride.objects.get(id=Rid)
        getpas = Passanger.objects.get(id=pp)
        getdri = Driver.objects.get(id=getride.getdriver.id)  
        rat = Drivers_Rating.objects.create(
            mine = getdri,
            tri = getride,
            passengerid = getpas,
            rates = rat,
            review = review,
            create = showtime,
        )
        return Response({'status':1,'msg' : 'Rating Add Successfully'})
    except ObjectDoesNotExist:
            return Response({'status':0,'msg' : 'Trip Id Is Not Found'})

@api_view(['GET'])
def PassengerGetRating(request,pk):
    try:
        getpas = Passanger.objects.get(id=pk)
        getride = Passenger_Rating.objects.filter(mine=getpas)
        if getride:
            serial = PassengerGetRatingSeializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Rating List Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def PassengerDrivenRating(request,pk):
    try:
        getpas = Passanger.objects.get(id=pk)
        getride = Drivers_Rating.objects.filter(passengerid=getpas)
        if getride:
            serial = PassengerDrivenRatingSeializer(getride,many=True)
            return Response({'status':1, 'msg':"Success","data":serial.data}) 
        else:
            return Response({'status':0,'msg':'No Rating List Founded'})
    except ObjectDoesNotExist:
        return Response({"status": 0, "msg" : "Id IS wrong"})

@api_view(['GET'])
def DriverProfileViewByPassenger(request,pk):
    try:
        getdri = Driver.objects.get(id=pk)
        return Response({"status" : 1,"msg" : "Success",
                         "Driver_name" : getdri.name.capitalize(),
                         "pro_image" : getdri.pro_image.url,
                         "Email" : getdri.email,
                         "Contact" : getdri.contact_no,
                         "Gender" : getdri.gender,
                         "dob" : getdri.dob,
                         "city" : getdri.city.capitalize(),
                         "bio" : getdri.bio.capitalize(),
                         })
    except ObjectDoesNotExist:
        return Response({"status" : 0,"msg" : "Id Not Found"})

@api_view(['POST'])
def MultiRideFilterByPassenger(request):
    data = request.data
    pick = data["pickUp"]
    drop = data["dropout"]
    date = data["date"]
    seat =  data["seat"]
    parcel = data["parcel"]
    price = data["price"]
    animal = data["pet_allowed"]
    backseat = data["max_seat_in_back"]
    cigarate = data["smoke_allowed"]
    govid = data["Gov_id"]
    tyme = data["tyme"]
    tyme1 = data["tyme1"]
    max_seat = Ride.objects.filter(ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P').exclude(status='3')#.aggregate(Max('seats'))
    maxs = 0
    maxs1 = 0

    for i in max_seat:
        print(i.seats,'seats in the id',i.id)
        print(i.capacity,'parcel in the id',i.id)
        
        if maxs > int(i.seats):
            pass
        else:
            maxs = int(i.seats)
            
        if maxs1 > int(i.capacity):
            pass
        else:
            maxs1 = int(i.capacity)
    
    if pick and drop:
        # All
        if animal == "True" and backseat == "True" and cigarate == "True" and govid == "True":
            print('all')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,smoke_allowed=True,gov_id=True).exclude(status='3')
            
        # With Lowest Price
        elif animal == "True" and backseat == "True" and cigarate == "True" and govid == "True" and price == "True":
            print('all,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,smoke_allowed=True,gov_id=True).exclude(status='3').order_by("fees")
        
        # Animal With Other Two
        elif animal == "True" and backseat == "True" and cigarate == "True":
            print('animal,backseat,cigarate')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,smoke_allowed=True).exclude(status='3')
        elif animal == "True" and backseat == "True" and govid == "True":
            print('animal,backseat,govid')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,gov_id=True).exclude(status='3')
        elif animal == "True" and govid == "True" and cigarate == "True":
            print('animal,govid,cigarate')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,gov_id=True,smoke_allowed=True).exclude(status='3')
        elif backseat == "True" and govid == "True" and cigarate == "True":
            print('backseat,govid,cigarate')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True,gov_id=True,smoke_allowed=True).exclude(status='3')
            
        # With Price Lowest
        elif animal == "True" and backseat == "True" and cigarate == "True" and price == "True":
            print('animal,backseat,cigarate,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,smoke_allowed=True).exclude(status='3').order_by("fees")
        elif animal == "True" and backseat == "True" and govid == "True" and price == "True":
            print('animal,backseat,govid,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True,gov_id=True).exclude(status='3').order_by("fees")
        elif animal == "True" and govid == "True" and cigarate == "True" and price == "True":
            print('animal,govid,cigarate,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,gov_id=True,smoke_allowed=True).exclude(status='3').order_by("fees")
        elif backseat == "True" and govid == "True" and cigarate == "True" and price == "True":
            print('backseat,govid,cigarate,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True,gov_id=True,smoke_allowed=True).exclude(status='3').order_by("fees")
        
        # With Animal
        elif animal == "True" and cigarate == "True":
            print('animal,cigarate')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,smoke_allowed=True).exclude(status='3')
        elif animal == "True" and govid == "True":
            print('animal,govid')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,gov_id=True).exclude(status='3')
        elif animal == "True" and backseat == "True":
            print('animal,backseat')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True).exclude(status='3')
            
        # With Lowest Price
        elif animal == "True" and cigarate == "True" and price == "True" :
            print('animal,cigarate,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,smoke_allowed=True).exclude(status='3').order_by("fees")
        elif animal == "True" and govid == "True" and price == "True" :
            print('animal,govid,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,gov_id=True).exclude(status='3').order_by("fees")
        elif animal == "True" and backseat == "True" and price == "True" :
            print('animal,backseat,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True,max_seat_in_back=True).exclude(status='3').order_by("fees")
            
        # With Cigarate
        elif cigarate == "True" and govid == "True":
            print('cigarate,govid')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True,gov_id=True).exclude(status='3')
        elif cigarate == "True" and backseat == "True":
            print('backseat,cigaret')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True,max_seat_in_back=True).exclude(status='3')
            
        # With Lowest Price
        elif cigarate == "True" and govid == "True" and price == "True":
            print('cigarate,govid,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True,gov_id=True).exclude(status='3').order_by("fees")
        elif cigarate == "True" and backseat == "True" and price == "True":
            print('backseat,cigaret,Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True,max_seat_in_back=True).exclude(status='3').order_by("fees")
            
        # Back Seats
        elif backseat == "True" and govid == "True":
            print('backseat,govid')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True,gov_id=True).exclude(status='3')
        
        # With Lowest Price
        elif backseat == "True" and govid == "True" and price == "True":
            print('backseat,govid,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True,gov_id=True).exclude(status='3').order_by("fees")
            
        # With Price
        elif animal == "True" and price == "True":
            print('animal,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True).exclude(status='3').order_by("fees")
        elif backseat == "True" and price == "True":
            print('back Seat,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True).exclude(status='3').order_by("fees")
        elif cigarate == "True" and price == "True":
            print('cigarate,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True).exclude(status='3').order_by("fees")
        elif govid == "True" and price == "True":
            print('govid,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],gov_id=True).exclude(status='3').order_by("fees")
        elif tyme == "True" and price == "True":
            time1 = '12:00'
            time2 = '13:00'
            print('Time,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],time__range=[time1,time2]).exclude(status='3').order_by("fees")
        elif tyme1 == "True" and price == "True":
            time3 = '18:00'
            time4 = '23:59'
            print('Time1,price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],time__range=[time3,time4]).exclude(status='3').order_by("fees")
        
        # Single Filter
        elif animal == "True":
            print('animal')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],pet_allowed=True).exclude(status='3').order_by('-id')
        elif backseat == "True":
            print('back Seat')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],max_seat_in_back=True).exclude(status='3').order_by('-id')
        elif cigarate == "True":
            print('cigarate')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],smoke_allowed=True).exclude(status='3').order_by('-id')
        elif govid == "True":
            print('govid')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],gov_id=True).exclude(status='3').order_by('-id')
        elif tyme == "True":
            time1 = '12:00'
            time2 = '13:00'
            print('Time')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],time__range=[time1,time2]).exclude(status='3').order_by('-id')
        elif tyme1 == "True":
            time3 = '18:00'
            time4 = '23:59'
            print('Time1')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1],time__range=[time3,time4]).exclude(status='3').order_by('-id')
        elif price == "True":
            print('Price')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs],capacity__range=[parcel,maxs1]).exclude(status='3').order_by('fees')
        else:
            print('None')
            pp = Ride.objects.filter(status='0',ride_type='C',pickUp=pick,dropout=drop,date=date,trip_status='P',seats__range=[seat,maxs]).exclude(status='3').order_by('-id')

        if len(pp) > 0:
            serial = MultiFilterserializer(pp,many=True)
            return Response({'status':1 ,"msg":"Success", 'data':serial.data})    
        else:
            return Response({'status':0 ,"msg":"No Record Founded"})
    else:
        return Response({'status':0 ,"msg":"No Record Founded"})

@api_view(['POST'])
def SendIDProofe(request,pk):
    try:
        data = request.data
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        getpassenger = Passanger.objects.get(id=pk)
        # if getpassenger.img_status == "0":
        try:
            image1 = data['image1']# if data['pro_image'] else  getdr.pro_image
            ex = image1.name
            if ex.endswith('.jpg'):
                getpassenger.image1 = image1
            elif ex.endswith('.png'):
                getpassenger.image1 = image1
            elif ex.endswith('.gif'):
                getpassenger.image1 = image1
            elif ex.endswith('.jpeg'):
                getpassenger.image1 = image1
            else:
                getpassenger.image1 = getpassenger.image1
                return Response({"status": 0, "msg" : "Image1 Formate use jpg,jpeg,png"})
        except:
            getpassenger.image1 = getpassenger.image1
        try:
            image2 = data['image2']# if data['pro_image'] else  getdr.pro_image
            ex = image2.name
            if ex.endswith('.jpg'):
                getpassenger.image2 = image2
            elif ex.endswith('.png'):
                getpassenger.image2 = image2
            elif ex.endswith('.gif'):
                getpassenger.image2 = image2
            elif ex.endswith('.jpeg'):
                getpassenger.image2 = image2
            else:
                getpassenger.image2 = getpassenger.image2
                return Response({"status": 0, "msg" : "Image2 Formate use jpg,jpeg,png"})
        except:
            getpassenger.image2 = getpassenger.image2
            # getpassenger.img_status == "1"
        getpassenger.save()
        return Response({"status": 1,"msg" : "Success","Proofe_id" : getpassenger.id})
        # else:
        #     return Response({"status": 1,"msg" : "Document Updated"})
    except ObjectDoesNotExist:
        return Response({"status": 0,"msg" : "Wrong Id"})

@api_view(['GET'])
def MyIdProofe(request,pk):
    ids = Id_proofe.objects.filter(passengerid=pk)
    prof = Id_proofeSerializerForPassenger(ids,many=True)
    return Response({"status": 1,"msg" : "Success","Proofe_id" : prof.data})

@api_view(['POST'])
def CancelBooking(request,pk):
    try:
        getbooking = Ride_pin.objects.get(id=pk)
        if getbooking.status == '0' or getbooking.status == "1":
            getbooking.status = '3'
            getbooking.save()
            return Response({'status':1 ,"msg":"Cancel Booking"})    
        else:
            return Response({'status':0 ,"msg":"Booking Already Reject Or Cancel"})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg":"Ride Booking Id Not Found"})
    
@api_view(['POST'])
def ReportDriverBehavior(request,Rid,pk):
    try:
        showtime = strftime("%Y-%m-%d %H:%M:%S")
        data = request.data
        report_text = data["report_text"]
        getride = Ride.objects.get(id=Rid)
        getpas = Passanger.objects.get(id=pk)
        getdri = Driver.objects.get(id=getride.getdriver.id)    
        rat = Driver_Report.objects.create(
            mine = getdri,
            tri = getride,
            passengerid = getpas,
            report_text = report_text,
            create = showtime,
        )
        getride.pas_status = "E"
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
        getpass = Passanger.objects.get(id=pk)
        adda = Search_History.objects.filter(passengerid = getpass,pick = pick,drop = drop,pick_lat = pick_lat,pick_lng = pick_lng,drop_lat = drop_lat,drop_lng = drop_lng,date = date,location = location,create = showtime,)
        if len(adda) > 0:
            for i in adda:
                i.delete()
            add = Search_History.objects.create(
                passengerid = getpass,
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
                passengerid = getpass,
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
        his = Search_History.objects.filter(passengerid=pk,location=ll).order_by('-id')[:4]
        if len(his)> 0:
            serial = HistoryViewForPassenger(his,many=True)
            return Response({'status':1 ,"msg": "Success", 'data' : serial.data})
        else:
            return Response({'status':0 ,"msg": "No Record"})
    except ObjectDoesNotExist:
        return Response({'status':0 ,"msg": "Fail"})

@api_view(['POST'])
def tripsetting(request,pk):
    ride = Ride_pin.objects.get(id=pk)
    if ride.getride.trip_status == 'O':
        if ride.status == '1':
            if ride.pas_status == 'W':
                ride.pas_status = 'O'
                ride.save()
                return Response({'status':1 ,"msg": "Trip Started"})
            
            if ride.pas_status == 'O':
                ride.pas_status = 'E'
                ride.save()
                return Response({'status':1 ,"msg": "Trip Complete"})
            
            if ride.pas_status == 'E':
                return Response({'status':1 ,"msg": "Trip Complete"})
        else:
            return Response({'status':0 ,"msg": "Your Doesn't Accept"})
    elif ride.getride.trip_status == 'E':
        return Response({'status':0 ,"msg": "Driver End Trip"})
    else:
        return Response({'status':0 ,"msg": "Driver Not Start Trip"})

@api_view(['POST'])
def ContactUsPassenger(request):
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
        email_from =  email
        to_email = [settings.EMAIL_HOST_USER,]
        send_mail(mail_subject, message,f'{name}', to_email)
        return Response({'status' : 1,'msg':'Mail Sent Successfully'})
    else:
        return Response({'status' : 0 , 'msg' : "Email Is Not Proper"})

@api_view(['GET'])
def BlockStatusForDriver(request,pk):
    getd = Passanger.objects.get(id=pk)
    if getd.status == 'Active':
        return Response({'status':0,'msg':'Unblock'})
    else:
        return Response({'status':1,'msg':'Block'})

@api_view(['GET'])
def BidDetalis(request,pk):
    try:
        ri = Ride.objects.get(id=pk)
        if ri.as_user == 'Passenger':
            di = Ride_pin.objects.filter(getride1=ri.id,status='1')
            if len(di)>0:
                context = {
                    'status':1,
                    'msg':'success',
                    'id':ri.id,
                    'pickup' : ri.pickUp.capitalize(),
                    'pickup_address1' : ri.pickup_address1.capitalize(),
                    'pickup_address2' : ri.pickup_address2.capitalize(),
                    'dropout' : ri.dropout.capitalize(),
                    'dropout_address1' : ri.dropout_address1.capitalize(),
                    'dropout_address2' : ri.dropout_address2.capitalize(),
                    'ride_type' : ri.ride_type,
                    'trip_pas_status' : ri.trip_status,
                    # 'time' : ri.time,
                    # 'time' : ri.time,
                    'seat' : ri.seats,
                    'capacity' : ri.capacity,
                    'Driver_name' : di[0].getdriver.name.capitalize(),
                    'Driver_image' : di[0].getdriver.pro_image.url,
                    'fees' : f"{di[0].fees}",
                    }
                return Response(context)
            else:
                context = {
                    'status':1,
                    'msg':'success',
                    'id':ri.id,
                    'pickup' : ri.pickUp.capitalize(),
                    'pickup_address1' : ri.pickup_address1.capitalize(),
                    'pickup_address2' : ri.pickup_address2.capitalize(),
                    'dropout' : ri.dropout.capitalize(),
                    'dropout_address1' : ri.dropout_address1.capitalize(),
                    'dropout_address2' : ri.dropout_address2.capitalize(),
                    'ride_type' : ri.ride_type,
                    'trip_pas_status' : ri.ride_type,
                    'seat' : ri.seats,
                    'capacity' : ri.capacity,
                    'Driver_name' : '',
                    'Driver_image' : '',
                    'fees' : '',
                    }
                return Response(context)
        else:
            return Response({"status":0,'msg':'No Record'})
    except:
        return Response({"status":0,'msg':'Wrong Id'})

@api_view(['GET'])
def RatingDetailsPageForRecieve(request,pk):
    rat = Drivers_Rating.objects.get(id=pk)
    context = {
        'status' : 1,
        'msg' : 'success',
        "Driver_name" : rat.mine.name.capitalize(),
        "Driver_pro_image" : rat.mine.pro_image.url,
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
        "Driver_name" : rat.driverid.name.capitalize(),
        "Driver_pro_image" : rat.driverid.pro_image.url,
        "ride_id" : rat.tri.getride.id,
        "pickup" : rat.tri.getride.pickUp.capitalize(),
        "dropout" : rat.tri.getride.dropout.capitalize(),
        "ride_date" : rat.tri.getride.date,
        "create" : rat.create,
        "rate" : float(rat.rates),
        "review" : rat.review,
    }
    return Response(context)
    