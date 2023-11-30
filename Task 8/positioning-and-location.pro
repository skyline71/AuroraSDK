TARGET = positioning-and-location

CONFIG += sailfishapp

SOURCES += src/positioning-and-location.cpp

DISTFILES += \
    qml/* \
    qml/cover/DefaultCoverPage.qml \
    qml/pages/MainPage.qml \
    rpm/positioning-and-location.yaml \
    translations/*.ts \
    positioning-and-location.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/positioning-and-location-ru.ts

OTHER_FILES += nmea/*
nmea.files = nmea/*.nmea
nmea.path = /usr/share/$$TARGET/nmea
INSTALLS += nmea
