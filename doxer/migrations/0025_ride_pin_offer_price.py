# Generated by Django 3.2.11 on 2022-03-29 12:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0024_auto_20220329_1654'),
    ]

    operations = [
        migrations.AddField(
            model_name='ride_pin',
            name='offer_price',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]