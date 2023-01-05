"""StudTeacherAirQalityAssignment URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from AdminApp import views
from StudentApp import urls as student
from TeacherApp import urls as teacher

urlpatterns = [
    path('admin/', admin.site.urls),
    path('student/', include(student)),
    path('teacher/', include(teacher)),
    path('', views.index, name="index"),
    path('login/',views.login, name='admin_login'),
    path('register/',views.register, name='admin_register'),
    path("logout/", views.logout, name='admin_logout'),
    path("home/", views.home, name="admin_home"),


    path('admin-view-student', views.admin_view_student_view, name='admin_view_student'),
    path('admin-view-student-marks', views.admin_view_student_marks_view,name='admin-view-student-marks'),
    path('admin-view-marks/<int:pk>', views.admin_view_marks_view, name='admin_view_marks'),
    path('admin-check-marks/<int:pk>', views.admin_check_marks_view, name='admin_check_marks'),
    path('update-student/<int:pk>', views.update_student_view, name='update_student'),
    path('delete-student/<int:pk>', views.delete_student_view, name='delete_student'),

    path('admin-add-course', views.admin_add_course_view, name='admin_add_course'),
    path('admin-view-course', views.admin_view_course_view, name='admin_view_course'),
    path('delete-course/<int:pk>', views.delete_course_view, name='delete_course'),

    path('admin-add-question', views.admin_add_question_view, name='admin_add_question'),
    path('view-question/<int:pk>', views.view_question_view, name='view_question'),
    path('delete-question/<int:pk>', views.delete_question_view, name='delete_question'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)