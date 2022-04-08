# Generated by Django 3.2.11 on 2022-04-08 05:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Car_name',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cars', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Cities',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Driver',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255)),
                ('pro_image', models.ImageField(default='Drivers/Image.jpg', max_length=255, upload_to='Drivers/')),
                ('image1', models.ImageField(blank=True, default='Drivers_documents/idproof.png', max_length=255, null=True, upload_to='Drivers_documents/')),
                ('image2', models.ImageField(blank=True, default='Drivers_documents/idproof.png', max_length=255, null=True, upload_to='Drivers_documents/')),
                ('img_status', models.CharField(default='0', max_length=255)),
                ('active_ac_with_otp', models.CharField(choices=[('1', 'Verified'), ('0', 'Not Verified'), ('2', 'Forget')], default='0', max_length=10)),
                ('email_or_num', models.CharField(blank=True, max_length=60)),
                ('email', models.EmailField(blank=True, max_length=40)),
                ('contact_no', models.CharField(blank=True, max_length=15)),
                ('gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female'), ('O', 'Other')], max_length=10)),
                ('fare_per_km', models.FloatField(default=255.05, max_length=20)),
                ('dob', models.DateField(blank=True, null=True)),
                ('city', models.CharField(blank=True, max_length=255)),
                ('bio', models.CharField(blank=True, max_length=255)),
                ('otp', models.CharField(blank=True, max_length=4)),
                ('password', models.CharField(blank=True, max_length=255)),
                ('cpassword', models.CharField(blank=True, max_length=255)),
                ('ntk', models.CharField(blank=True, max_length=255, null=True)),
                ('status', models.CharField(choices=[('Active', 'Active'), ('Deactive', 'Deactive')], max_length=25)),
                ('create_at', models.DateTimeField(blank=True, null=True)),
                ('update_at', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Passanger',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255)),
                ('pro_image', models.ImageField(default='Passenger/Image.jpg', max_length=255, upload_to='Passenger/')),
                ('image1', models.ImageField(blank=True, default='Passengers_documents/idproof.png', max_length=255, null=True, upload_to='Passengers_documents/')),
                ('image2', models.ImageField(blank=True, default='Passengers_documents/idproof.png', max_length=255, null=True, upload_to='Passengers_documents/')),
                ('img_status', models.CharField(default='0', max_length=255)),
                ('active_ac_with_otp', models.CharField(choices=[('1', 'Verified'), ('0', 'Not Verified'), ('2', 'Forget')], default='0', max_length=10)),
                ('email_or_num', models.CharField(blank=True, max_length=60)),
                ('email', models.EmailField(blank=True, max_length=40)),
                ('contact_no', models.CharField(blank=True, max_length=15)),
                ('gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female'), ('O', 'Other')], max_length=10)),
                ('dob', models.DateField(blank=True, null=True)),
                ('city', models.CharField(blank=True, max_length=255)),
                ('bio', models.CharField(blank=True, max_length=255)),
                ('otp', models.CharField(blank=True, max_length=4)),
                ('password', models.CharField(blank=True, max_length=255)),
                ('cpassword', models.CharField(blank=True, max_length=255)),
                ('ntk', models.CharField(blank=True, max_length=255, null=True)),
                ('status', models.CharField(choices=[('Active', 'Active'), ('Deactive', 'Deactive')], max_length=25)),
                ('create', models.DateTimeField(blank=True)),
                ('update', models.DateTimeField(blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Ride',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('as_user', models.CharField(blank=True, max_length=255, null=True)),
                ('ride_type', models.CharField(choices=[('T', 'Truck'), ('C', 'Car')], max_length=20)),
                ('route', models.TextField(blank=True, null=True)),
                ('capacity', models.CharField(blank=True, max_length=255, null=True)),
                ('pickUp', models.CharField(blank=True, max_length=255, null=True)),
                ('pickUp_latitude', models.CharField(blank=True, max_length=255)),
                ('pickUp_longitude', models.CharField(blank=True, max_length=255)),
                ('dropout', models.CharField(blank=True, max_length=255, null=True)),
                ('dropout_latitude', models.CharField(blank=True, max_length=255)),
                ('dropout_longitude', models.CharField(blank=True, max_length=255)),
                ('pickup_address1', models.CharField(blank=True, max_length=255)),
                ('pickup_address2', models.CharField(blank=True, max_length=255)),
                ('dropout_address1', models.CharField(blank=True, max_length=255)),
                ('dropout_address2', models.CharField(blank=True, max_length=255)),
                ('car_latitude', models.CharField(blank=True, max_length=255)),
                ('car_longitude', models.CharField(blank=True, max_length=255)),
                ('date', models.DateField(blank=True, null=True)),
                ('time', models.CharField(blank=True, max_length=255, null=True)),
                ('dtime', models.CharField(blank=True, max_length=255, null=True)),
                ('seats', models.CharField(blank=True, default=1, max_length=25)),
                ('fees', models.FloatField(blank=True, max_length=6, null=True)),
                ('Max_seats', models.BigIntegerField(blank=True, default=1)),
                ('Max_parcel', models.BigIntegerField(blank=True, default=1)),
                ('add_information', models.TextField(blank=True)),
                ('map_date', models.CharField(blank=True, max_length=255, null=True)),
                ('publish', models.CharField(choices=[('0', 'No'), ('1', 'Yes')], default=0, max_length=20)),
                ('status', models.CharField(choices=[('0', 'Pending'), ('1', 'Ride Full'), ('3', 'Ride Cancel')], default=0, max_length=20)),
                ('trip_status', models.CharField(choices=[('P', 'Pending'), ('O', 'On The Way'), ('E', 'Complete Trip')], default='P', max_length=20)),
                ('create_at', models.DateTimeField(blank=True, null=True)),
                ('update_at', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Vehical_brand',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brand', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Vehicle',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reg_num', models.CharField(max_length=12)),
                ('vehicle_color', models.CharField(max_length=255)),
                ('status', models.CharField(choices=[('0', 'Pending'), ('1', 'Approval'), ('2', 'Rejected')], default='0', max_length=25)),
                ('created', models.DateTimeField(blank=True, null=True)),
                ('updated', models.DateTimeField(blank=True, null=True)),
                ('driverid', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.driver')),
                ('vehical_variant', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.car_name')),
            ],
        ),
        migrations.CreateModel(
            name='Search_History',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pick', models.CharField(max_length=255)),
                ('drop', models.CharField(max_length=255)),
                ('pick_lat', models.CharField(max_length=255)),
                ('pick_lng', models.CharField(max_length=255)),
                ('drop_lat', models.CharField(max_length=255)),
                ('drop_lng', models.CharField(max_length=255)),
                ('date', models.DateField(blank=True, null=True)),
                ('location', models.CharField(max_length=255)),
                ('create', models.DateField(blank=True, null=True)),
                ('driverid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.driver')),
                ('passengerid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.passanger')),
            ],
        ),
        migrations.CreateModel(
            name='Ride_pin',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('as_user', models.CharField(blank=True, max_length=255, null=True)),
                ('ride_type', models.CharField(blank=True, choices=[('T', 'Truck'), ('C', 'Car')], max_length=25, null=True)),
                ('ride_date', models.DateField(blank=True, null=True)),
                ('ride_time', models.CharField(blank=True, max_length=255)),
                ('offer_price', models.CharField(blank=True, max_length=255, null=True)),
                ('pickup_address1', models.CharField(blank=True, max_length=255)),
                ('pickup_address2', models.CharField(blank=True, max_length=255)),
                ('dropout_address1', models.CharField(blank=True, max_length=255)),
                ('dropout_address2', models.CharField(blank=True, max_length=255)),
                ('for_passenger', models.BigIntegerField(blank=True, default=0)),
                ('for_parcel', models.BigIntegerField(blank=True, default=0)),
                ('pickUp', models.CharField(blank=True, max_length=255, null=True)),
                ('pickUp_latitude', models.CharField(blank=True, max_length=255)),
                ('pickUp_longitude', models.CharField(blank=True, max_length=255)),
                ('dropout', models.CharField(blank=True, max_length=255, null=True)),
                ('dropout_latitude', models.CharField(blank=True, max_length=255)),
                ('dropout_longitude', models.CharField(blank=True, max_length=255)),
                ('status', models.CharField(choices=[('0', 'Pending'), ('1', 'Request Confirm'), ('2', 'Request Cancel'), ('3', 'Ride Cancel')], default=0, max_length=20)),
                ('pas_status', models.CharField(choices=[('W', 'Waiting'), ('O', 'On The Way'), ('E', 'Complete')], default='W', max_length=20)),
                ('fees', models.FloatField(blank=True, max_length=20, null=True)),
                ('today', models.DateField(blank=True, null=True)),
                ('request_date', models.DateTimeField(blank=True)),
                ('car', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.vehicle')),
                ('getdriver', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.driver')),
                ('getride', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Driver', to='doxer.ride')),
                ('getride1', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Passenger', to='doxer.ride')),
                ('passengerid', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.passanger')),
            ],
        ),
        migrations.AddField(
            model_name='ride',
            name='car',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.vehicle'),
        ),
        migrations.AddField(
            model_name='ride',
            name='getdriver',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.driver'),
        ),
        migrations.AddField(
            model_name='ride',
            name='getpassenger',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.passanger'),
        ),
        migrations.CreateModel(
            name='Passenger_Report',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('report_text', models.TextField(blank=True)),
                ('create', models.DateField(blank=True, null=True)),
                ('driverid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.driver')),
                ('mine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='doxer.passanger')),
                ('tri', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.ride_pin')),
            ],
        ),
        migrations.CreateModel(
            name='Passenger_Rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rates', models.CharField(choices=[('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5')], max_length=2)),
                ('review', models.TextField(blank=True)),
                ('create', models.DateField(blank=True, null=True)),
                ('driverid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.driver')),
                ('mine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='doxer.passanger')),
                ('tri', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.ride_pin')),
            ],
        ),
        migrations.CreateModel(
            name='Drivers_Rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rates', models.CharField(blank=True, choices=[('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5')], max_length=5, null=True)),
                ('review', models.TextField(blank=True)),
                ('create', models.DateField(blank=True, null=True)),
                ('mine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='doxer.driver')),
                ('passengerid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.passanger')),
                ('tri', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.ride')),
            ],
        ),
        migrations.CreateModel(
            name='Driver_Report',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('report_text', models.TextField(blank=True)),
                ('create', models.DateField(blank=True, null=True)),
                ('mine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='doxer.driver')),
                ('passengerid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='doxer.passanger')),
                ('tri', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doxer.ride')),
            ],
        ),
        migrations.AddField(
            model_name='car_name',
            name='brand',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='doxer.vehical_brand'),
        ),
    ]
