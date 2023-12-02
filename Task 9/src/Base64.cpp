#include "Base64.h"
#include <QFile>

Base64::Base64(QObject *parent) : QObject(parent),
  _options(0)
{
}

bool Base64::urlEncoding() const {
    return this->_options & QByteArray::Base64UrlEncoding;
}

bool Base64::omitTrailingEquals() const {
    return this->_options & QByteArray::OmitTrailingEquals;
}

void Base64::setUrlEncoding(bool urlEncoding)
{
    if (urlEncoding) {
        this->_options |= QByteArray::Base64UrlEncoding;
    } else {
        this->_options &= ~QByteArray::Base64UrlEncoding;
    }
    emit urlEncodingChanged();
}

void Base64::setOmitTrailingEquals(bool omitTrailingEquals)
{
    if (omitTrailingEquals) {
        this->_options |= QByteArray::OmitTrailingEquals;
    } else {
        this->_options &= ~QByteArray::OmitTrailingEquals;
    }
    emit urlEncodingChanged();
}

QString Base64::encodeFile(const QString &filePath) const
{
    QFile file(filePath);
    file.open(QIODevice::ReadOnly);
    return file.readAll().toBase64(this->_options);
}
