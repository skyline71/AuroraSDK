TARGET = multimedia

CONFIG += sailfishapp

SOURCES += \
    src/multimedia.cpp \
    src/AudioRecorder.cpp

HEADERS += \
    src/AudioRecorder.h

DISTFILES += \
    qml/* \
    rpm/multimedia.yaml \
    translations/*.ts \
    multimedia.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/multimedia.ts \
    translations/multimedia-ru.ts

OTHER_FILES += \
soundeffects/*
soundeffects.files = soundeffects/*
soundeffects.path = /usr/share/$$TARGET/soundeffects \
videoeffects/*
videoeffects.files = videoeffects/*
videoeffects.path = /usr/share/$$TARGET/videoeffects

INSTALLS += \
soundeffects \
videoeffects

QT += multimedia
