#ifndef SERVERWIDGET_H
#define SERVERWIDGET_H

#include <QWidget>
#include "sqlite.h"

namespace Ui {
class ServerWidget;
}

class ServerWidget : public QWidget
{
    Q_OBJECT

public:
    explicit ServerWidget(QWidget *parent = 0);
    ~ServerWidget();

private slots:
    void on_ButtonData_clicked();

private:
    Sqlite myDb;//数据库
    Ui::ServerWidget *ui;
};

#endif // SERVERWIDGET_H
