from django.http import HttpResponse
from django.shortcuts import render, redirect
from StudentApp.models import StudentModel
from TeacherApp.models import TeacherModel
from AdminApp.models import AdminModel, CourseModel, ResultModel, QuestionModel
from AdminApp.forms import AdminLoginForm, AdminRegistrationForm, CourseForm, QuestionForm
from StudentApp.forms import StudentRegistrationForm
from django.contrib import messages


# Create your views here.

def index(request):
    return render(request, "../templates/index.html")


def login(request):
    context = {"form":AdminLoginForm}
    if request.method == "POST":
        login_form = AdminLoginForm(request.POST)
        if login_form.is_valid():
            try:
                admin = AdminModel.objects.get(email=login_form.data['email'], password=login_form.data['password'])
                if admin:
                        # Set session with details
                        request.session['user'] = 'admin'
                        request.session['admin_id'] = admin.id
                        request.session['admin_first_name'] = admin.first_name
                        request.session['admin_email'] = admin.email
                        return redirect('admin_home')
            except Exception as ex:
                context["form"] = login_form
        context["error"] = "Invalid email/password. Please provide valid credentials!!"
        return render(request, '../templates/admin/login.html', context)
    return render(request, '../templates/admin/login.html', context)

def logout(request):
    try:
        # Flush session data
        del request.session['user']
        del request.session['admin_id']
        del request.session['admin_first_name']
        del request.session['admin_email']
        request.session.flush()
    except Exception as ex:
        pass
    return redirect('admin_login')

def register(request):
    context = {"form":AdminRegistrationForm}
    if request.method == "POST":
        register_form = AdminRegistrationForm(request.POST)
        if register_form.is_valid():
            #save form data into DB
            AdminModel(first_name=register_form.cleaned_data['first_name'], last_name=register_form.cleaned_data['last_name'], email=register_form.cleaned_data['email'],mobile=register_form.cleaned_data['mobile'], password=register_form.cleaned_data['password']).save()
            messages.success(request, 'Your account has been created successfully!')
            return redirect("admin_login")
        context["error"] = "Please provide valid details!!"
        context["form"] = register_form
        return render(request, '../templates/admin/register.html', context)
    return render(request, '../templates/admin/register.html', context)

def home(request):
    dict = {
        'total_student': StudentModel.objects.all().count(),
        'total_teacher': TeacherModel.objects.all().filter().count(),
        'total_course': CourseModel.objects.all().count(),
        'total_question': QuestionModel.objects.all().count(),
    }
    return render(request, "../templates/admin/home.html",dict)


#########################
def admin_view_student_view(request): #combine this with admin_view_student_marks_view() exam/admin_view_student_marks.html
    students= StudentModel.objects.all()
    return render(request,'../templates/admin/admin-view-student.html',{'students':students})

def admin_view_student_marks_view(request): #combine this with admin_view_student_view() exam/admin_view_student.html
    students= StudentModel.objects.all()
    return render(request,'exam/admin_view_student_marks.html',{'students':students})

def admin_view_marks_view(request,pk):
    courses = CourseModel.objects.all()
    response =  render(request,'../templates/admin/admin-view-marks.html',{'courses':courses})
    response.set_cookie('student_id',str(pk))
    return response

def admin_check_marks_view(request, pk):
    course = CourseModel.objects.get(id=pk)
    student_id = request.COOKIES.get('student_id')
    student = StudentModel.objects.get(id=student_id)
    results = ResultModel.objects.all().filter(exam=course).filter(student=student)
    return render(request, '../templates/admin/admin-check-marks.html', {'results': results})


def update_student_view(request,pk):
    student=StudentModel.objects.get(id=pk)
    studentForm=StudentRegistrationForm(instance=student)  # 'instance' work only for ModelForm and note for others
    if request.method=='POST':
        studentForm=StudentRegistrationForm(request.POST,instance=student)
        if studentForm.is_valid():
            studentForm.save()
            return redirect('admin_view_student')
    mydict = {'studentForm': studentForm}
    return render(request,'../templates/admin/update-student.html',context=mydict)

def delete_student_view(request,pk):
    student=StudentModel.objects.get(id=pk)
    student.delete()
    return redirect("admin_view_student")


##############
def admin_add_course_view(request):
    context={}
    courseForm=CourseForm()
    if request.method=='POST':
        courseForm=CourseForm(request.POST)
        if courseForm.is_valid():
            courseForm.save()
            return redirect('admin_view_course')
        else:
            context['error']="Provide valid information."
    context['courseForm'] = courseForm
    return render(request,'../templates/admin/admin-add-course.html',context)

def admin_view_course_view(request): #combine this functionality with admin_course_view() and delete_course_view() will trow error after delete this function
    context={}
    courses = CourseModel.objects.all()
    context['courses']=courses
    return render(request,'../templates/admin/admin-view-course.html',context)

def delete_course_view(request,pk):
    course=CourseModel.objects.get(id=pk)
    course.delete()
    return redirect("admin_view_course")

#######
def admin_add_question_view(request):
    context = {}
    questionForm=QuestionForm()
    if request.method=='POST':
        questionForm=QuestionForm(request.POST)
        if questionForm.is_valid():
            question=questionForm.save(commit=False)
            course=CourseModel.objects.get(id=request.POST.get('courseID'))
            question.course=course
            question.save()
            return redirect('admin_add_question')
        else:
            context["error"]="Provide valid information"
    context['questionForm']=questionForm
    return render(request,'../templates/admin/admin-add-question.html',context)

def view_question_view(request,pk):
    questions=QuestionModel.objects.all().filter(course_id=pk)
    return render(request,'../templates/admin/view-question.html',{'questions':questions})

def delete_question_view(request,pk):
    question=QuestionModel.objects.get(id=pk)
    question.delete()
    return redirect('admin_view_course')

