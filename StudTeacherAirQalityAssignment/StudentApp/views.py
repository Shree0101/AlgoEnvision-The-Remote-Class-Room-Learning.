from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect
from AdminApp.models import DiscussionModel, CourseModel, QuestionModel,ResultModel
from StudentApp.models import StudentModel, HomeworkModel
from TeacherApp.models import AssignmentModel, TeacherModel
from StudentApp.forms import StudentLoginForm, StudentRegistrationForm
from django.contrib import messages
import os, mimetypes, csv
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from .WeatherPrediction import *
from StudTeacherAirQalityAssignment.settings import STATICFILES_DIRS


# Create your views here.
def login(request):
    context = {"form":StudentLoginForm}
    if request.method == "POST":
        login_form = StudentLoginForm(request.POST)
        if login_form.is_valid():
            try:
                student = StudentModel.objects.get(email=login_form.data['email'], password=login_form.data['password'])
                if student:
                        # Set session with details
                        request.session['user'] = 'student'
                        request.session['student_id'] = student.id
                        request.session['student_first_name'] = student.first_name
                        request.session['student_email'] = student.email
                        return redirect('student_home')
            except Exception as ex:
                context["form"] = login_form
        context["error"] = "Invalid email/password. Please provide valid credentials!!"
        return render(request, '../templates/student/login.html', context)
    return render(request, '../templates/student/login.html', context)

def logout(request):
    try:
        # Flush session data
        del request.session['user']
        del request.session['student_id']
        del request.session['student_first_name']
        del request.session['student_email']
        request.session.flush()
    except Exception as ex:
        pass
    return redirect('student_login')

def register(request):
    context = {"form":StudentRegistrationForm}
    if request.method == "POST":
        register_form = StudentRegistrationForm(request.POST)
        if register_form.is_valid():
            #save form data into DB
            StudentModel(first_name=register_form.cleaned_data['first_name'], last_name=register_form.cleaned_data['last_name'], email=register_form.cleaned_data['email'],mobile=register_form.cleaned_data['mobile'], password=register_form.cleaned_data['password']).save()
            messages.success(request, 'Your account has been created successfully!')
            return redirect("student_login")
        context["error"] = "Please provide valid details!!"
        context["form"] = register_form
        return render(request, '../templates/student/register.html', context)
    return render(request, '../templates/student/register.html', context)

def home(request):
    return render(request, "../templates/student/home.html")

def view_assignment(request):
    context={}
    if request.method=="POST":
        assignment_list = AssignmentModel.objects.filter(subject=request.POST['subject'], teacher_name=request.POST['teacher'])
        context["assignment_list"]=assignment_list
    subject_qs=AssignmentModel.objects.values('subject').distinct()
    teacher_qs=AssignmentModel.objects.values('teacher_name').distinct()
    subject_list , teacher_list = [] , list()
    for item in subject_qs:
        subject_list.append(item['subject'])
    for single in teacher_qs:
        teacher_list.append(single['teacher_name'])
    context["subject_list"] = subject_list
    context["teacher_list"] = teacher_list
    return render(request, "../templates/student/view-assignment.html", context)

def download_assignment(request, id):
    assignment_qs=AssignmentModel.objects.get(id=id)
    url=assignment_qs.document
    split_list=str(url).split('/')
    filename=split_list[2]
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    filepath=os.path.join(BASE_DIR,'media',filename)
    path = open(filepath, 'rb') # it should be 'rb' because HttpResponse take binary data
    #mimetypes is use to find type of document
    mime_type, _ = mimetypes.guess_type(filepath)
    response = HttpResponse(path, content_type=mime_type)
    response['Content-Disposition'] = "attachment; filename=%s" % filename
    return response

def upload_homework(request):
    context = {}
    subject_qs=TeacherModel.objects.values('subject').distinct()
    teacher_qs=TeacherModel.objects.values('email').distinct()
    subject_list , teacher_list = [] , list()
    for item in subject_qs:
        subject_list.append(item['subject'])
    for single in teacher_qs:
        teacher_list.append(single['email'])
    context["subject_list"] = subject_list
    context["teacher_list"] = teacher_list
    if request.method == 'POST':
        if request.FILES['assignment'].name.endswith('.doc') or request.FILES['assignment'].name.endswith('.docx') \
                or request.FILES['assignment'].name.endswith('.DOC') or request.FILES['assignment'].name.endswith('.DOCX')\
                or request.FILES['assignment'].name.endswith('.rtf') or request.FILES['assignment'].name.endswith('.RTF'):  # validate pdf file extension
            teacher_email = request.POST['teacher']
            student_id = request.POST['student_id']
            description = request.POST['description']
            subject = request.POST['subject']
            myfile = request.FILES['assignment']
            split_tup = os.path.splitext(myfile.name)
            file_extension = split_tup[1]
            student = StudentModel.objects.get(id=student_id)
            teacher = TeacherModel.objects.get(email=teacher_email)
            if subject==teacher.subject:
                fname = subject + "_" + request.session['student_first_name'] + "_" + datetime.now().strftime("%d%m%Y_%H%M%S") + file_extension
                fs = FileSystemStorage()
                # filename = fs.save(myfile.name, myfile)
                filename = fs.save(fname, myfile)
                uploaded_file_url = fs.url(filename)
                HomeworkModel(teacher_id=teacher,student_id=student,teacher_email=teacher_email,subject=subject,description=description,document=uploaded_file_url).save()
            else:
                context["error"]="{0}({1}) is not {2} subject faculty. Please select valid subject and teacher".format(teacher.name,teacher.email,subject)
                context["description"] = request.POST['description']

            return redirect("student_home")
        else:
            context["description"] = request.POST['description']
            context["error"] = "Only WORD file is allowed."
    return render(request, "../templates/student/upload-homework.html", context)

