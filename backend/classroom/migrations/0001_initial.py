# Generated by Django 4.0.5 on 2022-06-03 18:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0002_student_is_tutor_tutor_is_tutor'),
    ]

    operations = [
        migrations.CreateModel(
            name='ClassRoom',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('course_name', models.CharField(blank=True, max_length=255, null=True)),
                ('students', models.ManyToManyField(blank=True, to='user.student')),
            ],
        ),
        migrations.CreateModel(
            name='PostMaterial',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField(blank=True, null=True)),
                ('classroom', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classroom.classroom')),
                ('posted_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.tutor')),
            ],
        ),
        migrations.CreateModel(
            name='Questions',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question', models.TextField(blank=True, null=True)),
                ('asked_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.student')),
                ('classroom', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classroom.classroom')),
                ('question_on', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classroom.postmaterial')),
            ],
        ),
    ]
