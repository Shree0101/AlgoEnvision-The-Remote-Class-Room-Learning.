from django.urls import path
from StudentApp import views

urlpatterns = [
    path('login/', views.login, name="student_login"),
    path('register/',views.register, name='student_register'),
    path("logout/", views.logout, name='student_logout'),
    path("home/", views.home, name="student_home"),
    path("view-assignment/", views.view_assignment, name="stud_view_assignment"),
    path("download-assignment/<str:id>", views.download_assignment, name="stud_download_assignment"),
    path("upload-homework/", views.upload_homework, name="stud_upload_homework"),
    path("discussions/", views.discussions, name="discussions"),
    path("course-info/", views.course_info, name="course_info"),
    path("air-quality/", views.air_quality_calculation, name="air_quality"),

    path('start-exam/<int:pk>', views.start_exam_view,name='start_exam'),
    path('calculate-marks', views.calculate_marks_view,name='calculate_marks'),
]