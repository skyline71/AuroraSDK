import QtQuick 2.0
import Sailfish.Silica 1.0
import Mandelbrot 1.0

Page {
    allowedOrientations: Orientation.All

    PageHeader { id: pageHeader; title: qsTr("Фрактал Мандельброта") }

    Mandelbrot {
        id: fractal
        width: parent.width; height: parent.height / 2
        anchors.centerIn: parent
    }

    Grid {
        columns: 3
        width: parent.width
        anchors.bottom: parent.bottom

        Button {
            id: buttonUp
            text: "Вверх"
            width: parent.width / 3
            onClicked: {
                fractal.moveUp()
            }
        }
        Button {
            text: "Влево"
            width: parent.width / 3
            onClicked: {
                fractal.moveLeft()
            }
        }
        Button {
            text: "Увеличить"
            width: parent.width / 3
            onClicked: {
                fractal.zoomIn()
            }
        }
        Button {
            text: "Вниз"
            width: parent.width / 3
            onClicked: {
                fractal.moveDown()
            }
        }
        Button {
            text: "Вправо"
            width: parent.width / 3
            onClicked: {
                fractal.moveRight()
            }
        }
        Button {
            text: "Уменьшить"
            width: parent.width / 3
            onClicked: {
                fractal.zoomOut()
            }
        }
    }
}
