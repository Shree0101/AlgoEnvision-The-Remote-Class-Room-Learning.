from django.db import models
from AdminApp.models import UserMixins
# from TeacherApp.models import TeacherModel
# Create your models here.

class StudentModel(UserMixins):
    def __str__(self):
        return "{} {}".format(self.id, self.email)

    class Meta:
        db_table="Student"

class HomeworkModel(models.Model):
    id = models.AutoField(primary_key=True)
    teacher_id = models.ForeignKey('TeacherApp.TeacherModel', on_delete=models.CASCADE)
    student_id = models.ForeignKey("StudentModel", on_delete=models.CASCADE)
    teacher_email = models.EmailField(max_length=33)
    subject = models.CharField(max_length=15)
    description = models.CharField(max_length=55)
    document = models.FileField()
    remark = models.CharField(max_length=55, blank=True)
    uploaded_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "Homework"


