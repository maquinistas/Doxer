# Generated by Django 3.2.11 on 2022-03-29 13:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0025_ride_pin_offer_price'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='booking_pin',
            name='driverid',
        ),
        migrations.RemoveField(
            model_name='booking_pin',
            name='getbooking',
        ),
        migrations.RemoveField(
            model_name='booking_pin',
            name='mine_booking',
        ),
        migrations.RemoveField(
            model_name='booking_pin',
            name='offer_car',
        ),
        migrations.RemoveField(
            model_name='trip',
            name='getdr',
        ),
        migrations.RemoveField(
            model_name='trip',
            name='getpas',
        ),
        migrations.RemoveField(
            model_name='trip',
            name='pas',
        ),
        migrations.RemoveField(
            model_name='trip',
            name='vehicle',
        ),
        migrations.RemoveField(
            model_name='ride_pin',
            name='getpassenger',
        ),
        migrations.DeleteModel(
            name='Booking',
        ),
        migrations.DeleteModel(
            name='Booking_pin',
        ),
        migrations.DeleteModel(
            name='Trip',
        ),
    ]
