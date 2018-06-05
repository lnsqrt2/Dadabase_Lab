#-------------------------------------------------
#
# Project created by QtCreator 2018-06-05T10:23:40
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = client
TEMPLATE = app


SOURCES += main.cpp\
        clientwidget.cpp

HEADERS  += clientwidget.h

FORMS    += clientwidget.ui

CONFIG  += C++11
