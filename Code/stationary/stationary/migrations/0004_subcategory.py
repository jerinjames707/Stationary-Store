# Generated by Django 3.2.7 on 2024-01-19 09:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stationary', '0003_category'),
    ]

    operations = [
        migrations.CreateModel(
            name='subcategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subcat_name', models.CharField(max_length=150)),
                ('category_id', models.CharField(max_length=150)),
            ],
        ),
    ]
