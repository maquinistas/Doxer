# Generated by Django 3.2.11 on 2022-03-30 06:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0028_auto_20220330_1049'),
    ]

    operations = [
        migrations.AddField(
            model_name='ride_pin',
            name='as_user',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
