# Generated by Django 3.2.11 on 2022-03-24 09:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0005_ride_traveling_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='ride',
            name='Max_parcel',
            field=models.BigIntegerField(blank=True, default=1),
        ),
    ]