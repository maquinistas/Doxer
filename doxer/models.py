from django.conf import settings
from django.core.mail import send_mail
from django.db import models
# Create your models here.
rate = (('1', 1), ('2', 2), ('3', 3), ('4', 4), ('5', 5))
Gender = (('M', 'Male'), ('F', 'Female'), ('O', 'Other'))

class Driver(models.Model):
    name = models.CharField(max_length=255,blank=True)
    DeviceId = models.CharField(max_length=255,blank=True,null=True)
    pro_image = models.ImageField(upload_to="Drivers/", height_field=None, width_field=None, default='Drivers/Image.jpg', max_length=255)
    image1 = models.ImageField(upload_to="Drivers_documents/",default='Drivers_documents/idproof.png', height_field=None, width_field=None, max_length=255,blank=True,null=True)
    image2 = models.ImageField(upload_to="Drivers_documents/",default='Drivers_documents/idproof.png', height_field=None, width_field=None, max_length=255,blank=True,null=True)
    img_status = models.CharField(max_length=255,default='0')
    active_ac_with_otp = models.CharField(max_length=10,default='0',choices=[('1',"Verified"),("0","Not Verified"),("2","Forget")])
    email_or_num = models.CharField(max_length=60,blank=True)
    email = models.EmailField(max_length=40,blank=True)
    contact_no = models.CharField(max_length=15,blank=True)
    gender = models.CharField(max_length=10,null=False,blank=False, choices=Gender)
    fare_per_km = models.FloatField(max_length=20,default=255.05)
    dob = models.DateField(blank=True,null=True)
    city = models.CharField(max_length=255,blank=True)
    bio = models.CharField(max_length=255,blank=True)
    otp = models.CharField(max_length=4,blank=True)
    password = models.CharField(max_length=255,blank=True)
    cpassword = models.CharField(max_length=255,blank=True)
    ntk = models.CharField(max_length=255,null=True,blank=True)
    status = models.CharField(max_length=25,null=False,blank=False,choices=(('Active',"Active"),("Deactive","Deactive")))
    create_at = models.DateTimeField(blank=True,null=True)
    update_at = models.DateTimeField(blank=True,null=True)

    def __str__(self):
        return self.name if self.name else self.email_or_num

class Vehical_brand(models.Model):
    brand = models.CharField(max_length=255)
    
    def __str__(self):
        return self.brand
    
