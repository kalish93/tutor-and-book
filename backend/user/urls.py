from django.urls import path
<<<<<<< HEAD

from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView
=======
from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView,TutorSignUpView, TutorsListView
# from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView
>>>>>>> 6ff29168c0195c9d61d89ea148462d7aadd8bc89
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
