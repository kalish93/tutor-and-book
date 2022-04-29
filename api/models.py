
from distutils.command.upload import upload
import email
from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import date

class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_tutor = models.BooleanField(default=False)


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    username = models.CharField(max_length=100)
    birth_date = models.DateField(null=True)
    email = models.EmailField( max_length=254)


class Tutor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField( max_length=254)



class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    total_pages = models.IntegerField()
    publication_year = models.DateField()
    edition = models.CharField(max_length=20)
    description = models.TextField()
    book = models.FileField(upload_to='documents/')
    

class Course(models.Model):
    title = models.CharField(max_length=100)
    provider = models.ManyToManyField(Tutor)
    students = models.ManyToManyField(Student)
    

class ClassRoom(models.Model):
    tutor = models.ForeignKey(Tutor,on_delete=models.CASCADE)
    course_title = models.ForeignKey(Course,on_delete=models.CASCADE)
    date_created = models.DateTimeField(auto_now_add=True)
    students = models.ManyToManyField(Student)

class Message(models.Model):

    text = models.TextField(null=True)
    image = models.ImageField(null=True)
    book = models.FileField(null=True,upload_to='documents/')






    


