# Generated by Django 3.2.7 on 2024-02-07 16:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stationary', '0014_card'),
    ]

    operations = [
        migrations.CreateModel(
            name='tbl_payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cart_master_id', models.CharField(max_length=150)),
                ('card_id', models.CharField(max_length=150)),
                ('pay_date', models.CharField(max_length=150)),
            ],
        ),
    ]
