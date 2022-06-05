from rest_framework.permissions import BasePermission,SAFE_METHODS

class IsTutor(BasePermission):
    def has_permission(self, request, view):

        return bool(request.user and request.user.is_tutor)

class IsStudent(BasePermission):
    def has_permission(self, request, view):
        
        return bool(request.user and request.user.is_student)
    
class TutorPermission(BasePermission):
    message = "Editing or deleting Post is only for the owner! "
    
    def has_object_permission(self, request, view, obj):
        if request.method in SAFE_METHODS:
            return True
        elif  request.user.is_superuser:
            return True
        return False


class UserPermission(BasePermission):
    message = "Editing or deleting Post is only for the owner! "
    
    def has_object_permission(self, request, view, obj):
        if request.method in SAFE_METHODS:
            return True
        elif  request.user.is_superuser:
            return True
        return False
class StudentPermission(BasePermission):
    message = "Editing or deleting Post is only for the owner! "
    
    def has_object_permission(self, request, view, obj):
        if request.method in SAFE_METHODS:
            return True
        elif  request.user.is_superuser:
            return True
        return False



