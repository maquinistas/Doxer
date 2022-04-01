from django.contrib import admin
from .models import *
# Register your models here.

class Driveradmin(admin.ModelAdmin):
    # model = User
    list_per_page = 15 # No of records per page 
    list_display = ('id','name', 'email', 'contact_no', 'gender','city', 'otp', 'create_at', 'update_at')
    list_display_links = ('id','name', 'email', 'contact_no', 'gender', 'city', 'otp', 'create_at', 'update_at')
    list_filter = ('gender'),
    ordering = ('id'),
    search_fields = ('name','gender')

class Passangerradmin(admin.ModelAdmin):
    list_per_page = 15 # No of records per page 
    list_display = ('id','name', 'email', 'contact_no', 'gender','city', 'otp', 'create', 'update')
    list_display_links = ('id','name', 'email', 'contact_no', 'gender', 'city', 'otp', 'create', 'update')
    list_filter = ('gender'),
    ordering = ('id'),
    search_fields = ('name','gender')

class bookingadmin(admin.ModelAdmin):
    list_per_page = 15 # No of records per page 
    list_display = ('id','passanger_name','pickUp','dropout','date')
    list_display_links = ('id','passanger_name','pickUp','dropout','date')
    ordering = ('id'),
    search_fields = ('passanger_name'),

class rideadmin(admin.ModelAdmin):
    list_per_page = 15 # No of records per page 
    list_display = ('id','as_user','ride_type','pickUp','dropout','date','trip_status','seats','capacity','fees','status')
    list_display_links = ('id','as_user','ride_type','pickUp','dropout','date','seats','capacity')
    ordering = ('id'),
    list_editable = ('fees'),('status'),
    search_fields = ('driver'),

class vehicaladmin(admin.ModelAdmin):
    list_per_page = 15 # No of records per page 
    list_display = ('id','driverid','reg_num','vehical_variant','vehicle_color','status','created','updated')
    list_display_links = ('id','driverid','reg_num','vehical_variant','vehicle_color','created','updated')
    ordering = ('id'),
    list_editable = ('status'),
    list_filter = ('status'),

class ridepin(admin.ModelAdmin):
    list_display = ('id','as_user','getdriver','getride','passengerid','ride_type','today','status','fees')
    list_display_links = ('id','getdriver','getride','passengerid','ride_type','today','status','fees')
    
# SHOW ON ADMIN PANEL 
admin.site.register(Driver,Driveradmin)
admin.site.register(Passanger,Passangerradmin)
admin.site.register(Ride,rideadmin)
admin.site.register(Vehical_brand)
admin.site.register(Car_name)
admin.site.register(Drivers_Rating)
admin.site.register(Passenger_Rating)
admin.site.register(Ride_pin,ridepin)
admin.site.register(Vehicle,vehicaladmin)




