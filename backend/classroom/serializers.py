from rest_framework import serializers
from .models import ClassRoom, PostMaterial, Questions

class ClassRoomSerializer(serializers.ModelSerializer):
    tutor = serializers.StringRelatedField()
    students = serializers.StringRelatedField()
    class Meta:
        model = ClassRoom
        fields = '__all__'

class PostMaterialSerializer(serializers.ModelSerializer):

    class Meta:
        model = PostMaterial
        fields = '__all__'
class QuestionSerializer(serializers.ModelSerializer):
    asked_by = serializers.StringRelatedField()
    class Meta:
        model = Questions
        fiels = '__all__'