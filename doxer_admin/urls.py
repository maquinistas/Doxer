from django.urls import path
from . import views


app_name = "doxer_admin"

urlpatterns = [
    path('',views.LoginPage,name='loginpage'),
    path('index/',views.home,name='indexpage'),
    path('all-drivers/',views.All_Drivers,name='alldrivers'),
    path('all-passengers/',views.All_Passengers,name='allpassenger'),
    path('all-cars/',views.All_Cars,name='allcars'),
    path('all-rides/',views.All_Rides,name='allrides'),
    
    
    # path('admin-add-form/',views.Add_Driver_Form,name='driverform'),
    
    path('Car-accepted/',views.car_accept,name='caraccept'),
    path('Car-rejected/',views.car_reject,name='carreject'),
    path('block-unblock-passenger/',views.BlockPassenger,name='blockpas'),
    path('block-unblock-driver/',views.BlockDriver,name='blockdri'),
    path('edit-price/',views.editprice,name='editprices'),
    path('edit-editcar/',views.editcar,name='editcar'),
    path('showid-Driver/<str:pk>',views.Id_proofes,name='showid'),
    path('update-price/',views.updateprice,name='updatepriceb'),
    path('accepted-cars/',views.Accepted_Cars,name='acceptedcar'),
    
    
    path('admin-login/',views.LoginAdmin,name='loginadmins'),
    path('admin-logout/',views.LogoutAdmin,name='Logoutadin'),
    
    # Map APIs
    path('map-view/',views.map_view,name='mapview'),
    path('map',views.map,name='map'),
    
]
