from django.urls import path
from . import views


urlpatterns = [
    path('books/', views.BooksView.as_view()),
    path('books/<int:pk>', views.BookUpdateDelete.as_view()),
]