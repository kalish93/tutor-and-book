
from django.contrib import admin
from . import models

from .models import *

# Register your models here.
<<<<<<< HEAD
admin.site.register(models.Student)
admin.site.register(models.Tutor)
admin.site.register(models.Book)
admin.site.register(models.ClassRoom)
admin.site.register(models.User)
admin.site.register(models.Course)
=======

models_list = [User, Book, Message, Tutor, Student, Course, ClassRoom] 
admin.site.register(models_list)
>>>>>>> 28b890d4889a56e9ae9963a05e33b9a28f8bcd0c
