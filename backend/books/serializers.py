from .models import Book
from rest_framework.serializers import ModelSerializer
from rest_framework import serializers


class BookSerializer(ModelSerializer):
    posted_by= serializers.StringRelatedField()
    class Meta:
        model= Book
        fields = ['id','title','author','total_pages','description','picture','download_link','posted_by']