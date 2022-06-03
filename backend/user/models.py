from django.db import models
from django.db.models.signals import post_save
from django.conf import settings
from django.dispatch import receiver
from django.contrib.auth.models import AbstractUser
# from rest_framework.authtoken.models import Token
# from rest_framework import permissions


class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_tutor = models.BooleanField(default=False)
    
    def __str__(self):
        return self.username
    
    




class Tutor(models.Model):
    user = models.OneToOneField(User,related_name='tutor',on_delete=models.CASCADE)
    qulification = models.TextField()
    adress = models.CharField(max_length=255)
    def __str__(self):
        return self.user.username


class Student(models.Model):
    
    user = models.OneToOneField(User,related_name='student',on_delete=models.CASCADE)
    birth_date = models.DateField(null=True,blank=True)
    grade = models.CharField(max_length=50,null=True,blank=True)
    # tutor = models.ManyToManyField(Tutor,blank=True)
    def __str__(self):
        return self.user.username
