from django.urls import path
from . import views,driver,passenger


# Drivers
driverurl = [
    # Profile View Login Signup And Update
    path(r"login-driver/",driver.LoginDriver),
    path(r"sign-up-driver/",driver.SignUpDriver),
    path(r"resend-otp-driver/",driver.ResendOtpDriver),
    path(r"forgot-otp-driver/",driver.ForgotOtpSendDriver),
    path(r"check-otp-driver/",driver.VerifyOtpDriver),
    path(r"forgot-new-password-driver/",driver.ForgotSetPasswordDriver),
    path(r"get-driver-profile-<str:pk>/",driver.DriverProfile),
    path(r"get-&-update-driver-<str:pk>/",driver.UpdateDriver),
    path(r"driver-password-update-<str:pk>/",driver.DriverChangePassword),
    path(r"driver-add-document-<str:pk>/",driver.SendIDProofe),
    path(r"driver-get-document-<str:pk>/",driver.MyIdProofe),
    # Add Ride And Stop
    # ---->Car Listing
    path(r"cars-listing-<str:pk>/",driver.CarsListing),
    path(r"add-car-ride-<str:pk>/",driver.AddRideForCar),
    path(r"add-truck-ride-<str:pk>/",driver.AddRideForTruck),
    path(r"get-my-car-rides-<str:pk>/",driver.GetMyCarRide),
    path(r"get-my-truck-rides-<str:pk>/",driver.GetMyTruckRide),
    path(r"driver-stop-ride-<str:pk>/",driver.RidePublishedStop),
    # Search For Ride Request By Passenger
    path(r"search-booking-<str:dd>-by-driver/",driver.SerchBookingFilter),
    # path(r"driver-get-booking-details-<str:pk>/",driver.DriverBookingList),
    path(r"driver-send-request-for-booking-<str:did>-<str:bid>/",driver.RequestForBooking),
    path(r"driver-get-own-bid-<str:pk>/",driver.GetOwnBookin_PinListing),
    # Request For Booking Accept And Reject
    path(r"get-all-ride-request-<str:pk>/",driver.RidesBookingFilter),
    path(r"ride-request-listing-<str:pk>/",driver.RideListingOfFilter),
    path(r"accept-passenger-request-<str:pk>/",driver.AcceptRequestForTripByDriver),
    path(r"reject-passenger-request-<str:pk>/",driver.RejectRequestForTripByDriver),
    path(r"driver-stop-request-<str:pk>/",driver.CancelRideRequest),
    # Car Add
    path(r"driver-add-car-<str:pk>-<str:mid>/",driver.DriverAddCar),
    path(r"passengers-profile-view-<str:pk>/",driver.PassengerProfileViewByPassenger),
    path(r"driver-gives-rating-<str:Rid>/",driver.DriverGiveRating),
    path(r"driver-report-passenger-<str:Rid>/",driver.ReportPassengerBehavior),
    path(r"driver-add-history-<str:pk>/",driver.AddHistory),
    path(r"driver-view-history-<str:pk>-<str:ll>/",driver.HistoryView),
    path(r"driver-status-block-unblock-<str:pk>/",driver.BlockStatusForDriver),
    path(r"driver-list-of-rating-<str:pk>/",driver.DriverGetRating),
    path(r"driver-driven-of-rating-<str:pk>/",driver.DriverDrivenRatingList),
    path(r"driver-trip/<str:pk>/",driver.tripsetting),
    path(r"driver-cars-list/<str:pk>/",driver.MyCars),
    path(r"driver-contact-us/",driver.ContactUsDriver),
    path(r"driver-current-loction/<str:pk>/",driver.CurrentLoc),
    path(r"driver-RatingDetailsPageForRecieve/<str:pk>/",driver.RatingDetailsPageForRecieve),
    path(r"driver-GivenRatingDetailsPageFor/<str:pk>/",driver.GivenRatingDetailsPageFor),
    path(r"driver-BidDetalis/<str:pk>/<str:dd>/",driver.BidDetalis),
]