class Car_name(models.Model):
    cars = models.CharField(max_length=255)
    brand = models.ForeignKey(Vehical_brand, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.cars
    
class Vehicle(models.Model):
    driverid = models.ForeignKey(Driver, on_delete=models.CASCADE,null=True)
    reg_num = models.CharField(max_length=12)
    vehical_variant = models.ForeignKey(Car_name, on_delete=models.SET_NULL,null=True,blank=True)
    vehicle_color = models.CharField(max_length=255)
    status = models.CharField(max_length=25,default='0',choices=(('0','Pending'),('1','Approval'),('2','Rejected')))
    created = models.DateTimeField(blank=True,null=True)
    updated = models.DateTimeField(blank=True,null=True)
    
    def __str__(self):
        return f"{self.driverid.name} 's {self.vehical_variant.brand} {self.vehical_variant.cars}"

class Passanger(models.Model):
    name = models.CharField(max_length=255,blank=True)
    DeviceId = models.CharField(max_length=255,blank=True,null=True)
    pro_image = models.ImageField(upload_to="Passenger/",default='Passenger/Image.png', height_field=None, width_field=None, max_length=255)
    image1 = models.ImageField(upload_to="Passengers_documents/",default='Passengers_documents/idproof.png', height_field=None, width_field=None, max_length=255,blank=True,null=True)
    image2 = models.ImageField(upload_to="Passengers_documents/",default='Passengers_documents/idproof.png', height_field=None, width_field=None, max_length=255,blank=True,null=True)
    img_status = models.CharField(max_length=255,default='0')
    active_ac_with_otp = models.CharField(max_length=10,default='0',choices=[('1',"Verified"),("0","Not Verified"),("2","Forget")])
    email_or_num = models.CharField(max_length=60,blank=True)
    email = models.EmailField(max_length=40,blank=True)
    contact_no = models.CharField(max_length=15,blank=True)
    gender = models.CharField(max_length=10,null=False,blank=False, choices=Gender)
    dob = models.DateField(blank=True,null=True)
    city = models.CharField(max_length=255,blank=True)
    bio = models.CharField(max_length=255,blank=True)
    otp = models.CharField(max_length=4,blank=True)
    password = models.CharField(max_length=255,blank=True)
    cpassword = models.CharField(max_length=255,blank=True)
    ntk = models.CharField(max_length=255,null=True,blank=True)
    status = models.CharField(max_length=25,null=False,blank=False,choices=(('Active',"Active"),("Deactive","Deactive")))
    create = models.DateTimeField(blank=True)
    update = models.DateTimeField(blank=True)
    
    def __str__(self):
        return self.name
  
class Cities(models.Model):
    name = models.CharField(max_length=255)
    class Meta:
        ordering = ['name']
        
    def __str__(self):
        return self.name
    
class Ride(models.Model):
    as_user = models.CharField(max_length=255,blank=True,null=True)
    getdriver = models.ForeignKey(Driver, on_delete=models.CASCADE,null=True,blank=True)
    getpassenger = models.ForeignKey(Passanger, on_delete=models.CASCADE,null=True,blank=True)
    ride_type = models.CharField(max_length=20,choices=[('T','Truck'),('C','Car')])
    route = models.TextField(blank=True,null=True)
    capacity = models.CharField(max_length=255,null=True,blank=True)
    car = models.ForeignKey(Vehicle, on_delete=models.SET_NULL,null=True,blank=True)
    pickUp = models.CharField(max_length=255,blank=True,null=True)
    pickUp_latitude = models.CharField(blank=True,max_length=255)
    pickUp_longitude = models.CharField(blank=True,max_length=255)
    dropout = models.CharField(max_length=255,blank=True,null=True)
    dropout_latitude = models.CharField(blank=True,max_length=255)
    dropout_longitude = models.CharField(blank=True,max_length=255)
    pickup_address1 = models.CharField(blank=True,max_length=255)
    pickup_address2 = models.CharField(blank=True,max_length=255)
    dropout_address1 = models.CharField(blank=True,max_length=255)
    dropout_address2 = models.CharField(blank=True,max_length=255)
    car_latitude = models.CharField(blank=True,max_length=255)
    car_longitude = models.CharField(blank=True,max_length=255)
    per_km = models.CharField(blank=True,max_length=255)
    date = models.DateField(blank=True,null=True)
    time = models.CharField(blank=True,max_length=255,null=True)
    dtime = models.CharField(blank=True,max_length=255,null=True)
    seats = models.CharField(default=0,max_length=25,blank=True)
    fees = models.FloatField(max_length=6,blank=True,null=True)
    Max_seats = models.BigIntegerField(default=0,blank=True)
    Max_parcel = models.BigIntegerField(default=0,blank=True)
    add_information = models.TextField(blank=True)
    map_date = models.CharField(blank=True,max_length=255,null=True)
    publish = models.CharField(default=0,max_length=20,choices=[('0','No'),('1','Yes'),('2','BLOCK USER')])
    status = models.CharField(default=0,max_length=20,choices=[('0','Pending'),('1','Ride Full'),('3','Ride Cancel')])
    trip_status = models.CharField(default='P',max_length=20,choices=[('P','Pending'),('O','On The Way'),('E','Complete Trip')])
    ride_time = models.DateTimeField(blank=True,null=True)
    create_at = models.DateTimeField(blank=True,null=True)
    update_at = models.DateTimeField(blank=True,null=True)

class Ride_pin(models.Model):
    as_user = models.CharField(max_length=255,blank=True,null=True)
    getdriver = models.ForeignKey(Driver, on_delete=models.CASCADE,null=True,blank=True)
    getride = models.ForeignKey(Ride, on_delete=models.CASCADE,null=True,blank=True,related_name='Driver')
    getride1 = models.ForeignKey(Ride, on_delete=models.CASCADE,null=True,blank=True,related_name='Passenger')
    passengerid = models.ForeignKey(Passanger, on_delete=models.CASCADE,null=True)
    car = models.ForeignKey(Vehicle, on_delete=models.SET_NULL,null=True,blank=True)
    ride_type = models.CharField(max_length=25,blank=True,null=True,choices=[('T','Truck'),('C','Car')])
    ride_date = models.DateField(blank=True,null=True)
    ride_time = models.CharField(blank=True,max_length=255)
    offer_price = models.CharField(max_length=255,blank=True,null=True)
    pickup_address1 = models.CharField(blank=True,max_length=255)
    pickup_address2 = models.CharField(blank=True,max_length=255)
    dropout_address1 = models.CharField(blank=True,max_length=255)
    dropout_address2 = models.CharField(blank=True,max_length=255)
    for_passenger = models.BigIntegerField(default=0,blank=True)
    for_parcel = models.BigIntegerField(default=0,blank=True)
    pickUp = models.CharField(max_length=255,blank=True,null=True)
    pickUp_latitude = models.CharField(blank=True,max_length=255)
    pickUp_longitude = models.CharField(blank=True,max_length=255)
    dropout = models.CharField(max_length=255,blank=True,null=True)
    dropout_latitude = models.CharField(blank=True,max_length=255)
    dropout_longitude = models.CharField(blank=True,max_length=255)
    status = models.CharField(default=0,max_length=20,choices=[('0','Pending'),('1','Request Confirm'),('2','Request Cancel'),('3','Ride Cancel')])
    pas_status = models.CharField(default='W',max_length=20,choices=[('W','Waiting'),('O','On The Way'),('E','Complete')])
    fees = models.FloatField(max_length=20,blank=True,null=True)
    today = models.DateField(blank=True,null=True)
    request_date = models.DateTimeField(blank=True)

class Drivers_Rating(models.Model):
    mine = models.ForeignKey(Driver, on_delete=models.CASCADE)
    tri = models.ForeignKey(Ride,on_delete=models.CASCADE,blank=True,null=True)
    passengerid = models.ForeignKey(Passanger, on_delete=models.SET_NULL,blank=True,null=True)
    rates = models.CharField(max_length=5 ,blank=True,null=True,choices=(('1','1'),('2','2'),('3','3'),('4','4'),('5','5')))
    review = models.TextField(blank=True)
    create = models.DateField(blank=True,null=True)

class Driver_Report(models.Model):
    mine = models.ForeignKey(Driver,on_delete=models.CASCADE)
    tri = models.ForeignKey(Ride,on_delete=models.CASCADE,blank=True,null=True)
    passengerid = models.ForeignKey(Passanger,on_delete=models.SET_NULL,blank=True,null=True)
    report_text = models.TextField(blank=True)
    create = models.DateField(blank=True,null=True)

class Passenger_Rating(models.Model):
    mine = models.ForeignKey(Passanger, on_delete=models.CASCADE)
    tri = models.ForeignKey(Ride_pin,on_delete=models.CASCADE,blank=True,null=True)
    driverid = models.ForeignKey(Driver, on_delete=models.SET_NULL,blank=True,null=True)
    rates = models.CharField(max_length=2 ,choices=(('1','1'),('2','2'),('3','3'),('4','4'),('5','5')))
    review = models.TextField(blank=True)
    create = models.DateField(blank=True,null=True)

class Passenger_Report(models.Model):
    mine = models.ForeignKey(Passanger, on_delete=models.CASCADE)
    tri = models.ForeignKey(Ride_pin,on_delete=models.CASCADE,blank=True,null=True)
    driverid = models.ForeignKey(Driver, on_delete=models.SET_NULL,blank=True,null=True)
    report_text = models.TextField(blank=True)
    create = models.DateField(blank=True,null=True)

class Search_History(models.Model):
    driverid = models.ForeignKey(Driver,on_delete=models.CASCADE,blank=True,null=True)
    passengerid = models.ForeignKey(Passanger,on_delete=models.CASCADE,blank=True,null=True)
    pick = models.CharField(max_length=255)
    drop = models.CharField(max_length=255)
    pick_lat = models.CharField(max_length=255)
    pick_lng = models.CharField(max_length=255)
    drop_lat = models.CharField(max_length=255)
    drop_lng = models.CharField(max_length=255)
    date = models.DateField(null=True,blank=True)
    location = models.CharField(max_length=255)
    create = models.DateField(blank=True,null=True)

class Car_Details(models.Model):
    # source_url = models.CharField(db_column='Source URL', max_length=100, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    make = models.CharField(db_column='Make', max_length=9, blank=True, null=True)  # Field name made lowercase.
    model = models.CharField(db_column='Model', max_length=20, blank=True, null=True)  # Field name made lowercase.
    version = models.CharField(db_column='Version', max_length=29, blank=True, null=True)  # Field name made lowercase.
    notes = models.CharField(db_column='Notes', max_length=12, blank=True, null=True)  # Field name made lowercase.
    image_url = models.CharField(db_column='Image URL', max_length=1061, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    key_seating_capacity = models.CharField(db_column='Key Seating Capacity', max_length=8, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    seating_capacity = models.CharField(db_column='Seating Capacity', max_length=8, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    no_of_seating_rows = models.CharField(db_column='No of Seating Rows', max_length=6, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bootspace = models.CharField(db_column='Bootspace', max_length=10, blank=True, null=True)  # Field name made lowercase.
    