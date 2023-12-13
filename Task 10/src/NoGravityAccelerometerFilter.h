#ifndef NOGRAVITYACCELEROMETERFILTER_H
#define NOGRAVITYACCELEROMETERFILTER_H

#include <QAccelerometerFilter>
#include <QRotationSensor>

class NoGravityAccelerometerFilter : public QAccelerometerFilter
{
public:
    explicit NoGravityAccelerometerFilter();
    virtual bool filter(QAccelerometerReading *reading);

private:
    QRotationSensor _rotationSensor;
};

#endif // NOGRAVITYACCELEROMETERFILTER_H
