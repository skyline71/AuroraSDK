#include "counter.h"

Counter::Counter(QObject* parent) : QObject(parent)
{
    QObject::connect(this, &Counter::valueChanged,
                     this, &Counter::setValue);
    value = 0;
}

int Counter::getValue() const
{
    return this->value;
}

void Counter::setValue(int value) {
    if(this->value == value)
        return;
    this->value = value;
    emit valueChanged(value);
}

void Counter::increment()
{
    ++value;
    emit valueChanged(value);
}

void Counter::reset()
{
    value = 0;
    emit valueChanged(value);
}
