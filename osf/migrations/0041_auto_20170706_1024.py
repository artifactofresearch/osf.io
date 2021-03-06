# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-06 15:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('osf', '0040_merge_20170619_0922'),
    ]

    operations = [
        migrations.AddField(
            model_name='subject',
            name='highlighted',
            field=models.BooleanField(db_index=True, default=False),
        ),
        migrations.AlterField(
            model_name='subject',
            name='text',
            field=models.CharField(db_index=True, max_length=256),
        ),
    ]
