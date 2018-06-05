#ifndef CLIENTWIDGET_H
#define CLIENTWIDGET_H

#include <QWidget>
#include <QTcpSocket>

namespace Ui {
class ClientWidget;
}

class ClientWidget : public QWidget
{
    Q_OBJECT

public:
    explicit ClientWidget(QWidget *parent = 0);
    ~ClientWidget();

private slots:
    void on_buttonLogin_clicked();

    void on_buttonSettings_clicked();

    void on_buttonSave_clicked();

private:
    Ui::ClientWidget *ui;
    QTcpSocket *tcpSocket;//通信套接字
    QString Server_ip;//服务器ip
    qint16 Server_port;//服务器端口
    QString username;
};

#endif // CLIENTWIDGET_H
