from django import forms
from AdminApp.models import CourseModel, QuestionModel
class LoginFormMixins(forms.Form):
    email = forms.CharField(widget=forms.EmailInput)
    password = forms.CharField(widget=forms.PasswordInput)

class ForgotPWFormMixins(forms.Form):
    email = forms.CharField(widget=forms.EmailInput)

class RegistrationFormMixins(forms.Form):
    first_name = forms.CharField(max_length=33, required=True)
    last_name = forms.CharField(max_length=33, required=True)
    email = forms.EmailField(max_length=33)
    mobile = forms.CharField(max_length=10)
    password = forms.CharField(widget=forms.PasswordInput(), max_length=33, min_length=8)
    confirm_password = forms.CharField(widget=forms.PasswordInput(), max_length=33, min_length=8)

    def clean(self):
        cleaned_data = super(RegistrationFormMixins, self).clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")
        mobile = cleaned_data.get("mobile")

        if password != confirm_password:
            raise forms.ValidationError("password and confirm_password does not match")
        if len(mobile) != 10:
            raise forms.ValidationError("mobile length should be 10 digit long")

class AdminLoginForm(LoginFormMixins):
    pass

class AdminRegistrationForm(RegistrationFormMixins):
    pass


class CourseForm(forms.ModelForm):
    class Meta:
        model = CourseModel
        fields = ['course_name', 'question_number', 'total_marks']

    def clean(self):
        cleaned_data = super(CourseForm, self).clean()
        questions=int(cleaned_data.get("question_number"))
        total_marks=int(cleaned_data.get("total_marks"))
        if questions<=0:
            raise forms.ValidationError("Number of questions should be greater than zero")
        if total_marks<=0:
            raise forms.ValidationError("Total marks should be greater than zero")


class QuestionForm(forms.ModelForm):
    # this will show dropdown __str__ method course model is shown on html so override it
    # to_field_name this will fetch corresponding value  user_id present in course model and return it
    courseID = forms.ModelChoiceField(queryset=CourseModel.objects.all(), empty_label="Course Name", to_field_name="id")
    class Meta:
        model = QuestionModel
        fields = ['marks', 'question', 'option1', 'option2', 'option3', 'option4', 'answer']
        widgets = {
            'question': forms.Textarea(attrs={'rows': 3, 'cols': 50})
        }

    def clean(self):
        cleaned_data = super(QuestionForm, self).clean()
        marks=int(cleaned_data.get('marks'))
        if marks<=0:
            raise forms.ValidationError("Marks should be greater than zero")