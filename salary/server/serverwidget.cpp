#include "serverwidget.h"
#include "ui_serverwidget.h"
#include <QDebug>
#include <QStringList>

ServerWidget::ServerWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ServerWidget)
{
    ui->setupUi(this);
    setWindowTitle("工资管理系统服务器");
    tcpServer = NULL;
    tcpSocket = NULL;
    tcpServer = new QTcpServer(this);//指定父对象，自动回收空间
    tcpSocket = new QTcpSocket(this);
    socket_list = new QList<QTcpSocket*>;
    //BIND()LISTEN()监听，绑定8888端口
    tcpServer->listen(QHostAddress::Any,8888);

    connect(tcpServer,&QTcpServer::newConnection,
            this,&ServerWidget::newConnect);

}

ServerWidget::~ServerWidget()
{
    delete ui;
}

void ServerWidget::newConnect()
{
    //取出建立好连接的套接字
    tcpSocket = tcpServer->nextPendingConnection();
    //获取客户的ip和端口
    QString ip = tcpSocket->peerAddress().toString();//地址转换成字符串
    qint16 port = tcpSocket->peerPort();//端口

    socket_list->append(tcpSocket);//有一个连接成功就取出这个套接字，放在list中

    connect(tcpSocket,&QTcpSocket::readyRead,
            this,&ServerWidget::readMessage);

}

void ServerWidget::readMessage()
{
    for(int i = 0;i < socket_list->length();i++)//读取所有套接字发送的信息
    {
        QDataStream in(socket_list->at(i));
        in.setVersion (QDataStream::Qt_5_4);
        in >> message;
        if(!(message.isEmpty()))
        {
            break;
        }
    }
    QStringList list = message.split("#");//分割收到的字符串
    bool ret=0;
    QString limits;
    QString sendData=list[0];//对应操作命令
    if(list[0]=="-login")//第一个命令为登录
    {
         ret = checkLogin(list[1],list[2]);//用户名#密码
         if(ret)
         {
             limits = checkLimits(list[1]);
             sendData+="#true#";
             sendData+=list[1];//用户名
             sendData+="#";
             sendData+=limits;//权限
         }
         else
         {
             sendData+="#false#";
             sendData+=list[1];//用户名
             sendData+="#";
             sendData+=":(";//权限
         }
    }

    sendMessage (sendData);//发送操作结果
}


void ServerWidget::sendMessage(QString sendData)
{
    QByteArray message;
    QDataStream out(&message,QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_4);
    out<<sendData;

    //qDebug()<<sendData;
    for (int i = 0;i < socket_list->length();i ++)//所有的客户端都会收到这条信息,需要客户端自己筛选是不是发送给自己的
    {
        socket_list->at(i)->write(message);
    }
}

bool ServerWidget::checkLogin(QString username,QString password)
{
    bool ret = myDb.login(username,password);
    return ret;
}

QString ServerWidget::checkLimits(QString username)
{
    QString ret = myDb.limits(username);
    return ret;
}

void ServerWidget::on_ButtonData_clicked()
{
    myDb.show();
}
