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

# from geopy.geocoders import Nominatim


# geolocator = Nominatim(user_agent="geoapiExercises")
# # Latitude & Longitude input
# Latitude = "23.0225° N"
# Longitude = "72.5714° E"
# location = geolocator.reverse(Latitude+","+Longitude)

# address = location.raw['address']
  
# # traverse the data
# city = address.get('city', '')
# # state = address.get('state', '')
# # country = address.get('country', '')
# # code = address.get('country_code')
# # zipcode = address.get('postcode')
# print('City : ', city)
# # print('State : ', state)
# # print('Country : ', country)
# # print('Zip Code : ', zipcode)
  
# # Display
# print('----------------------------->',city)
from pytz import country_timezones
# print(' '.join(country_timezones('IN')))
# Europe/Zurich


# importing geopy library
# from geopy.geocoders import Nominatim
 
# # calling the Nominatim tool
# loc = Nominatim(user_agent="GetLoc")
 
# # entering the location name
# getLoc = loc.geocode("Surat,gujarat,india")
 
# # printing address
# print((getLoc.address))
 
# # # printing latitude and longitude
# print("Latitude = ", getLoc.latitude,)
# print("Longitude = ", getLoc.longitude)

# Create your views here.

# navigato.geolocation.getCurrentPosition()


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
    name = data['name']
    city = Cities.objects.filter(name=name)
    if len(city) > 0:
        getcity = Cities.objects.get(id=city[0].id)
        return Response({'name' :getcity.name ,'status':1 ,'msg': 'City Founded'})
    else:
        return Response({'status':0 ,"msg":"Record Not Founded"})

# Get All Ride Information
@api_view(['GET'])
def GetRides(request):
    ride = Ride.objects.all()
    gets = RideSerializer(ride,many=True)
    return Response({"status" : 1,"msg" : "success","data" : gets.data})

# @api_view(['GET'])
# def GetAllBookings(request):
#     book = Booking.objects.filter(status=0)
#     gets = BookingSerializer(book,many=True)
#     return Response({"status" : 1,"msg" : "success","data" :gets.data})

# @api_view(['GET'])
# def GetAllRides(request):
#     ride = Ride.objects.filter(status=0)
#     gets = RideSerializer(ride,many=True)
#     return Response({"status" : 1,"msg" : "success","data" :gets.data})

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
        
# @api_view(['GET'])
# def ShowCarsModels(request,pk):
#     try:
#         car = Car_name.objects.get(id=pk)
#         allc = vehical_model.objects.filter(car=car)
#         if allc:
#             se = ModelsSeializer(allc,many=True)
#             return Response({'status':1,"msg":"success","data":se.data})
#         else:
#             return Response({'status':0,"msg":"No Record"})
#     except ObjectDoesNotExist:
#         return Response({'status':0,"msg":"Wrong Id"})

# @api_view()