import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Связь по TCP/IP"
    }

    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "Задача 1"
                onClicked: pageStack.push(Qt.resolvedUrl("Task1.qml"))
            }
            MenuItem {
                text: "Задача 2"
                onClicked: pageStack.push(Qt.resolvedUrl("Task2.qml"))
            }
            MenuItem {
                text: "Задача 3"
                onClicked: pageStack.push(Qt.resolvedUrl("Task3.qml"))
            }
            MenuLabel { text: "Выберите модуль приложения" }
        }
        anchors.fill: parent
    }
}
