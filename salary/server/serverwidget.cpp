#include "serverwidget.h"
#include "ui_serverwidget.h"

ServerWidget::ServerWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ServerWidget)
{
    ui->setupUi(this);
    setWindowTitle("工资管理系统服务器");
}

ServerWidget::~ServerWidget()
{
    delete ui;
}

void ServerWidget::on_ButtonData_clicked()
{
    myDb.show();
}
