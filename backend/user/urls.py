from django.urls import path
<<<<<<< HEAD
from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView,TutorSignUpView, TutorsListView
=======
<<<<<<< HEAD
from . views import StudentOnlyView, StudentSignUpView , LogoutView , TutorOnlyView
=======
from . views import StudentOnlyView , StudentSignUpView , LogoutView , TutorOnlyView
>>>>>>> 536a9a4b9c645d22ea8232a1c14fc60c458c2532
>>>>>>> 0f62887ffd07aa4e2c8019810627b52bc1ae5826
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
