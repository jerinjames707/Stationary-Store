# Generated by Django 3.2.7 on 2024-02-09 11:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stationary', '0019_tbl_cassign_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='tbl_delivery',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cassign_id', models.CharField(max_length=150)),
                ('del_date', models.CharField(max_length=150)),
                ('cart_master_id', models.CharField(max_length=150)),
            ],
        ),
    ]
