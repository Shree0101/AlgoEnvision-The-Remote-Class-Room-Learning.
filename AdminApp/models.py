from django.db import models
# from StundetApp.models import StudentModel


# Create your models here.
class UserMixins(models.Model):
    id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=33, help_text='First Name', null=False, blank=False)
    last_name = models.CharField(max_length=33, help_text='Last Name', null=False, blank=False)
    email = models.EmailField(max_length = 33, unique=True, null=False, blank=False)
    mobile = models.CharField(unique=True, max_length=11, null=False, blank=False)
    password = models.CharField(max_length=33, null=False, blank=False)

    class Meta:
        abstract = True  # Allow inheritance for models(model mixins)
        index_together = ['id', ["email", "password"]]

class AdminModel(UserMixins):
    class Meta:
        db_table = 'Admin'

class DiscussionModel(models.Model):
    id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=33)
    user_type = models.CharField(max_length=10)
    user_id = models.IntegerField()
    message = models.CharField(max_length=1000)
    date = models.DateField(auto_now=True)
    time = models.TimeField(auto_now=True)

    class Meta:
        db_table = "Discussion"


class CourseModel(models.Model):
   id = models.AutoField(primary_key=True)
   course_name = models.CharField(max_length=50)
   question_number = models.PositiveIntegerField()
   total_marks = models.PositiveIntegerField()
   def __str__(self):
        return self.course_name
   class Meta:
       db_table = "Course"

class QuestionModel(models.Model):
    id = models.AutoField(primary_key=True)
    course=models.ForeignKey("CourseModel",on_delete=models.CASCADE)
    marks=models.PositiveIntegerField()
    question=models.CharField(max_length=600)
    option1=models.CharField(max_length=200)
    option2=models.CharField(max_length=200)
    option3=models.CharField(max_length=200)
    option4=models.CharField(max_length=200)
    cat=(('Option1','Option1'),('Option2','Option2'),('Option3','Option3'),('Option4','Option4'))
    answer=models.CharField(max_length=200,choices=cat)
    class Meta:
        db_table = "Question"

class ResultModel(models.Model):
    id = models.AutoField(primary_key=True)
    student = models.ForeignKey("StudentApp.StudentModel",on_delete=models.CASCADE)
    exam = models.ForeignKey("CourseModel",on_delete=models.CASCADE)
    marks = models.PositiveIntegerField()
    date = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "Result"