from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import *
from django.core.exceptions import *
from .models import *
from django.conf import settings
from django.core.mail import send_mail
from django.contrib.auth.hashers  import make_password,check_password
from . import driver,passenger
from time import gmtime, strftime
showtime = strftime("%Y-%m-%d %H:%M:%S", )

email_pattern = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$' 
mobile_pattern = '^[0-9]{10}$'

import math,random
import re
def genrateOtp():
    digits = '0123456789'
    OTP = ''
    for i in range(4):
        OTP += digits[math.floor(random.random()*10)]
    return OTP

# All City Filter   
@api_view(['GET'])
def AllCities(request):
    data = request.data
    city = Cities.objects.all()
    allcity = CitySerializer(city,many=True)
    return Response(allcity.data)

# Search City Name
@api_view(['POST'])
def SerachCities(request):
    data = request.data
    cit = data['name'].casefold()
    name = cit.capitalize()
    city = Cities.objects.filter(name__startswith=name)
    if len(city) > 0:
        ls = []
        for i in city:
            dic = {}
            dic['city'] = i.name.capitalize()
            ls.append(dic)
        return Response({'status':1 ,'msg': 'City Founded','name' : ls})
    else:
        return Response({'status':0 ,"msg":"Record Not Founded"})

@api_view(['GET'])
def GetRides(request):
    ride = Ride.objects.all()
    gets = RideSerializer(ride,many=True)
    return Response({"status" : 1,"msg" : "success","data" : gets.data})

@api_view(['GET'])
def ShowAllBrand(request):
    allbrand = Vehical_brand.objects.all()
    serial = Vehical_brandSeializer(allbrand,many=True)
    return Response({'status':1,"msg":"success","data":serial.data})

@api_view(['GET'])
def ShowCarOfBrand(request,pk):
    try:
        brand = Vehical_brand.objects.get(id=pk)
        allc = Car_name.objects.filter(brand=brand)
        if allc:
            se = CarsSeializer(allc,many=True)
            return Response({'status':1,"msg":"success","data":se.data})
        else:
            return Response({'status':0,"msg":"No Record"})
    except ObjectDoesNotExist:
        return Response({'status':0,"msg":"Wrong Id"})
