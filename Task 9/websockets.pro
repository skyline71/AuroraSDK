TARGET = websockets

QT += websockets

CONFIG += sailfishapp

SOURCES += \
    src/websockets.cpp \
    src/Base64.cpp

HEADERS += \
    src/Base64.h

DISTFILES += \
    cover/DefaultCoverPage.qml \
    qml/* \
    qml/pages/Task1.qml \
    qml/pages/Task2.qml \
    qml/pages/Task3.qml \
    rpm/websockets.yaml \
    translations/*.ts \
    websockets.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/websockets-ru.ts
