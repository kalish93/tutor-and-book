
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, permissions
from .models import ClassRoom, PostMaterial , Questions
from .serializers import ClassRoomSerializer, PostMaterialSerializer,QuestionSerializer
from . import permissions

class ManageClassRoomView(APIView):
    def get(self, request,pk, format=None):
        try:
            user = request.user

            if not user.is_tutor:
                return Response(
                    {'error':'user does not have necessary permissions for getting this classroom data'},
                    status=status.HTTP_403_FORBIDDEN
                )

            # slug = request.query_params.get('id')
            if not pk:
                classroom = ClassRoom.objects.order_by('-date_created').filter(
                    tutor = user.email
                )
                classroom = ClassRoomSerializer(classroom,many=True)
                return Response(
                    {'classrooms': classroom.data},
                    status=status.HTTP_200_OK
                )
            if ClassRoom.objects.filter(
                tutor = user.email,
                # slug=slug
                id=id
            ).exists():
                return Response(
                    {'error':'class rooms not found'},
                    status=status.HTTP_404_NOT_FOUND
                )
            classroom=ClassRoom.objects.get(tutor=user.email,id=pk)#slug=slug)
            classroom = ClassRoomSerializer(classroom)
            return Response(
                {'classroom':classroom.data},
                status=status.HTTP_200_OK
            )

        except:
            return Response(
                {'error':'something went wrong when retreiving Classroom'},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


        
        
    def post(self, request,pk):
        try:
            user = request.user

            if not user.is_tutor():
                return Response(
                    {'error': 'User does not have necessary permissions for creating a class room'},
                    status=status.HTTP_403_FORBIDDEN
                )
            
            data = request.data

            title = data[title]
            # slug = data[slug]
            id = data[id]

            if ClassRoom.objects.filter(id=pk).exists():
                return Response(
                    {'error':'Class room with this slug already exists'},
                    status=status.HTTP_400_BAD_REQUEST
                )

            tutor = data[tutor]
            students = data[students]
            # tutor = data[tutor]

            ClassRoom.objects.create(
                tutor = user.email,
                title = title,
                # slug = slug,
                students = students
            )
            return Response(
                {'success':'classroom created successfully'}
            )
        except:
            return Response(
                {'error':'something went wrong when creating Classroom'},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

class ClassRoomDetailView(APIView):
    permission_classes =(permissions.IsClassRoomOwnerOrStudent,)
    def get(self,request,pk,format=None):
        # try:
        #     slug = request.query_params.get('slug')

        #     if not slug:
        #         return Response(
        #             {'error':'must provide slug'},
        #             status=status.HTTP_400_BAD_REQUEST
        #         )

            if not ClassRoom.objects.filter(id=pk).exists():
                return Response(
                {'error':'class room not found'},
                status=status.HTTP_404_NOT_FOUND
            )
            classroom = ClassRoom.objects.get(id=pk)
            classroom = ClassRoomSerializer(classroom)
            return Response(
                {'classroom':classroom.data},
                status=status.HTTP_200_OK)

        # except:
        #     return Response(
        #         {'error':'something went wrong when creating Classroom'},
        #         status=status.HTTP_500_INTERNAL_SERVER_ERROR
        #     )

class ClassRoomView(APIView):
    permission_classes = (permissions.IsClassRoomOwnerOrStudent, )
    def get(self, request, format=None):
        try:
            classrooms = ClassRoom.objects.order_by('-date_created').filter()
            classrooms = ClassRoomSerializer(classrooms, many=True)
            return Response(
                {'classroom':classrooms.data},
                status=status.HTTP_200_OK)

        except:
            return Response(
               {'error': 'something went wrong when retrieving class rooms'},
               status=status.HTTP_500_INTERNAL_SERVER_ERROR 
            )

class PostView(APIView):
    permission_classes = [permissions.IsPostOwnerOrStudent]
    def get(self,request,pk):
        post = PostMaterial.objects.filter(id=pk)   
        serializer =PostMaterialSerializer(post , many = True)
        return Response(serializer.data)
    # permission_classes = (permissions.AllowAny, )
    def post(self,request):
        serializer = PostMaterialSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class PostUpdateDelete(APIView):
    permission_classes=[permissions.IsPostOwnerOrStudent]
    # permission_classes = (permissions.AllowAny, )
   
    def get_post(request,pk):
        try:
            return PostMaterial.objects.get(id=pk)
        except PostMaterial.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    # permission_classes = (permissions.AllowAny, )
    def get(self,request,pk):    
        post = PostMaterial.objects.get(id=pk)
        serializer =PostMaterialSerializer(post,many = False)
        return Response(serializer.data)
    # permission_classes = (permissions.AllowAny, )
    def put(self,request,pk):
        post = PostMaterial.objects.get(id=pk)
        serializer = PostMaterial(post, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def delete(self,request,pk):
        post = PostMaterial.objects.get(id=pk)
        post.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class QuestionView(APIView):
    permission_classes = [permissions.IsQuestionOwner]
    def get(self,request):
        questions = Questions.objects.all()    
        serializer =QuestionSerializer(questions , many = True)
        return Response(serializer.data)

    def post(self,request):
        serializer = QuestionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class QuestionUpdateDelete(APIView):
    permission_classes = (permissions.IsQuestionOwner,)
   
    def get_question(request,pk):
        try:
            return PostMaterial.objects.get(id=pk)
        except Questions.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    # permission_classes = (permissions.AllowAny, )
    def get(self,request,pk):    
        question = Questions.objects.get(id=pk)
        serializer =QuestionSerializer(question,many = False)
        return Response(serializer.data)
    # permission_classes = (permissions.AllowAny, )
    def put(self,request,pk):
        question = Questions.objects.get(id=pk)
        serializer = QuestionSerializer(question, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # permission_classes = (permissions.AllowAny, )
    def delete(self,request,pk):
        question = Questions.objects.get(id=pk)
        question.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

