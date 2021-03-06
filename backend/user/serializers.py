from dataclasses import fields
from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from user.models import *
from . import models

class UserSerializer(ModelSerializer):    
    class Meta:
        model= models.User
        # fields = ['username','email','is_tutor']
        fields = '__all__'

class StudentSerializer(ModelSerializer): 
    
    class Meta:
        model= models.Student
        # fields = ['password','password2','username','email']
        fields = '__all__'

    
class TutorSerializer(ModelSerializer):    
    class Meta:
        model= models.Tutor
        fields =  '__all__'
        # ['password','password2','username','email']
  


           

class StudentSignUpSerializer(serializers.ModelSerializer):
    password2=serializers.CharField(style={"input_type":"password"}, write_only=True)
    class Meta:
        model=models.User
        # fields = '__all__'
        fields = ['password2','username','email','password']
        extra_kwargs={
            'password':{'write_only':True}
        }

    def save(self, **kwargs):
        user=models.User(
            username=self.validated_data['username'],
            email=self.validated_data['email']
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password2 != password:
            raise serializers.ValidationError({"Error":"password do not match"})
        user.set_password(password)
        user.is_student=True
        user.save()
        models.Student.objects.create(user=user)
        return user



class TutorSignUpSerializer(serializers.ModelSerializer):
    password2=serializers.CharField(style={"input_type":"password"}, write_only=True)
    class Meta:
        model=models.User
        fields = ['username','email','password','password2']
        extra_kwargs={
            'password':{'write_only'}
        }
    def save(self, **kwargs):
        user=models.User(
            username=self.validated_data['username'],
            email=self.validated_data['email']
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password2 != password:
            raise serializers.ValidationError({"Error":"password do not match"})
        user.set_password(password)
        user.is_tutor=True
        user.save()
        models.Student.objects.create(user=user)
        return user

