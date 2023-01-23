from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.decorators import api_view, renderer_classes
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework.exceptions import APIException
from django.contrib.auth.models import User

from .serializers import UserSerializer
from .models import User



@api_view(['POST'])
def register(request):

    serializer = UserSerializer(data = request.data) # send our data to the serializer
    serializer.is_valid()
    serializer.save()
    # usernames = [user.username for user in User.objects.all()]

    return Response(serializer.data)
    # return render(request, 'order/home.html', {'usernames' : usernames})

@api_view(['POST'])
def login(request):
    user = User.objects.filter(email=request.data['email']).first()

    if not user:
        raise APIException('Invalid email')

    if not user.check_password(request.data['password']):
        raise APIException('Invalid password')

    serializer = UserSerializer(user)
    return Response(serializer.data)
