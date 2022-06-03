from tkinter import CASCADE
from django.conf import settings
from django.db import models
import user.models

class ClassRoom(models.Model):
    tutor = models.ForeignKey(user.models.Tutor, on_delete=models.CASCADE),
    course_name = models.CharField(max_length=255,null=True,blank=True)
    students = models.ManyToManyField(user.models.Student,blank=True)

    def __str__(self) -> str:
        return self.course_name


class PostMaterial(models.Model):
    classroom = models.ForeignKey(ClassRoom,on_delete=models.CASCADE)
    text = models.TextField(null=True,blank=True)
    posted_by = models.ForeignKey(user.models.Tutor,on_delete=models.CASCADE)
    # file = models.FileField(upload_to='files')
    # def __str__(self) -> str:
    #     return self.text

class Questions(models.Model):
    classroom = models.ForeignKey(ClassRoom,on_delete=models.CASCADE)
    question = models.TextField(blank=True,null=True)
    asked_by = models.ForeignKey(user.models.Student,on_delete=models.CASCADE)
    question_on = models.ForeignKey(PostMaterial,on_delete=models.CASCADE)

    # def __str__(self) -> str:
    #     return self.question


