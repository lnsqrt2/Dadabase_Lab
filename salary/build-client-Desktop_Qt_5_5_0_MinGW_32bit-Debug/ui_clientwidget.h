/********************************************************************************
** Form generated from reading UI file 'clientwidget.ui'
**
** Created by: Qt User Interface Compiler version 5.5.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CLIENTWIDGET_H
#define UI_CLIENTWIDGET_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_ClientWidget
{
public:
    QWidget *Settings;
    QGridLayout *gridLayout;
    QLabel *label;
    QLineEdit *lineEditIP;
    QLabel *label_2;
    QLineEdit *lineEditPort;
    QPushButton *buttonSave;
    QWidget *Login;
    QLineEdit *lineEditID;
    QLineEdit *lineEditPassword;
    QPushButton *buttonLogin;
    QPushButton *buttonSettings;
    QLabel *label_3;

    void setupUi(QWidget *ClientWidget)
    {
        if (ClientWidget->objectName().isEmpty())
            ClientWidget->setObjectName(QStringLiteral("ClientWidget"));
        ClientWidget->resize(480, 360);
        Settings = new QWidget(ClientWidget);
        Settings->setObjectName(QStringLiteral("Settings"));
        Settings->setGeometry(QRect(130, 0, 221, 131));
        gridLayout = new QGridLayout(Settings);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        label = new QLabel(Settings);
        label->setObjectName(QStringLiteral("label"));
        QFont font;
        font.setFamily(QString::fromUtf8("\345\276\256\350\275\257\351\233\205\351\273\221 Light"));
        label->setFont(font);

        gridLayout->addWidget(label, 0, 0, 1, 1);

        lineEditIP = new QLineEdit(Settings);
        lineEditIP->setObjectName(QStringLiteral("lineEditIP"));
        lineEditIP->setMaximumSize(QSize(34452, 32436));
        lineEditIP->setFont(font);
        lineEditIP->setFrame(false);

        gridLayout->addWidget(lineEditIP, 0, 1, 1, 1);

        label_2 = new QLabel(Settings);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setFont(font);

        gridLayout->addWidget(label_2, 1, 0, 1, 1);

        lineEditPort = new QLineEdit(Settings);
        lineEditPort->setObjectName(QStringLiteral("lineEditPort"));
        lineEditPort->setMaximumSize(QSize(234626, 23435));
        lineEditPort->setFont(font);
        lineEditPort->setFrame(false);
        lineEditPort->setEchoMode(QLineEdit::Normal);

        gridLayout->addWidget(lineEditPort, 1, 1, 1, 1);

        buttonSave = new QPushButton(Settings);
        buttonSave->setObjectName(QStringLiteral("buttonSave"));
        buttonSave->setMinimumSize(QSize(0, 0));
        buttonSave->setMaximumSize(QSize(2435467, 765423));
        buttonSave->setFont(font);

        gridLayout->addWidget(buttonSave, 2, 1, 1, 1);

        label->raise();
        label_2->raise();
        buttonSave->raise();
        lineEditPort->raise();
        lineEditIP->raise();
        Login = new QWidget(ClientWidget);
        Login->setObjectName(QStringLiteral("Login"));
        Login->setGeometry(QRect(40, 200, 431, 141));
        lineEditID = new QLineEdit(Login);
        lineEditID->setObjectName(QStringLiteral("lineEditID"));
        lineEditID->setGeometry(QRect(120, 12, 191, 31));
        lineEditID->setMaximumSize(QSize(34452, 32436));
        lineEditID->setFont(font);
        lineEditID->setFrame(false);
        lineEditPassword = new QLineEdit(Login);
        lineEditPassword->setObjectName(QStringLiteral("lineEditPassword"));
        lineEditPassword->setGeometry(QRect(120, 50, 191, 31));
        lineEditPassword->setMaximumSize(QSize(234626, 23435));
        lineEditPassword->setFont(font);
        lineEditPassword->setFrame(false);
        lineEditPassword->setEchoMode(QLineEdit::Password);
        buttonLogin = new QPushButton(Login);
        buttonLogin->setObjectName(QStringLiteral("buttonLogin"));
        buttonLogin->setGeometry(QRect(120, 90, 191, 31));
        buttonLogin->setMinimumSize(QSize(0, 0));
        buttonLogin->setMaximumSize(QSize(2435467, 765423));
        buttonLogin->setFont(font);
        buttonSettings = new QPushButton(Login);
        buttonSettings->setObjectName(QStringLiteral("buttonSettings"));
        buttonSettings->setGeometry(QRect(320, 90, 101, 31));
        buttonSettings->setMaximumSize(QSize(3456784, 16777215));
        QFont font1;
        font1.setFamily(QString::fromUtf8("\345\276\256\350\275\257\351\233\205\351\273\221 Light"));
        font1.setBold(false);
        font1.setItalic(false);
        font1.setWeight(50);
        buttonSettings->setFont(font1);
        buttonSettings->setFlat(true);
        label_3 = new QLabel(Login);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(20, 10, 81, 81));
        label_3->setPixmap(QPixmap(QString::fromUtf8("F:/Archive/004 NET/SOCKET/ILLW_SOURCE/head.png")));
        label_3->setScaledContents(true);

        retranslateUi(ClientWidget);

        QMetaObject::connectSlotsByName(ClientWidget);
    } // setupUi

    void retranslateUi(QWidget *ClientWidget)
    {
        ClientWidget->setWindowTitle(QApplication::translate("ClientWidget", "ClientWidget", 0));
        label->setText(QApplication::translate("ClientWidget", "IP", 0));
        lineEditIP->setText(QApplication::translate("ClientWidget", "127.0.0.1", 0));
        label_2->setText(QApplication::translate("ClientWidget", "\347\253\257\345\217\243", 0));
        lineEditPort->setText(QApplication::translate("ClientWidget", "8888", 0));
        buttonSave->setText(QApplication::translate("ClientWidget", "\344\277\235\345\255\230\350\256\276\347\275\256", 0));
        buttonLogin->setText(QApplication::translate("ClientWidget", "\347\231\273\345\275\225", 0));
        buttonSettings->setText(QApplication::translate("ClientWidget", "\346\234\215\345\212\241\345\231\250\351\200\211\351\241\271", 0));
        label_3->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class ClientWidget: public Ui_ClientWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CLIENTWIDGET_H
