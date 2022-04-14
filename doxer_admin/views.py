from django.shortcuts import render,redirect
from django.core.exceptions import *
from django.contrib.auth.hashers import make_password,check_password
from time import strftime
from doxer.models import *
from django.http import JsonResponse
from .models import *
from datetime import datetime
from time import gmtime, strftime
from django.db.models import F, Sum
from django.core.paginator import Paginator,EmptyPage
from time import strftime
from django.views.decorators.csrf import csrf_exempt
from .mixins import Directions
from django.contrib import messages
import re

# Create your views here.
car_per_page = 10
driver_per_page = 10
passenger_per_page = 10
rides_per_page = 10

@csrf_exempt
def home(request):
    if 'id' in request.session:
        showtime = strftime("%Y-%m-%d")
        dri = Driver.objects.exclude(active_ac_with_otp='0')
        dri1 = Driver.objects.filter(status="Deactive")
        pas = Passanger.objects.exclude(active_ac_with_otp='0')
        pas1 = Passanger.objects.filter(status="Deactive")
        # rid = Trip.objects.filter(trip_status='E',pick_status='D',status='E').exclude(trip_status='C',pick_status='C',status='C').aggregate(total=Sum(F('fees')))
        rid = Ride_pin.objects.filter(pas_status='E',status='1').exclude(status='2').aggregate(total=Sum(F('fees')))
        for thevalue in rid.values():
            thevalue = thevalue

        # rid1 = Trip.objects.filter(today=showtime).aggregate(total=Sum(F('fees')))
        rid1 = Ride_pin.objects.filter(pas_status='E',status='1',today=showtime).exclude(status='2').aggregate(total=Sum(F('fees')))
        # rid1 = Trip.objects.filter(today=showtime).aggregate(total=Sum(F('fees')))
        for todayvalue in rid1.values():
            todayvalue = todayvalue
        
        if request.method == 'POST':
            if 'id' in request.session:
                sess = "1"
            else:
                sess = "0"
            contax = {
                "sess" : sess,
                'dri' : dri.count(),
                'pas' : pas.count(),
                'dri1' : dri1.count(),
                'pas1' : pas1.count(),
                'income' : f"{thevalue}",
                'today' : f"{todayvalue}",
                }
            return JsonResponse(contax)
        contax = {
            't1' : '1',
            'dri' : dri.count(),
            'pas' : pas.count(),
            'title' : "Home Page"
        }
        return render(request,'doxer_admin/index.html',contax)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt
def LoginPage(request):
    if 'id' in request.session:
        return redirect('doxer_admin:indexpage')
    else:
        contax = {
            'title' : "Login Page"
        }
        return render(request,'doxer_admin/login.html',contax)

