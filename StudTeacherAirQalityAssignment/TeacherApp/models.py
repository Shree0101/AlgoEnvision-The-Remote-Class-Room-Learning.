from django.db import models
from AdminApp.models import UserMixins
from django.core.exceptions import ValidationError

# Create your models here.

class TeacherModel(UserMixins):
    SUBJECT_CHOICE = (
        ('Python', 'Python'),
        ('Java', 'Java'),
        ('Data Science', 'Data Science'),
    )
    subject = models.CharField(choices=SUBJECT_CHOICE, max_length=15)

    class Meta:
        db_table="Teacher"


class AssignmentModel(models.Model):
    id = models.AutoField(primary_key=True)
    teacher_id = models.ForeignKey("TeacherModel", on_delete=models.CASCADE)
    teacher_name = models.CharField(max_length=33)
    subject = models.CharField(max_length=15)
    description = models.CharField(max_length=55)
    document = models.FileField()
    # document = models.FileField(upload_to='documents/', validators=[validate_pdf_file_extension]) #check upload_to
    uploaded_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table= "Assignments"

    @staticmethod
    def get_teacher_subject(tid):
        return TeacherModel.objects.filter(id=tid).values("subject")[0]['subject']