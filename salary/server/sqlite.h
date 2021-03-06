#ifndef SQLITE_H
#define SQLITE_H

#include <QWidget>
#include <QSqlTableModel>

namespace Ui {
class Sqlite;
}

class Sqlite : public QWidget
{
    Q_OBJECT

public:
    bool login(QString username,QString password);
    QString limits(QString username);

    explicit Sqlite(QWidget *parent = 0);
    ~Sqlite();

private:
    Ui::Sqlite *ui;
    QSqlTableModel *model;
};

#endif // SQLITE_H
