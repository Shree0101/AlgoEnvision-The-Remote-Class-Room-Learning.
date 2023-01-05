from django.urls import path
from TeacherApp import views

urlpatterns = [
    path('login/', views.login, name="teacher_login"),
    path('register/',views.register, name='teacher_register'),
    path("logout/", views.logout, name='teacher_logout'),
    path("home/", views.home, name="teacher_home"),
    path("upload-assignment/", views.upload_assignment, name="teacher_upload_assignment"),
    path("view-homework/", views.view_homework, name="teacher_view_homework"),
    path("download-homework/<int:id>", views.download_homework, name="teacher_download_homework"),
    path("update-remark/", views.update_remark, name="teacher_update_remark"),
]