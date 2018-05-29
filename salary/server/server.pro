#-------------------------------------------------
#
# Project created by QtCreator 2018-05-29T08:53:52
#
#-------------------------------------------------

QT       += core gui  network sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = server
TEMPLATE = app


SOURCES += main.cpp\
        serverwidget.cpp \
    sqlite.cpp

HEADERS  += serverwidget.h \
    sqlite.h

FORMS    += serverwidget.ui \
    sqlite.ui

CONFIG  += C++11
