from django.contrib import admin
from .models import User,Student,Tutor

admin.site.register((User,Tutor,Student,))