@csrf_exempt
def All_Drivers(request):
    if 'id' in request.session:
        allu = Driver.objects.exclude(active_ac_with_otp='0').order_by('-id')
        per_page = driver_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range
        context = {
        'obj_paginator':obj_paginator,
        'first_page':first_page,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        'a' : 1,
        'b' : 1 * per_page,
        't' : allu.count(),
        't1' : '3',
        'title': "All Drivers Page"
        }
        try:
            if request.method == 'POST':
                #getting page number
                page_no = request.POST.get('page_no', None) 
                starting_number= (int(page_no)-1)*per_page
                ending_number= int(page_no)*per_page
                res = Driver.objects.exclude(active_ac_with_otp='0').order_by('-id')[starting_number:ending_number]
                results = []
                for i in res:
                    resa = {}
                    resa['id'] = i.id
                    resa['pro_image'] = i.pro_image.url
                    resa['username'] = i.name.capitalize()
                    resa['email'] = i.email
                    resa['contact_no'] = i.contact_no
                    if i.gender == "M":
                        gender = 'Male'
                    elif i.gender == "F":
                        gender = 'Female'
                    elif i.gender == "O":
                        gender = 'Other'
                    else:
                        gender = ''
                    resa['gender'] = gender
                    resa['city'] = i.city.capitalize()
                    resa['fare_per_km'] = f"{i.fare_per_km}"
                    # resa['id_proofe'] = f"<a class='documentview' data-target='#IdProofemodel' data-toggle='modal' data='{i.id}'><img src='{i.image1.url}' alt='IdProofe1'><img src='{i.image2.url}' alt='IdProofe2'></a>"
                    resa['id_proofe'] = f"<a class='documentview' data-target='#IdProofemodel' data-toggle='modal' data='{i.id}'><div class='face-pile__images-container'><img class='artdeco-entity-image artdeco-entity-image--circle-1 face-pile__image face-pile__image--1 lazy-loaded' alt='IdProofe2' src='{i.image2.url}'><img class='artdeco-entity-image artdeco-entity-image--circle-1 face-pile__image face-pile__image--1 lazy-loaded' alt='IdProofe1' src='{i.image1.url}'></div></a>"
                    resa['status'] = i.status
                    results.append(resa)

                    if ending_number >= allu.count():
                        b = allu.count()
                    else:
                        b = ending_number
                return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allu.count()})
        except:
            return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/all_drivers.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt  
def All_Passengers(request):
    if 'id' in request.session:
        allu = Passanger.objects.exclude(active_ac_with_otp='0').order_by('-id')
        per_page = passenger_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range

        context = {
        'obj_paginator':obj_paginator,
        'first_page':first_page,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        't1' : '4',
        'title': "All Passengers Page"
        }
        try:            
            if request.method == 'POST':
                #getting page number
                page_no = request.POST.get('page_no', None)
                starting_number= (int(page_no)-1)*per_page
                ending_number= int(page_no)*per_page
                res = Passanger.objects.exclude(active_ac_with_otp='0').order_by('-id')[starting_number:ending_number]
                results = []
                for i in res:
                    resa = {}
                    resa['id'] = i.id
                    resa['pro_image'] = i.pro_image.url
                    resa['username'] = i.name.capitalize()
                    resa['email'] = i.email
                    resa['contact_no'] = i.contact_no
                    if i.gender == "M":
                        gender = 'Male'
                    elif i.gender == "F":
                        gender = 'Female'
                    elif i.gender == "O":
                        gender = 'Other'
                    else:
                        gender = ''
                    resa['gender'] = gender
                    resa['status'] = i.status
                    # resa['id_proofe'] = f"<a class='documentview' data-target='#IdProofemodel' data-toggle='modal' data='{i.id}'><img src='{i.image1.url}' alt='IdProofe1'><img src='{i.image2.url}' alt='IdProofe2'></a>"
                    resa['id_proofe'] = f"<a class='documentview' data-target='#IdProofemodel' data-toggle='modal' data='{i.id}'><div class='face-pile__images-container'><img class='artdeco-entity-image artdeco-entity-image--circle-1 face-pile__image face-pile__image--1 lazy-loaded' alt='IdProofe2' src='{i.image2.url}'><img class='artdeco-entity-image artdeco-entity-image--circle-1 face-pile__image face-pile__image--1 lazy-loaded' alt='IdProofe1' src='{i.image1.url}'></div></a>"
                    results.append(resa)
                    if ending_number >= allu.count():
                        b = allu.count()
                    else:
                        b = ending_number
                return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allu.count()})
        except:
            return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/all_passenger.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt   
