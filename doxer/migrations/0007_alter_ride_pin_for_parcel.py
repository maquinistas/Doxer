# Generated by Django 3.2.11 on 2022-03-24 10:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0006_ride_max_parcel'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ride_pin',
            name='for_parcel',
            field=models.BigIntegerField(blank=True, null=True),
        ),
    ]