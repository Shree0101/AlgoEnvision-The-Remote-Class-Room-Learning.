from AdminApp.forms import LoginFormMixins, RegistrationFormMixins
from StudentApp.models import StudentModel
from django import forms

class StudentLoginForm(LoginFormMixins):
    pass

class StudentRegistrationForm(RegistrationFormMixins, forms.ModelForm):
    class Meta:
        model=StudentModel
        fields = ['first_name', 'last_name','email', 'mobile', 'password', 'confirm_password']