def Rejected_Cars(request):
    if 'id' in request.session:
        allu = Vehicle.objects.filter(status='2').order_by('id')
        per_page = car_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range

        context = {
        'obj_paginator':obj_paginator,
        'first_page':first_page,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        't1' : '2',
        'title': "Accepted Cars Page"
        }
        try:
            if request.method == 'POST':
                #getting page number
                page_no = request.POST.get('page_no', None)
                starting_number= (int(page_no)-1)*per_page
                ending_number= int(page_no)*per_page
                allw = Vehicle.objects.filter(status='2')
                res = Vehicle.objects.filter(status='2')[starting_number:ending_number]
                # elif sort == 'a':
                #     allw = Vehicle.objects.filter(status='1')
                #     res = Vehicle.objects.filter(status='1')[starting_number:ending_number]
                # else:
                #     allw = Vehicle.objects.all()
                #     res = Vehicle.objects.all()[starting_number:ending_number]
                results = []
                for i in res:
                    resa = {}
                    resa['id'] = i.id
                    resa['pro_image'] = i.driverid.pro_image.url
                    resa['driverid'] = i.driverid.name.capitalize() if i.driverid.name.capitalize() else i.driverid.email_or_num
                    resa['reg_num'] = i.reg_num.upper()
                    resa['vehical_variant'] = f'{i.vehical_variant.brand},{i.vehical_variant.cars}'
                    resa['vehicle_color'] = i.vehicle_color.capitalize()
                    resa['status'] = i.status
                    resa['date'] = i.created.strftime("%d-%b-%Y")
                    results.append(resa)
                    if ending_number >= allw.count():
                        b = allw.count()
                    else:
                        b = ending_number
                return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allw.count()})
        except:
            return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/rejectecar.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt    
def Accepted_Cars(request):
    if 'id' in request.session:
        allu = Vehicle.objects.filter(status='1').order_by('id')
        per_page = car_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range

        context = {
        'obj_paginator':obj_paginator,
        'first_page':first_page,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        't1' : '2',
        'title': "Accepted Cars Page"
        }
        try:
            if request.method == 'POST':
                #getting page number
                page_no = request.POST.get('page_no', None)
                starting_number= (int(page_no)-1)*per_page
                ending_number= int(page_no)*per_page
                allw = Vehicle.objects.filter(status='1')
                res = Vehicle.objects.filter(status='1')[starting_number:ending_number]
                # elif sort == 'a':
                #     allw = Vehicle.objects.filter(status='1')
                #     res = Vehicle.objects.filter(status='1')[starting_number:ending_number]
                # else:
                #     allw = Vehicle.objects.all()
                #     res = Vehicle.objects.all()[starting_number:ending_number]
                results = []
                for i in res:
                    resa = {}
                    resa['id'] = i.id
                    resa['pro_image'] = i.driverid.pro_image.url
                    resa['driverid'] = i.driverid.name.capitalize() if i.driverid.name.capitalize() else i.driverid.email_or_num
                    resa['reg_num'] = i.reg_num.upper()
                    resa['vehical_variant'] = f'{i.vehical_variant.brand},{i.vehical_variant.cars}'
                    resa['vehicle_color'] = i.vehicle_color.capitalize()
                    resa['status'] = i.status
                    resa['date'] = i.created.strftime("%d-%b-%Y")
                    results.append(resa)
                    if ending_number >= allw.count():
                        b = allw.count()
                    else:
                        b = ending_number
                return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allw.count()})
        except:
            return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/acceptecar.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt    
