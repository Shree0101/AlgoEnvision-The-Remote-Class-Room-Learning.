from AdminApp.forms import LoginFormMixins, RegistrationFormMixins
from django import forms
from TeacherApp.models import AssignmentModel


class TeacherLoginForm(LoginFormMixins):
    pass

class TeacherRegistrationForm(RegistrationFormMixins, ):
    SUBJECT_CHOICE = (
        ('Python', 'Python'),
        ('Java', 'Java'),
        ('Data Science', 'Data Science'),
    )
    subject = forms.ChoiceField(choices=SUBJECT_CHOICE)
