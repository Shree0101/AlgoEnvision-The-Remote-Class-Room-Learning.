from django.shortcuts import render, redirect
from StudentApp.models import HomeworkModel, StudentModel
from TeacherApp.models import TeacherModel, AssignmentModel
from TeacherApp.forms import TeacherLoginForm, TeacherRegistrationForm
from django.contrib import messages
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from datetime import datetime
import os, mimetypes

# Create your views here.
def login(request):
    context = {"form":TeacherLoginForm}
    if request.method == "POST":
        login_form = TeacherLoginForm(request.POST)
        if login_form.is_valid():
            try:
                teacher = TeacherModel.objects.get(email=login_form.data['email'], password=login_form.data['password'])
                if teacher:
                        # Set session with details
                        request.session['user'] = 'teacher'
                        request.session['teacher_id'] = teacher.id
                        request.session['teacher_first_name'] = teacher.first_name
                        request.session['teacher_email'] = teacher.email
                        return redirect('teacher_home')
            except Exception as ex:
                context["form"] = login_form
        context["error"] = "Invalid email/password. Please provide valid credentials!!"
        return render(request, '../templates/teacher/login.html', context)
    return render(request, '../templates/teacher/login.html', context)

def logout(request):
    try:
        # Flush session data
        del request.session['user']
        del request.session['teacher_id']
        del request.session['teacher_first_name']
        del request.session['teacher_email']
        request.session.flush()
    except Exception as ex:
        pass
    return redirect('teacher_login')

def register(request):
    context = {"form":TeacherRegistrationForm}
    if request.method == "POST":
        register_form = TeacherRegistrationForm(request.POST)
        if register_form.is_valid():
            #save form data into DB
            TeacherModel(first_name=register_form.cleaned_data['first_name'], last_name=register_form.cleaned_data['last_name'], email=register_form.cleaned_data['email'],mobile=register_form.cleaned_data['mobile'], password=register_form.cleaned_data['password'], subject=register_form.cleaned_data['subject']).save()
            messages.success(request, 'Your account has been created successfully!')
            return redirect("teacher_login")
        context["error"] = "Please provide valid details!!"
        context["form"] = register_form
        return render(request, '../templates/teacher/register.html', context)
    return render(request, '../templates/teacher/register.html', context)

def home(request):
    return render(request, "../templates/teacher/home.html")

def upload_assignment(request):
    context = {}
    if request.method == 'POST':
        if request.FILES['assignment'].name.endswith('.pdf') or request.FILES['assignment'].name.endswith('.PDF'): #validate pdf file extension
            teacher_name=request.POST['teacher_name']
            teacher_id=request.POST['teacher_id']
            description=request.POST['description']
            subject = AssignmentModel.get_teacher_subject(teacher_id)
            fname= subject+"_"+teacher_name+"_"+datetime.now().strftime("%d%m%Y_%H%M%S")+".pdf"
            myfile = request.FILES['assignment']
            fs = FileSystemStorage()
            # filename = fs.save(myfile.name, myfile)
            filename = fs.save(fname, myfile)
            uploaded_file_url = fs.url(filename)
            AssignmentModel(teacher_id=TeacherModel.objects.get(id=teacher_id), teacher_name=teacher_name, description=description, subject=subject, document=uploaded_file_url).save()
            return redirect("teacher_home")
        else:
            context["description"] = request.POST['description']
            context["error"] = "Only PDF file is allowed."
    return render(request, "../templates/teacher/upload-assignment.html",context)

def view_homework(request):
    homework_qs = HomeworkModel.objects.filter(teacher_id=request.session['teacher_id'])
    mylist = list()
    context = dict()
    for data in homework_qs:
        dict1 = {}
        dict1["stud_name"] = data.student_id.first_name + " " + data.student_id.last_name
        dict1["stud_email"] = data.student_id.email
        dict1["description"] = data.description
        dict1["uploaded_at"] = data.uploaded_at
        dict1["id"] = data.id
        dict1["remark"] = data.remark
        mylist.append(dict1)
    context['homework_list'] = mylist
    return render(request, "../templates/teacher/view-homework.html",context)

def download_homework(request,id):
    print(id)
    homework_qs = HomeworkModel.objects.get(id=id)
    url = homework_qs.document
    print(url)
    split_list = str(url).split('/')
    filename = split_list[2]
    print(filename)
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    filepath = os.path.join(BASE_DIR, 'media', filename)
    path = open(filepath, 'rb')  # it should be 'rb' because HttpResponse take binary data
    # mimetypes is use to find type of document
    mime_type, _ = mimetypes.guess_type(filepath)
    response = HttpResponse(path, content_type=mime_type)
    response['Content-Disposition'] = "attachment; filename=%s" % filename
    return response

def update_remark(request):
    if request.method == "POST":
        remark=request.POST["remark"]
        homework_id=request.POST["homework_id"]
        homework_qs=HomeworkModel.objects.get(id=homework_id)
        homework_qs.remark = remark
        homework_qs.save()
    return redirect("teacher_view_homework")

