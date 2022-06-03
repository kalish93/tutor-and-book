from rest_framework.views import APIView
from .models import Book
from .serializers import BookSerializer
from rest_framework import permissions, status
from rest_framework.response import Response
from .permissions import IsBookOwnerorReadOnly
# Create your views here.
class BooksView(APIView):
    permission_classes = (permissions.IsAuthenticated or IsBookOwnerorReadOnly,)
    def get(self,request):
        book = Book.objects.all()    
        serializer =BookSerializer(book , many = True)
        return Response(serializer.data)
    # permission_classes = (permissions.AllowAny, )
    def post(self,request):
        serializer = BookSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class BookUpdateDelete(APIView):
    permission_classes = (permissions.IsAuthenticated&IsBookOwnerorReadOnly,)
   
    def get_book(request,pk):
        try:
            return Book.objects.get(id=pk)
        except Book.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    # permission_classes = (permissions.AllowAny, )
    def get(self,request,pk):    
        book = Book.objects.get(id=pk)
        serializer =BookSerializer(book,many = False)
        return Response(serializer.data)
    # permission_classes = (permissions.AllowAny, )
    def put(self,request,pk):
        book = Book.objects.get(id=pk)
        serializer = BookSerializer(book, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    permission_classes = (permissions.AllowAny, )
    def delete(self,request,pk):
        book = Book.objects.get(id=pk)
        book.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
