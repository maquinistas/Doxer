# Generated by Django 3.2.11 on 2022-03-28 05:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doxer', '0012_auto_20220325_1924'),
    ]

    operations = [
        migrations.AlterField(
            model_name='driver',
            name='image1',
            field=models.ImageField(blank=True, default='Drivers_documents/idproof.png', max_length=255, null=True, upload_to='Drivers_documents/'),
        ),
        migrations.AlterField(
            model_name='driver',
            name='image2',
            field=models.ImageField(blank=True, default='Drivers_documents/idproof.png', max_length=255, null=True, upload_to='Drivers_documents/'),
        ),
    ]