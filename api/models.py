from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import date
# Create your models here.

class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_tutor = models.BooleanField(default=False)


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    username = models.CharField(max_length=100)
    birth_date = models.DateField()
    @property
    def getAge(birth_date):
        return 

    


class Tutor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)




class Book(models.Model):
    title = models.CharField(max_length=100)


    


