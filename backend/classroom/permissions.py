
from rest_framework.permissions import BasePermission
from rest_framework import permissions

class IsClassRoomOwnerOrStudent(BasePermission):
    def has_object_permission(self, request, view, obj):
        if (request.method is permissions.SAFE_METHODS) and (request.user in obj.students):
            return True
        return request.user == obj.tutor

class IsPostOwnerOrStudent(BasePermission):
    def has_object_permission(self, request, view, obj):
        if (request.method is permissions.SAFE_METHODS):
            return True
        return request.user == obj.posted_by

class IsQuestionOwner(BasePermission):
    def has_object_permission(self, request, view, obj):
        if (request.method is permissions.SAFE_METHODS):
            return True
        return request.user == obj.asked_by

class IsStudent(BasePermission):
    def has_permission(self, request, view):
        if(request.user.is_tutor == False):
            return True
        return False
class IsTutor(BasePermission):
    def has_permission(self, request, view):
        if(request.user.is_tutor):
            return True
        return False