def All_Cars(request):
    if 'id' in request.session:
        allu = Vehicle.objects.filter(status='0').order_by('id')
        per_page = car_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range

        context = {
        'obj_paginator':obj_paginator,
        'first_page':first_page,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        't1' : '2',
        'title': "All Cars Page"
        }
        try:
            if request.method == 'POST':
                #getting page number
                page_no = request.POST.get('page_no', None)
                starting_number= (int(page_no)-1)*per_page
                ending_number= int(page_no)*per_page
                allw = Vehicle.objects.filter(status='0')
                res = Vehicle.objects.filter(status='0')[starting_number:ending_number]
                # elif sort == 'a':
                #     allw = Vehicle.objects.filter(status='1')
                #     res = Vehicle.objects.filter(status='1')[starting_number:ending_number]
                # else:
                #     allw = Vehicle.objects.all()
                #     res = Vehicle.objects.all()[starting_number:ending_number]
                results = []
                for i in res:
                    resa = {}
                    resa['id'] = i.id
                    resa['pro_image'] = i.driverid.pro_image.url
                    resa['driverid'] = i.driverid.name.capitalize() if i.driverid.name.capitalize() else i.driverid.email_or_num
                    resa['reg_num'] = i.reg_num.upper()
                    resa['vehical_variant'] = f'{i.vehical_variant.brand},{i.vehical_variant.cars}'
                    resa['vehicle_color'] = i.vehicle_color.capitalize()
                    resa['status'] = i.status
                    resa['date'] = i.created.strftime("%d-%b-%Y")
                    results.append(resa)
                    if ending_number >= allw.count():
                        b = allw.count()
                    else:
                        b = ending_number
                return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allw.count()})
        except:
            return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/all_cars.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt    
