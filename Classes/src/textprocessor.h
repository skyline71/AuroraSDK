#ifndef TEXTPROCESSOR_H
#define TEXTPROCESSOR_H

#include <QObject>

class TextProcessor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList list READ getList WRITE rewrite NOTIFY QStringListChanged)

public:
    explicit TextProcessor(QObject* parent = nullptr);
    QStringList getList() const;
    Q_INVOKABLE void append(QString string);
    Q_INVOKABLE bool remove();
    Q_INVOKABLE void read();
    Q_INVOKABLE QString getStringList();

signals:
    void QStringListChanged(QStringList newList);

private slots:
    void rewrite(QStringList list);

private:
    QStringList list;
    QString stringList;
};

#endif // TEXTPROCESSOR_H
