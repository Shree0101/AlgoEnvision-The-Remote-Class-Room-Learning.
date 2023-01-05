# Generated by Django 3.2.13 on 2022-04-29 03:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('StudentApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AdminModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(help_text='First Name', max_length=33)),
                ('last_name', models.CharField(help_text='Last Name', max_length=33)),
                ('email', models.EmailField(max_length=33, unique=True)),
                ('mobile', models.CharField(max_length=11, unique=True)),
                ('password', models.CharField(max_length=33)),
            ],
            options={
                'db_table': 'Admin',
            },
        ),
        migrations.CreateModel(
            name='CourseModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('course_name', models.CharField(max_length=50)),
                ('question_number', models.PositiveIntegerField()),
                ('total_marks', models.PositiveIntegerField()),
            ],
            options={
                'db_table': 'Course',
            },
        ),
        migrations.CreateModel(
            name='DiscussionModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('user_name', models.CharField(max_length=33)),
                ('user_type', models.CharField(max_length=10)),
                ('user_id', models.IntegerField()),
                ('message', models.CharField(max_length=1000)),
                ('date', models.DateField(auto_now=True)),
                ('time', models.TimeField(auto_now=True)),
            ],
            options={
                'db_table': 'Discussion',
            },
        ),
        migrations.CreateModel(
            name='ResultModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('marks', models.PositiveIntegerField()),
                ('date', models.DateTimeField(auto_now=True)),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminApp.coursemodel')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='StudentApp.studentmodel')),
            ],
            options={
                'db_table': 'Result',
            },
        ),
        migrations.CreateModel(
            name='QuestionModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('marks', models.PositiveIntegerField()),
                ('question', models.CharField(max_length=600)),
                ('option1', models.CharField(max_length=200)),
                ('option2', models.CharField(max_length=200)),
                ('option3', models.CharField(max_length=200)),
                ('option4', models.CharField(max_length=200)),
                ('answer', models.CharField(choices=[('Option1', 'Option1'), ('Option2', 'Option2'), ('Option3', 'Option3'), ('Option4', 'Option4')], max_length=200)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminApp.coursemodel')),
            ],
            options={
                'db_table': 'Question',
            },
        ),
    ]
