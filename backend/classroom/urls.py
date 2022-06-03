from django.urls import path
from .views import ManageClassRoomView, ClassRoomDetailView,ClassRoomView

urlpatterns = [
    path('class/<int:pk>/',ClassRoomDetailView.as_view()),
    path('getclasses/',ClassRoomView.as_view())
]