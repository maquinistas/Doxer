# Generated by Django 3.2.11 on 2022-04-08 05:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='driver_report',
            name='mine',
        ),
        migrations.RemoveField(
            model_name='driver_report',
            name='passengerid',
        ),
        migrations.RemoveField(
            model_name='driver_report',
            name='tri',
        ),
        migrations.RemoveField(
            model_name='drivers_rating',
            name='mine',
        ),
        migrations.RemoveField(
            model_name='drivers_rating',
            name='passengerid',
        ),
        migrations.RemoveField(
            model_name='drivers_rating',
            name='tri',
        ),
        migrations.RemoveField(
            model_name='passenger_rating',
            name='driverid',
        ),
        migrations.RemoveField(
            model_name='passenger_rating',
            name='mine',
        ),
        migrations.RemoveField(
            model_name='passenger_rating',
            name='tri',
        ),
        migrations.RemoveField(
            model_name='passenger_report',
            name='driverid',
        ),
        migrations.RemoveField(
            model_name='passenger_report',
            name='mine',
        ),
        migrations.RemoveField(
            model_name='passenger_report',
            name='tri',
        ),
        migrations.RemoveField(
            model_name='ride',
            name='car',
        ),
        migrations.RemoveField(
            model_name='ride',
            name='getdriver',
        ),
        migrations.RemoveField(
            model_name='ride',
            name='getpassenger',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='car',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='getdriver',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='getride',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='getride1',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='passengerid',
        ),
        migrations.RemoveField(
            model_name='search_history',
            name='driverid',
        ),
        migrations.RemoveField(
            model_name='search_history',
            name='passengerid',
        ),
        migrations.RemoveField(
            model_name='vehicle',
            name='driverid',
        ),
        migrations.RemoveField(
            model_name='vehicle',
            name='vehical_variant',
        ),
        migrations.DeleteModel(
            name='Driver',
        ),
        migrations.DeleteModel(
            name='Driver_Report',
        ),
        migrations.DeleteModel(
            name='Drivers_Rating',
        ),
        migrations.DeleteModel(
            name='Passanger',
        ),
        migrations.DeleteModel(
            name='Passenger_Rating',
        ),
        migrations.DeleteModel(
            name='Passenger_Report',
        ),
        migrations.DeleteModel(
            name='Ride',
        ),
        migrations.DeleteModel(
            name='Ride_pin',
        ),
        migrations.DeleteModel(
            name='Search_History',
        ),
        migrations.DeleteModel(
            name='Vehicle',
        ),
    ]