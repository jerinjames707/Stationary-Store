# Generated by Django 3.2.7 on 2024-01-08 04:37

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='customer_reg',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=150)),
                ('lname', models.CharField(max_length=150)),
                ('district', models.CharField(max_length=150)),
                ('street', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('gender', models.CharField(max_length=150)),
                ('dob', models.CharField(max_length=150)),
                ('email', models.CharField(max_length=150)),
                ('password', models.CharField(max_length=150)),
            ],
        ),
    ]
