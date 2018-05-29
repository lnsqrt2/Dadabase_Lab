/********************************************************************************
** Form generated from reading UI file 'sqlite.ui'
**
** Created by: Qt User Interface Compiler version 5.5.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_SQLITE_H
#define UI_SQLITE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QTableView>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Sqlite
{
public:
    QTableView *tableView;

    void setupUi(QWidget *Sqlite)
    {
        if (Sqlite->objectName().isEmpty())
            Sqlite->setObjectName(QStringLiteral("Sqlite"));
        Sqlite->resize(400, 300);
        tableView = new QTableView(Sqlite);
        tableView->setObjectName(QStringLiteral("tableView"));
        tableView->setGeometry(QRect(50, 40, 256, 192));

        retranslateUi(Sqlite);

        QMetaObject::connectSlotsByName(Sqlite);
    } // setupUi

    void retranslateUi(QWidget *Sqlite)
    {
        Sqlite->setWindowTitle(QApplication::translate("Sqlite", "Form", 0));
    } // retranslateUi

};

namespace Ui {
    class Sqlite: public Ui_Sqlite {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SQLITE_H
