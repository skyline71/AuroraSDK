#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ getValue WRITE setValue NOTIFY valueChanged)

public:
    explicit Counter(QObject* parent = nullptr);
    int getValue() const;
    Q_INVOKABLE void increment();
    Q_INVOKABLE void reset();

signals:
    void valueChanged(int newValue);

public slots:
    void setValue(int value);

private:
    int value;
};

#endif // COUNTER_H
