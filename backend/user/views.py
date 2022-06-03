
from rest_framework.decorators import api_view
# from users.permissions import IsStudent, IsTutor, TutorListPermission
from rest_framework.response import Response

from . serializers import *
from .models import *
from .serializers import *
from rest_framework.views import APIView
from rest_framework import generics, status,permissions
# from rest_framework.permissions import IsAdminUser, DjangoModelPermissionsOrAnonReadOnly
# Create your views here.

class StudentSignUpView(generics.GenericAPIView):
    permission_classes =[permissions.AllowAny,]
    serializer_class = StudentSignUpSerializer
    def post(self,request,*args,**kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user=serializer.save()
        return Response({
            "user":UserSerializer(user,context=self.get_serializer_context()).data,
            # "token":Token.objects.get(user=user).key,
            "message":"account created sucessfully"
        })
class TutorSignUpView(generics.GenericAPIView):
    permission_classes=[permissions.AllowAny]
    serializer_class = TutorSignUpSerializer
    def post(self,request,*args,**kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user=serializer.save()
        return Response({
            "user":UserSerializer(user,context=self.get_serializer_context()).data,
            # "token":Token.objects.get(user=user).key,
            "message":"account created sucessfully"
        })
        
    

class LogoutView(APIView):
    def post(self,request,format=None):
        request.auth.delete()
        return Response(status=status.HTTP_200_OK)


class TutorOnlyView(generics.GenericAPIView):
    # permission_classes = [permissions.IsAuthenticated&IsTutor]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user



class StudentOnlyView(generics.GenericAPIView):
    # permission_classes = [permissions.IsAuthenticated&IsStudent]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user




class TutorView(APIView):
    
    # permission_classes = [TutorListPermission]
    def get(self,request):
        tutors = Tutor.objects.all()    
        serializer =TutorSerializer(tutors , many = True)
        return Response(serializer.data)    
    
    def post(self,request):
        
        serializer = TutorSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class TutorUpdateDelete(APIView):
    
    # permission_classes = [TutorListPermission]
    permission_classes = [permissions.AllowAny]
    def get_tutor(request,pk):
        try:
            return Tutor.objects.get(id=pk)
        except Tutor.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        
    def get(self,request,pk):    
        tutor = Tutor.objects.get(id=pk)
        serializer =TutorSerializer(tutor,many = False)
        return Response(serializer.data)
    
    def put(self,request,pk):
        tutor = Tutor.objects.get(pk=pk)
        serializer = TutorSerializer(tutor, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,pk):
        tutor = Tutor.objects.get(id=pk)
        tutor.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class StudentView(APIView):
    
    def get(self,request):
        student = Student.objects.all()    
        serializer =StudentSerializer(student , many = True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer = StudentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class StudentUpdateDelete(APIView):
    
    def get_tutor(request,pk):
        try:
            return Student.objects.get(id=pk)
        except Student.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        
    def get(self,request,pk):    
        student = Student.objects.get(id=pk)
        serializer =StudentSerializer(student,many = False)
        return Response(serializer.data)
    
    def put(self,request,pk):
        student = Student.objects.get(pk=pk)
        serializer = StudentSerializer(student, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,pk):
        student = Student.objects.get(id=pk)
        student.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



class UserView(APIView):
    def get(self,request):
        user = User.objects.all()    
        serializer =UserSerializer(user , many = True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class UserUpdateDelete(APIView):
    
    def get_user(request,pk):
        try:
            return User.objects.get(id=pk)
        except User.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        
    def get(self,request,pk):    
        user = User.objects.get(id=pk)
        serializer =UserSerializer(user,many = False)
        return Response(serializer.data)
    
    def put(self,request,pk):
        user = User.objects.get(pk=pk)
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,pk):
        user = User.objects.get(id=pk)
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class TutorsListView(APIView):
    permission_classes = [permissions.AllowAny,]
    def get(self,request):
        user = User.objects.filter(is_tutor=True)   
        serializer =UserSerializer(user , many = True)
        return Response(serializer.data)