def discussions(request):
    context={}
    discussion_qs=DiscussionModel.objects.all()
    mylist=list()
    for item in discussion_qs:
        mydict = dict()
        mydict['user'] = item.user_type
        mydict['user_id'] = item.user_id
        mydict['user_name'] = item.user_name
        mydict['message'] = item.message
        mydict['date'] = item.date
        mydict['time'] = item.time
        mylist.append(mydict)
    context["chats"] = mylist
    if request.method=="POST":
        uname, uid = "", ""
        if request.session['user']=='student':
            uname=request.session['student_first_name']
            uid=request.session['student_id']
        elif request.session['user']=='teacher':
            uname=request.session['teacher_first_name']
            uid=request.session['teacher_id']
        else:
            uname = request.session['admin_first_name']
            uid = request.session['admin_id']
        DiscussionModel(user_name=uname,user_type=request.session['user'],user_id=uid,message=request.POST['txtmsg']).save()
        return redirect("discussions")
    return render(request, "../templates/student/discussion.html",context)

def course_info(request):
    return render(request, "student/course-info.html")

def start_exam_view(request,pk):
    course=CourseModel.objects.get(id=pk)
    questions=QuestionModel.objects.all().filter(course=course)
    if request.method=='POST':
        pass
    response= render(request,'../templates/student/start_exam.html',{'course':course,'questions':questions})
    response.set_cookie('course_id',course.id)
    return response

@csrf_exempt
def calculate_marks_view(request):
    if request.COOKIES.get('course_id') is not None:
        course_id = request.COOKIES.get('course_id')
        course = CourseModel.objects.get(id=course_id)
        total_marks = 0
        questions = QuestionModel.objects.all().filter(course=course)
        for i in range(len(questions)):
            selected_ans = request.COOKIES.get(str(i + 1))
            actual_answer = questions[i].answer
            if selected_ans == actual_answer:
                total_marks = total_marks + questions[i].marks
        student = StudentModel.objects.get(id=request.session['student_id'])
        result = ResultModel()
        result.marks = total_marks
        result.exam = course
        result.student = student
        result.save()
        return redirect("course_info")

def air_quality_calculation(request):
    predict_accuracy = ''
    svm_predict = ''
    neigh_predict = ''
    tree = ''
    count=''
    svm_score=''
    neigh_score=''
    aqi_level = ''
    predicted_aqi_level = ''
    if request.POST:
        post_request_allowed = ['PM2.5','PM10','NO','NO2','NOx','NH3','CO','SO2','O3','Benzene','Toluene','AQI']
        prediction_list = []
        for param in post_request_allowed:
            #prediction_list.append(1)#harcode value uncomment below and comment this line
            prediction_list.append(float(request.POST[param]))

        post_aqi_list = ['PM2.5', 'PM10', 'NO2', 'NH3', 'SO2', 'CO', 'O3']
        predict_aqi_input = []
        for param in post_aqi_list:
            predict_aqi_input.append(float(request.POST[param]))

        predict_accuracy , svm_score,neigh_score,svm_predict,neigh_predict = predict_weather(prediction_list)
        predicted_aqi_level = predict_aqi(predict_aqi_input)

        if 0 <= predicted_aqi_level <= 50:
            aqi_level = 'Good'
        elif 51 <= predicted_aqi_level <= 100:
            aqi_level = 'Satisfactory'
        elif 101 <= predicted_aqi_level <= 200:
            aqi_level = 'Moderate'
        elif 201 <= predicted_aqi_level <= 300:
            aqi_level = 'Poor'
        elif 301 <= predicted_aqi_level <= 400:
            aqi_level = 'Very Poor'
        else:
            aqi_level = 'Severe'

        if (svm_predict==0)and (neigh_predict==0):
            bad="BAD"
            filepath=os.path.join(STATICFILES_DIRS[0],'files','tree.csv')
            print(filepath)
            # with open(r'F:\AirQuality\air\air_app\tree.csv', mode='r') as csv_file:
            with open(filepath, mode='r') as csv_file:
                csv_reader = csv.DictReader(csv_file)
                line_count = 0
                name = bad
                for row in csv_reader:
                    if row["result"] == name:
                        tree = row["name"]
                        count=row["count"]
        else:
            good="GOOD"
            filepath = os.path.join(STATICFILES_DIRS[0],'files','tree.csv')
            print(filepath)
            # with open(r'F:\AirQuality\air\air_app\tree.csv', mode='r') as csv_file:
            with open(filepath, mode='r') as csv_file:
                csv_reader = csv.DictReader(csv_file)
                line_count = 0
                name = good
                for row in csv_reader:
                    if row["result"] == name:
                        tree= row["name"]
                        count = row["count"]

    return render(request, '../templates/student/air-quality-prediction.html', {'predict_accuracy': predict_accuracy,'svm_predict':svm_score,'neigh_predict':neigh_score,'tree':tree,'count':count, 'predicted_aqi_level': predicted_aqi_level, 'aqi_level': aqi_level})
