import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: rotationSensor.identifier

    RotationSensor {
        id: rotationSensor
        active: true
    }
    PageHeader { title: qsTr("Rotation Sensor") }
    Image {
        id: image
        source: "../graphics/logo_qt_2016.svg"
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        fillMode: Image.PreserveAspectFit
        // ToDo: transform the image to make it always be horizontal
    }
}
