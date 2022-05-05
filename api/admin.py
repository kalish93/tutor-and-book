
from django.contrib import admin
from . import models

# Register your models here.
admin.site.register(models.Student)
admin.site.register(models.Tutor)
admin.site.register(models.Book)
admin.site.register(models.ClassRoom)
admin.site.register(models.User)
admin.site.register(models.Course)