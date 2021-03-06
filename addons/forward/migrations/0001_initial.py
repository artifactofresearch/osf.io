# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-03-23 20:34
from __future__ import unicode_literals

import dirtyfields.dirtyfields
from django.db import migrations, models
import osf.models.base
import osf.models.validators


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='NodeSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('_id', models.CharField(db_index=True, default=osf.models.base.generate_object_id, max_length=24, unique=True)),
                ('deleted', models.BooleanField(default=False)),
                ('url', models.URLField(blank=True, max_length=255, null=True)),
                ('label', models.TextField(blank=True, null=True, validators=[osf.models.validators.validate_no_html])),
            ],
            options={
                'abstract': False,
            },
            bases=(dirtyfields.dirtyfields.DirtyFieldsMixin, models.Model),
        ),
    ]
