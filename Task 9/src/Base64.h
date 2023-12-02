#ifndef BASE64_H
#define BASE64_H

#include <QObject>

class Base64 : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool urlEncoding READ urlEncoding WRITE setUrlEncoding NOTIFY urlEncodingChanged)
    Q_PROPERTY(bool omitTrailingEquals READ omitTrailingEquals WRITE setOmitTrailingEquals NOTIFY omitTrailingEqualsChanged)
public:
    explicit Base64(QObject *parent = nullptr);
    bool urlEncoding() const;
    bool omitTrailingEquals() const;

signals:
    void urlEncodingChanged();
    void omitTrailingEqualsChanged();

public slots:
    void setUrlEncoding(bool urlEncoding);
    void setOmitTrailingEquals(bool omitTrailingEquals);
    // "data:%1;base64,%2"
    QString encodeFile(const QString &filePath) const;

private:
    QByteArray::Base64Options _options;
};

#endif // BASE64_H
