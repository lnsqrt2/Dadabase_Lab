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
//    QSqlQuery query;//新建表
//    query.exec("create table info (uid int,"
//               "password varchar(40), "
//               "Question varchar(40), "
//               "Answer varchar(40), "
//               "status int)");
//    //执行预处理命令
//    query.execBatch();

    //设置模型
    model = new QSqlTableModel(this);
    //指定使用哪个表
    model->setTable("info");

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
