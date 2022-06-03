
from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    class Types(models.TextChoices):
        TUTOR = "TUTOR" , "Tutor"
        STUDENT = "STUDENT","Student"

    base_type = Types.STUDENT


    type = models.CharField(("Type"),max_length=50,choices=Types.choices,default=base_type)


    def save(self, *args, **kwargs):
        if not self.pk:
            self.type = self.base_type
        return super().save(**args,**kwargs)

class StudentManger(models.Manager):
    def get_queryset(self, *args, **kwargs):
        return super().get_queryset(*args, **kwargs).filter(type=User.Types.STUDENT)

class TutorManger(models.Manager):
    def get_queryset(self, *args, **kwargs):
        return super().get_queryset(*args, **kwargs).filter(type=User.Types.TUTOR)

class StudentMore(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    birth_date = models.DateField(null=True,blank=True)
    grade = models.CharField(max_length=50,null=True,blank=True)



class TutorMore(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    qulification = models.TextField()
    adress = models.CharField(max_length=300)



class Tutor(models.Model):
<<<<<<< HEAD
    base_type = User.Types.TUTOR
    objects = TutorManger()

    @property
    def more(self):
        return self.tutormore

    class Meta:
        proxy = True
=======
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField( max_length=254,unique=True)
    phone_number = models.CharField(max_length=100)
>>>>>>> 28b890d4889a56e9ae9963a05e33b9a28f8bcd0c



class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    total_pages = models.IntegerField()
    publication_year = models.DateField()
    edition = models.CharField(max_length=20)
    description = models.TextField()
<<<<<<< HEAD
    # book = models.FileField(upload_to='documents/')
=======
    book = models.FileField(upload_to='documents/',null=True,blank=True)
>>>>>>> 28b890d4889a56e9ae9963a05e33b9a28f8bcd0c
    

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
    # image = models.ImageField(null=True)
    # book = models.FileField(null=True,upload_to='documents/')






    


