from django.urls import path
from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView,TutorSignUpView, TutorsListView
from rest_framework_simplejwt.views import TokenObtainPairView , TokenRefreshView ,TokenVerifyView

urlpatterns=[
    path('signup/student/',StudentSignUpView.as_view()),
    path('signup/tutor',TutorSignUpView.as_view()),
    path('logout/',LogoutView.as_view()),
    path('student/dashboard/',StudentOnlyView.as_view()),
    path('tutor/dashboard/',TutorOnlyView.as_view()),
    path('tokens/', TokenObtainPairView.as_view()),
    path('tutor/', TutorsListView.as_view())

   
    ]
