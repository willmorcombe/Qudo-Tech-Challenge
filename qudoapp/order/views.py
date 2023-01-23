from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.decorators import api_view, renderer_classes
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework.exceptions import APIException
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User

from .serializers import UserSerializer
from .models import User



@api_view(['POST'])
def register(request):

    serializer = UserSerializer(data = request.data) # send our data to the serializer
    data = {}
    if serializer.is_valid():
        user = serializer.save()
        data['email'] = user.email
        token = Token.objects.get(user=user).key
        data['token'] = token

    else:
        data = serializer.errors
    return Response(data)
    # return render(request, 'order/home.html', {'usernames' : usernames})

@api_view(['POST'])
def login(request):
    user = User.objects.filter(email=request.data['email']).first()

    if not user:
        raise APIException('Invalid email')

    if not user.check_password(request.data['password']):
        raise APIException('Invalid password')

    serializer = UserSerializer(user)
    data = {}
    data['id'] = serializer.data['id']
    data['email'] = serializer.data['email']
    data['token'] = Token.objects.get(user=user).key
    return Response(data)




def home(request):
    return render(request, 'order/home.html', {'usernames' : 'test'})
