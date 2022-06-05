from rest_framework.permissions import BasePermission
from rest_framework import permissions

class IsBookOwnerorReadOnly(BasePermission):
    def has_object_permission(self, request, view, obj):
        if(request.method is permissions.SAFE_METHODS):
            return True
        return request.user == obj.posted_by
