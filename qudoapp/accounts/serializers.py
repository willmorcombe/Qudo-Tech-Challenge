from rest_framework.serializers import ModelSerializer

from .models import User

class UserSerializer(ModelSerializer):
    class Meta:
        model = User # define user model
        # define all fields that need to be returned in response
        fields = ['id', 'email', 'password']

        # only when we create a user we use the password field
        extra_kwargs = {
            'password' : {'write_only': True}
        }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password) # use to hash password so not stored as text
        instance.save()
        return instance
