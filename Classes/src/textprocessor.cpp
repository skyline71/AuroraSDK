#include "textprocessor.h"
#include <QDebug>

TextProcessor::TextProcessor(QObject* parent) : QObject(parent)
{
    QObject::connect(this, &TextProcessor::QStringListChanged,
                     this, &TextProcessor::rewrite);
}

QStringList TextProcessor::getList() const
{
    return this->list;
}

void TextProcessor::rewrite(QStringList list)
{
    if(this->list == list)
        return;
    this->list = list;
    emit QStringListChanged(list);
}

void TextProcessor::append(QString string)
{
    if(string == "")
        return;
    list.append(string);
    emit QStringListChanged(list);
}

bool TextProcessor::remove()
{
    if(list.size() == 0)
        return 0;
    list.removeLast();
    emit QStringListChanged(list);
    return 1;
}

void TextProcessor::read()
{
    QStringListIterator it(list);
    while(it.hasNext())
        qDebug() << it.next().trimmed();
}

QString TextProcessor::getStringList()
{
    if(list.size() == 0)
        return "Error: List is empty";

    QStringListIterator it(list);
    QString tmp = it.next();
    QString stringList = list.size() == 1
            ? tmp[0].toUpper() + tmp.mid(1, tmp.size()-1)
            : tmp[0].toUpper() + tmp.mid(1, tmp.size()-1) + ", ";

    while(it.hasNext()) {
        tmp = it.next();
        stringList += tmp;
        if(it.hasNext())
            stringList += ", ";
    }
    return stringList;
}
