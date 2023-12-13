import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2
import "../assets"

Page {
    property alias sensorIdentifier: orientationSensor.identifier

    OrientationSensor {
        id: orientationSensor
        active: true
    }
    PageHeader { title: qsTr("Orientation Sensor") }
    // ToDo: insert a ball which acceleration direction is controlled by orientation
}
