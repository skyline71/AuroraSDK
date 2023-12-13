TARGET = sensors

QT += sensors

CONFIG += sailfishapp

SOURCES += \
    src/NoGravityAccelerometer.cpp \
    src/NoGravityAccelerometerFilter.cpp \
    src/sensors.cpp \
    # ToDo: add NoGravityAccelerometer and NoGravityAccelerometerFilter cpp

HEADERS += \
 \    # ToDo: add NoGravityAccelerometer and NoGravityAccelerometerFilter headers
    src/NoGravityAccelerometer.h \
    src/NoGravityAccelerometerFilter.h

DISTFILES += \
    qml/* \
    qml/pages/MainPage.qml \
    rpm/sensors.spec \
    rpm/sensors.yaml \
    translations/*.ts \
    sensors.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/sensors-ru.ts
# ToDo: add requires to use QtSensors in C++
