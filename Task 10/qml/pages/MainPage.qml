import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Работа с датчиками (сенсорами)"
    }

    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "Задача 1"
                onClicked: pageStack.push(Qt.resolvedUrl("SensorsListPage.qml"))
            }
            MenuItem {
                text: "Задача 2"
                onClicked: pageStack.push(Qt.resolvedUrl("QProximitySensorPage.qml"))
            }
            MenuItem {
                text: "Задача 3"
                onClicked: pageStack.push(Qt.resolvedUrl("QLightSensorPage.qml"))
            }
            MenuItem {
                text: "Задача 4"
                onClicked: pageStack.push(Qt.resolvedUrl("QAmbientLightSensorPage.qml"))
            }
            MenuItem {
                text: "NoGravityAccelerometer"
                onClicked: pageStack.push(Qt.resolvedUrl("NoGravityAccelerometerPage.qml"))
            }
            MenuLabel { text: "Выберите модуль приложения" }
        }
        anchors.fill: parent
    }
}
