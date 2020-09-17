from django.contrib import admin
from django.urls import path
from django.shortcuts import render
from django.conf import settings

def django_error(request):
    x = 100
    y = 99
    z = 1 / (x - y)
    return render(request, 'index.html')

def js_error(request):
    context = {'text': 'Hello world!', 'version' : settings.VERSION}
    return render(request, 'index.html', context)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('django-error/', django_error),
    path('js-error/', js_error)
]