def All_Rides(request):
    if 'id' in request.session:
        allu = Ride_pin.objects.filter(status='1').order_by('-pas_status')
        per_page = rides_per_page
        # Paginator in a view function to paginate a queryset
        # show 4 news per page
        obj_paginator = Paginator(allu, per_page)
        # list of objects on first page
        first_page = obj_paginator.page(1).object_list
        
        page_range =  obj_paginator.page_range
        pages_range = page_range[-1]
        pages = pages_range

        context = {
        'obj_paginator':obj_paginator,
        'page_range':page_range,
        'pages' : pages,
        'pages1' : pages-1,
        't1' : '5',
        'google_api_key' : settings.GOOGLE_API_KEY,
        'title': "All Rides Page"
        }
        # try:
        if request.method == 'POST':
            #getting page number
            page_no = request.POST.get('page_no', None) 
            starting_number= (int(page_no)-1)*per_page
            ending_number= int(page_no)*per_page
            res = Ride_pin.objects.filter(status='1').order_by('-pas_status')[starting_number:ending_number]
            results = []
            for i in res:
                rdie = Ride.objects.get(id=i.getride.id)
                # if i.getride.ride_type == "C":
                #     if rdie.car:
                #         car = Vehicle.objects.get(id=rdie.car.id)
                #     else:
                #         cars = 'None '
                resa = {}
                resa['id'] = i.id
                repor = Passenger_Report.objects.filter(tri = i.id,driverid = i.getdriver.id,mine = i.passengerid.id)
                arepor = Driver_Report.objects.filter(tri = rdie.id,mine = i.getdriver.id,passengerid = i.passengerid.id)
                if len(repor) > 0 or len(arepor) > 0:
                    resa['str'] = '1'
                else:
                    resa['str'] = '0'
                resa['getdr'] = i.getdriver.name.capitalize()
                resa['getpas'] = i.passengerid.name.capitalize()
                resa['fees'] = f"₹ {i.fees}" 
                resa['rid'] = rdie.id
                if i.as_user == '	Passenger_bid':
                    resa['ride_time'] = i.getride.time
                else:
                    resa['ride_time'] = i.getride.dtime
                resa['trip_date'] = i.ride_date.strftime("%d-%b-%Y")
                resa['Location'] = i.pickUp.capitalize()
                resa['destination'] = i.dropout.capitalize()
                if i.getride.ride_type == "C":
                    resa['vehicle'] = f"{i.car.vehical_variant.brand.brand} {i.car.vehical_variant.cars}<br><br>{i.car.reg_num.upper()} <br><br> {i.car.vehicle_color.capitalize()}"
                #     if rdie.car:
                #         resa['vehicle'] = f"{i.car.vehical_variant.brand.brand} {car.vehical_variant.cars}<br><br>{car.reg_num.upper()} <br><br> {car.vehicle_color.capitalize()}"
                #     else:
                #         resa['vehicle'] = 'None'
                else:
                    resa['vehicle'] = "Truck"
                if i.pas_status == 'W' and rdie.trip_status == 'P':
                    resa['status'] = "<label class='badge badge-info'>Waiting</label>"
                elif i.pas_status == 'W' and rdie.trip_status == 'O':
                    resa['status'] = "<label class='badge badge-info'>Waiting</label> <br><br> <label class='badge badge-warning'>On The Way</label>"
                elif  i.pas_status == 'O' and rdie.trip_status == 'O':
                    resa['status'] = "<label class='badge badge-warning'>On The Way</label>"
                elif  i.pas_status == 'E' and rdie.trip_status == 'O':
                    resa['status'] = "<label class='badge badge-success'>Passenger End Trip</label><br><br><label class='badge badge-warning'>On The Way</label>"
                elif  i.pas_status == 'E' and rdie.trip_status == 'E':
                    resa['status'] = "<label class='badge badge-success'>Trip Has Been Finished</label>"
                results.append(resa)
                if ending_number >= allu.count():
                    b = allu.count()
                else:
                    b = ending_number
                    starting_number = int(-1)
                # print('------------>',results)
            return JsonResponse({"results":results,'a' : starting_number + 1,'b' : b,'t' : allu.count()})
        # except:
        #     return JsonResponse({"results":[''],'a' : 0,'b' : 0,'t' : allu.count()})
        return render(request,'doxer_admin/all_ride.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt
def LoginAdmin(request):
    try:
        if request.method == "POST":
            uname = request.POST['Username']
            pswd = request.POST['password']
            nextpage = request.POST['next']
                
            # user = admin_credentials.objects.create(
            #     username = uname,
            #     password = pswd
            # )
            # user.password = make_password(user.password)
            # user.save()
            # messages.success(request, f"Register Successfully")
            # return redirect("doxer_admin:loginpage")
            user = admin_credentials.objects.filter(username=uname)
            # user = User.objects.filter(username=uname)
            if len(user) > 0:
                pas = check_password(pswd, user[0].password)
                if pas:
                    request.session['id'] = user[0].id
                    return redirect(nextpage)
                else:
                    messages.error(request, f"Password is Incorrect..!")
                    return redirect("doxer_admin:loginpage")
            else:
                messages.error(request, f"User Not Founded")
                return redirect("doxer_admin:loginpage")
        else:
            messages.error(request, f"Something Wrong.!")
            return redirect("doxer_admin:loginpage")
    except:
        return redirect('doxer_admin:loginpage')

@csrf_exempt
def LogoutAdmin(request):
    try:
        if 'id' in request.session:
            del request.session['id']
            return redirect("doxer_admin:loginpage")
        else:
            return redirect("doxer_admin:loginpage")
    except:
        return redirect("doxer_admin:loginpage")

@csrf_exempt
def car_accept(request):
    if 'id' in request.session:
        if request.method=='POST':
            id = request.POST.get('pid')
            showtime = strftime("%Y-%m-%d %H:%M:%S", )
            getpas = Vehicle.objects.get(pk=id)
            if getpas.status == '0':
                getpas.status = '1'
                getpas.updated = showtime
                getpas.save()
                
                allu = Vehicle.objects.filter(status='0').order_by('-id')
                allw = Vehicle.objects.filter(status='0')
                pagess = allu.count()
                per_page = car_per_page
                # Paginator in a view function to paginate a queryset
                # show 4 news per page
                obj_paginator = Paginator(allu, per_page)
                # list of objects on first page
                first_page = obj_paginator.page(1).object_list
                
                page_range =  obj_paginator.page_range
                pages_range = page_range[-1]
                pages = pages_range

                #getting page number
                page_no = request.POST.get('page_no', None)
                if int(page_no) > 0:
                    starting_number= (int(page_no)-1)*per_page
                    # starting_number= (int(page_no))*per_page
                    ending_number= (int(page_no))*per_page
                    # ending_number= (int(page_no)+1)*per_page
                    res = Vehicle.objects.filter(status='0')[starting_number:ending_number]
                    result = []
                    for i in res:
                        results = {}
                        results['id'] = i.id
                        results['pro_image'] = i.driverid.pro_image.url
                        results['driverid'] = i.driverid.name if i.driverid.name else i.driverid.email_or_num
                        results['reg_num'] = i.reg_num.upper()
                        results['vehical_variant'] = f'{i.vehical_variant.brand},{i.vehical_variant.cars}'
                        results['vehicle_color'] = i.vehicle_color.capitalize()
                        results['status'] = i.status
                        result.append(results)
                        if ending_number >= allw.count():
                            b = allw.count()
                        else:
                            b = ending_number
                    return JsonResponse({'status':1,"results":result,'page_range':pages,'a' : starting_number + 1,'b' : b,'t' : allw.count()})
                else:
                    if allu.count() == 0:
                        a = 0
                    else:
                        a = 1
                    return JsonResponse({'status':1,'results' : 'None','page_range':pages,'a' : a,'b' : allu.count(),'t' : allu.count()})
            else:
                return JsonResponse({'status':0})
        else:
            return JsonResponse({'status':0})
    else:
        return JsonResponse({'status':0})

@csrf_exempt
def car_reject(request):
    if 'id' in request.session:
        if request.method=='POST':
            id = request.POST.get('pid')
            showtime = strftime("%Y-%m-%d %H:%M:%S", )
            getpas = Vehicle.objects.get(pk=id)
            if getpas.status == '0':
                getpas.status = '2'
                getpas.updated = showtime
                getpas.save()
                allu = Vehicle.objects.filter(status='0').order_by('-id')
                allw = Vehicle.objects.filter(status='0')
                pagess = allu.count()
                per_page = car_per_page
                # Paginator in a view function to paginate a queryset
                # show 4 news per page
                obj_paginator = Paginator(allu, per_page)
                # list of objects on first page
                first_page = obj_paginator.page(1).object_list
                
                page_range =  obj_paginator.page_range
                pages_range = page_range[-1]
                pages = pages_range

                page_no = request.POST.get('page_no', None)
                if int(page_no) > 0:
                    starting_number= (int(page_no)-1)*per_page
                    # starting_number= (int(page_no))*per_page
                    ending_number= (int(page_no))*per_page
                    # ending_number= (int(page_no)+1)*per_page
                    res = Vehicle.objects.filter(status='0')[starting_number:ending_number]
                    result = []
                    for i in res:
                        results = {}
                        results['id'] = i.id
                        results['pro_image'] = i.driverid.pro_image.url
                        results['driverid'] = i.driverid.name if i.driverid.name else i.driverid.email_or_num
                        results['reg_num'] = i.reg_num.upper()
                        results['vehical_variant'] = f'{i.vehical_variant.brand},{i.vehical_variant.cars}'
                        results['vehicle_color'] = i.vehicle_color.capitalize()
                        results['status'] = i.status
                        result.append(results)
                        if ending_number >= allw.count():
                            b = allw.count()
                        else:
                            b = ending_number
                    return JsonResponse({'status':1,"results":result,'page_range':pages,'a' : starting_number + 1,'b' : b,'t' : allw.count()})
                else:
                    if allu.count() == 0:
                        a = 0
                    else:
                        a = 1
                    return JsonResponse({'status':1,'results' : 'None','a' : a,'b' : allu.count(),'t' : allu.count()})
                # return JsonResponse({'status':1})
            else:
                return JsonResponse({'status':0})
        else:
            return JsonResponse({'status':0})
    else:  
        return JsonResponse({'status':0})

@csrf_exempt    
def BlockPassenger(request):
    if 'id' in request.session:
        if request.method=='POST':
            id = request.POST.get('pid')
            showtime = strftime("%Y-%m-%d %H:%M:%S", )
            getpas = Passanger.objects.get(pk=id)
            if getpas.status == 'Active':
                getride = Ride.objects.filter(getpassenger=id,publish='1',trip_status='P')
                for i in getride:
                    print(i.id)
                    i.publish = '2'
                    i.save()
                getpas.status = 'Deactive'
                getpas.update = showtime
                getpas.save()
                return JsonResponse({'status':1})
            elif getpas.status == 'Deactive':
                getride = Ride.objects.filter(getpassenger=id,publish='2',trip_status='P')
                for i in getride:
                    print(i.id)
                    i.publish = '1'
                    i.save()
                getpas.status = 'Active'
                getpas.update = showtime
                getpas.save()
                return JsonResponse({'status':2})
            else:
                return JsonResponse({'status':0})
        else:
            return JsonResponse({'status':0})
    else:
        return JsonResponse({'status':0})

@csrf_exempt    
def BlockDriver(request):
    if 'id' in request.session:
        if request.method=='POST':
            id = request.POST.get('pid')
            showtime = strftime("%Y-%m-%d %H:%M:%S", )
            getpas = Driver.objects.get(pk=id)
            if getpas.status == 'Active':
                getride = Ride.objects.filter(getdriver=id,publish='1',trip_status='P')
                for i in getride:
                    print(i.id)
                    i.publish = '2'
                    i.save()
                getpas.status = 'Deactive'
                getpas.update = showtime
                getpas.save()
                driver_name = getpas.name if getpas.name else getpas.email_or_num
                return JsonResponse({'status':1,'driver': f"{driver_name} Block Successfully..!"})
            elif getpas.status == 'Deactive':
                getride = Ride.objects.filter(getdriver=id,publish='2',trip_status='P')
                for i in getride:
                    print(i.id)
                    i.publish = '1'
                    i.save()
                getpas.status = 'Active'
                getpas.update = showtime
                getpas.save()
                driver_name = getpas.name if getpas.name else getpas.email_or_num
                return JsonResponse({'status':2,'driver': f"{driver_name} Unblock Successfully..!"})
            else:
                return JsonResponse({'status':0})
        else:
            return JsonResponse({'status':0})
    else:
        return JsonResponse({'status':0})

@csrf_exempt
def editprice(request):
    if 'id' in request.session:
        if request.method=='POST':
                id = request.POST.get('pid')
                showtime = strftime("%Y-%m-%d %H:%M:%S", )
                getda = Driver.objects.get(pk=id)
                driver_data = {'id' : getda.id,'email': getda.name if getda.name else getda.email_or_num, 'fees': f"{getda.fare_per_km}"}
                return JsonResponse(driver_data)
    else:
        return JsonResponse({'status':0})

@csrf_exempt
def editcar(request):
    if 'id' in request.session:
        if request.method=='POST':
                id = request.POST.get('pid')
                showtime = strftime("%Y-%m-%d %H:%M:%S", )
                getda = Vehicle.objects.get(pk=id)
                # car = Car_name.objects.get()           
                car = getda.vehical_variant.cars + ',' + getda.vehical_variant.brand.brand
                driver_data = {'id' : getda.id,'reg_num' : getda.reg_num,'vehicle_color' : getda.vehicle_color, 'car' : car}
                # driver_data = {'id' : getda.id,'email': getda.username if getda.username else getda.email_or_num, 'fees': getda.fare_per_km}
                return JsonResponse(driver_data)
    else:
        return JsonResponse({'status':0})

@csrf_exempt
def updateprice(request):
    if 'id' in request.session:
        try:    
            if request.method=='POST':
                id = request.POST.get('pid')
                price = request.POST.get('price')
                showtime = strftime("%Y-%m-%d %H:%M:%S", )
                getpas = Driver.objects.get(pk=id)
                getpas.fare_per_km = price    
                getpas.save()
                drive_name = getpas.name if getpas.name else getpas.email_or_num
                prices = f"{drive_name}'s Price {price} Credited Successfully..!"
                return JsonResponse({'status':1,'update_value' : prices})
            else:
                return JsonResponse({'status':0})
        except:
            return JsonResponse({'status':2})
    else:
        return JsonResponse({'status':2})

@csrf_exempt    
def map_view(request):
    if 'id' in request.session:
        if request.method=='POST':
            gid = request.POST.get('id')
            rid_pins = Ride.objects.get(id=gid)
            allr = Ride_pin.objects.filter(getride=rid_pins.id)
            lat = float(rid_pins.pickUp_latitude)
            lng = float(rid_pins.pickUp_longitude)
            lat_a = float(rid_pins.dropout_latitude)
            lng_a = float(rid_pins.dropout_longitude)
            context = {
                'lat' : lat,
                'lng' : lng,
                'lat_a' : lat_a,
                'lng_a' : lng_a,
                'rid' : rid_pins.id
            }
            return JsonResponse(context)#(request, 'doxer_admin/maps.html',context)
    else:
        return redirect("doxer_admin:loginpage")

@csrf_exempt
def map(request):
    lat_a = request.GET.get("lat_a")
    long_a = request.GET.get("long_a")
    lat_b = request.GET.get("lat_b")
    long_b = request.GET.get("long_b")
    rideid = request.GET.get("rid") if request.GET.get("rid") else request.POST.get("rid")
    ridesta = Ride.objects.get(id=rideid)
    directions = Directions(
        lat_a= lat_a,
        long_a=long_a,
        lat_b = lat_b,
        long_b=long_b
        )
    context = {
        "google_api_key": settings.GOOGLE_API_KEY,
        "lat_a": lat_a,
        "long_a": long_a,
        "lat_b": lat_b,
        "long_b": long_b,
        "rid": rideid,
        "origin": f'{lat_a}, {long_a}',
        "destination": f'{lat_b}, {long_b}',
        "directions": directions,
        "title" : "Location Tracker Map View",
        "status" : ridesta.trip_status,
        "car" : ridesta.ride_type,
        "lat2" : ridesta.car_latitude,
        'lng2' : ridesta.car_longitude,
    }
    
    if request.method == "POST":
        rideid = request.POST.get("rid")
        timer = request.POST.get("time")
        km = request.POST.get("km")
        ridesta = Ride.objects.get(id=rideid)
        if ridesta.status == '0' and ridesta.publish == '0':
            if ridesta.as_user == "Passenger":
                ridesta.dtime = timer
                ridesta.publish = '1'
                ridesta.save()
            if ridesta.as_user == "Driver":
                km1 = re.sub(",","",km)
                realkm = float(km1.replace("km",""))
                price = realkm * float(ridesta.per_km)
                fees = float(price) / int(ridesta.seats)
                ridesta.fees = fees
                ridesta.map_date = timer
                ridesta.publish = '1'
                ridesta.save()
        # rides = Ride.objects.filter(publish='0')
        # for i in rides:
        #     i.delete()
        directions = Directions(
            lat_a= lat_a,
            long_a=long_a,
            lat_b = lat_b,
            long_b=long_b
            )
        context = {
            "rid": rideid,
            'current_lat' : ridesta.car_latitude,
            'current_lng' : ridesta.car_longitude
        }
        return JsonResponse(context)
    return render(request, 'doxer_admin/maps.html', context)

@csrf_exempt
def Id_proofes(request,pk):
    if pk == '1':
        id = request.POST.get('id')
        getid = Driver.objects.get(id=id)
        return JsonResponse({"name":getid.name.capitalize(),"id1":getid.image1.url,"id2":getid.image2.url})
    if pk == '2':
        id = request.POST.get('id')
        getid = Passanger.objects.get(id=id)
        return JsonResponse({"name":getid.name.capitalize(),"id1":getid.image1.url,"id2":getid.image2.url})






