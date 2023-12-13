import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2
import "../assets"

Page {
    property alias sensorIdentifier: accelerometer.identifier

    Accelerometer {
        id: accelerometer
        active: true
    }
    PageHeader { title: qsTr("Accelerometer") }
    // ToDo: insert a ball which acceleration is controlled by accelerometer
}
