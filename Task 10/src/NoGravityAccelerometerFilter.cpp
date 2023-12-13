#include "NoGravityAccelerometerFilter.h"
#include <QtMath>

#define GRAVITY 9.81

NoGravityAccelerometerFilter::NoGravityAccelerometerFilter() : QAccelerometerFilter()
{
    // ToDo: start embeded rotation sensor
}

bool NoGravityAccelerometerFilter::filter(QAccelerometerReading *reading)
{
    QRotationReading *rotationReading = this->_rotationSensor.reading();
    if (rotationReading) {
        // ToDo: implement reading filtering
    }
    return true;
}
