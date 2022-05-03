from django.contrib import admin

from .models import *

# Register your models here.

models_list = [User, Book, Message, Tutor, Student, Course, ClassRoom] 
admin.site.register(models_list)