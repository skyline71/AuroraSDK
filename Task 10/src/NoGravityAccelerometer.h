#ifndef NOGRAVITYACCELEROMETER_H
#define NOGRAVITYACCELEROMETER_H

#include <QAccelerometer>
#include "NoGravityAccelerometerFilter.h"

class NoGravityAccelerometer : public QAccelerometer
{
    Q_OBJECT
public:
    explicit NoGravityAccelerometer(QObject *parent = nullptr);

private:
    NoGravityAccelerometerFilter _filter;
};

#endif // NOGRAVITYACCELEROMETER_H