# Passenger
passengerurl = [
    # Login Signup And Profile
    path(r"login-passenger/",passenger.LoginPassanger),
    path(r"sign-up-passenger/",passenger.SignUpPassanger),
    path(r"resend-otp-passenger/",passenger.ResendOtpPassanger),
    path(r"forgot-otp-passenger/",passenger.ForgotOtpSendPassanger),
    path(r"check-otp-passenger/",passenger.VerifyOtpPassanger),
    path(r"forgot-new-password-passenger/",passenger.ForgotSetNewPasswordPassenger),
    path(r"get-passenger-profile-<str:pk>/",passenger.PassengerProfile),
    path(r"get-&-update-passenger-<str:pk>/",passenger.UpdatePassenger),
    path(r"passenger-password-update-<str:pk>/",passenger.PassengerChangePassword),
    path(r"passenger-add-document-<str:pk>/",passenger.SendIDProofe),
    path(r"passenger-get-document-<str:pk>/",passenger.MyIdProofe),
    # Booking == Request Add For Published
    path(r"passenger-add-booking-<str:pk>/",passenger.PassengerAddBooking),
    path(r"passenger-get-own-request-listing-<str:pk>/",passenger.PassengerRideList),
    path(r"passenger-stop-request-<str:pk>/",passenger.BookingPublishedStop),
    # Searching Ride
    path(r"passenger-search-ride-<str:dd>/",passenger.SearchForRide),
    path(r"get-ride-details-<str:pk>-<str:pp>/",passenger.ViewRideDetails),
    path(r"passenger-send-request-for-ride-booking-<str:pid>-<str:rid>/",passenger.RequestForRide),
    # Request For Booking Ride Listing And View Details
    path(r"passenger-get-own-booking-listing-<str:pk>/",passenger.PassengerBookingList),
    path(r"passenger-get-own-truck-booking-listing-<str:pk>/",passenger.PassengerBookingListByT),
    path(r"passenger-get-own-booking-details-<str:pk>-<str:pp>/",passenger.OwnBookingFilterDetails),
    # Drive's Request Listing And Accept & Rejects
    path(r"get-all-booking-request-<str:pk>/",passenger.ViewPassengerRide),
    path(r"accept-driver-request-<str:pk>/",passenger.AcceptRequestForTripByPassenger),
    path(r"reject-driver-request-<str:pk>/",passenger.RejectRequestForTripByPassenger),
    path(r"passenger-stop-ride-<str:pk>/",passenger.CancelBooking),
    # Filter
    path(r"ride-filter-by-passenger/",passenger.MultiRideFilterByPassenger),
    # path(r"ride-time-by-show/",passenger.timeRideFilterByPassenger), 
    
    path(r"passenger-status-block-unblock-<str:pk>/",passenger.BlockStatusForDriver),
    path(r"filter-ride-type-<str:pk>/",passenger.FilterRideType),
    path(r"passenger-gives-rating-<str:Rid>/<str:pp>/",passenger.PassengerGiveRating),
    path(r"passenger-list-of-rating-<str:pk>/",passenger.PassengerGetRating),
    path(r"passenger-driven-of-rating-<str:pk>/",passenger.PassengerDrivenRating),
    path(r"drivers-profile-view-<str:pk>/",passenger.DriverProfileViewByPassenger),
    path(r"passenger-report-driver-<str:Rid>/<str:pk>/",passenger.ReportDriverBehavior),
    path(r"passenger-add-history-<str:pk>/",passenger.AddHistory),
    path(r"passenger-view-history-<str:pk>-<str:ll>/",passenger.HistoryView),
    path(r"passenger-trip/<str:pk>/",passenger.tripsetting),
    path(r'passenger-contact-us/',passenger.ContactUsPassenger),
    path(r'passenger-BidDetalis/<str:pk>/',passenger.BidDetalis),
    path(r'passenger-RatingDetailsPageForRecieve/<str:pk>/',passenger.RatingDetailsPageForRecieve),
    path(r'passenger-GivenRatingDetailsPageFor/<str:pk>/',passenger.GivenRatingDetailsPageFor),
]

viewurl = [
    path(r"get-city/",views.SerachCities),
    path(r"get-all-city/",views.AllCities),
    path(r"get-all-brands/",views.ShowAllBrand),
    path(r"get-car-name-of-brand-<str:pk>/",views.ShowCarOfBrand),
]

urlpatterns = driverurl + passengerurl + viewurl
