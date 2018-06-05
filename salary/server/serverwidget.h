#ifndef SERVERWIDGET_H
#define SERVERWIDGET_H

#include <QWidget>
#include <QTcpServer>
#include <QTcpSocket>
#include "sqlite.h"

namespace Ui {
class ServerWidget;
}

class ServerWidget : public QWidget
{
    Q_OBJECT

public:
    bool checkLogin(QString username,QString password);
    QString checkLimits(QString username);
    explicit ServerWidget(QWidget *parent = 0);
    ~ServerWidget();

private slots:
    void newConnect();
    void readMessage();
    void sendMessage(QString infomation);
    void on_ButtonData_clicked();


private:
    Sqlite myDb;//数据库
    QTcpServer *tcpServer;//监听套接字
    QTcpSocket *tcpSocket;//通信套接字
    QList<QTcpSocket*> *socket_list;
    QString message;
    Ui::ServerWidget *ui;
};

#endif // SERVERWIDGET_H
