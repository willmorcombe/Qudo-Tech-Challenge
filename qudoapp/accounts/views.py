from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import get_authorization_header
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated

from .serializers import UserSerializer
from .models import User

from rest_framework import exceptions

# for registering a user
class RegisterView(APIView):
    permission_classes = [] # anyone can register
    def post(self, request):

        serializer = UserSerializer(data = request.data) # send our data to the user serializer
        serializer.is_valid(raise_exception=True)
        serializer.save()

        data = {
            'message' : 'Registration successful',
            'registration details' : serializer.data
        }

        return Response(data)

# logging in a user
class LoginView(APIView):
    permission_classes = [] # anyone can login
    def post(self, request):

        email = request.data.get('email')
        password = request.data.get('password')

        user = authenticate(email=email, password=password)

        if user is not None:

            Token.objects.create(user=user) # attach token to user

            data = {
                'message' : 'Login successful',
                'token' : user.auth_token.key # return auth token to front end
            }
            return Response(data)
        else:
            return Response(data={'message' : 'Invalid credentials'})

# logging out a user
class LogoutView(APIView):
    permission_classes = [IsAuthenticated] # only if token is provided

    def get(self, request):
        # delete auth token to force login
        request.user.auth_token.delete()
        return Response({'message' : 'Logout successful'})
