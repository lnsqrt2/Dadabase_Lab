#include "sqlite.h"
#include "ui_sqlite.h"
#include <QSqlDatabase>
#include <QDebug>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QSqlField>

Sqlite::Sqlite(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Sqlite)
{
    ui->setupUi(this);
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("../SalarySystem.db");//在上一级创建一个db文件
    if (!db.open()) {
        qDebug() << "Database Error!";
        return;
    }
    //设置模型
    model = new QSqlTableModel(this);
    //指定使用哪个表
    model->setTable("users");

    //把model放在view里
    ui->tableView->setModel(model);

    //显示model里的数据
    model->select();

    //设置model的编辑模式
    //model->setEditStrategy(QSqlTableModel::OnManualSubmit);//手动提交修改
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);//不可更改
}

Sqlite::~Sqlite()
{
    delete ui;
}

bool Sqlite::login(QString username,QString password)//登录
{
    model->setTable("users");
    model->select();
    qDebug()<<username<<password;
    int row = 0;
    qDebug()<<model->rowCount();
    while (row < model->rowCount())
    {
        QSqlRecord record = model->record(row);
        if ((record.value("username") == username)&&(record.value("password") == password))
        {
            model->select();//把操作后的表显示出来，这句可能容易出错
            return true;
        }
        else
            row++;
   }
   return false;			//如果未查询到则返回false
}

QString Sqlite::limits(QString username)
{
    model->setTable("users");
    model->select();
    int row = 0;
    while (row < model->rowCount())
    {

        QSqlRecord record = model->record(row);
        if ((record.value("username") == username))
        {
            QString limit = (record.value("limits")).toString();
            qDebug()<<limit;
            return limit;
        }
        else
            row++;
   }
   return NULL;			//如果未查询到则返回false
}
