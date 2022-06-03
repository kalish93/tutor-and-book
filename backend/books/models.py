from django.db import models
from django.contrib.auth import get_user_model
# User = get_user_model()
# Create your models her
from user.models import User
class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    total_pages = models.IntegerField()
    publication_year = models.DateField(blank=True,null=True)
    edition = models.CharField(max_length=20,null=True,blank=True)
    description = models.TextField()
    # book = models.FileField(upload_to='documents/',null=True,blank=True)
    picture = models.ImageField(upload_to='pictures/',null=True,blank=True)
    download_link = models.URLField(blank=True,null=True)
    posted_by = models.ForeignKey(User,on_delete=models.CASCADE)