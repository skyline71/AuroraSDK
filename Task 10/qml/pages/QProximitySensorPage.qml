import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: proximitySensor.identifier

    ProximitySensor {
        id: proximitySensor
        active: true
    }
    PageHeader { title: qsTr("Proximity Sensor") }
    // ToDo: insert switch to monitor sensor state
    Switch {
        anchors.centerIn: parent
        enabled: proximitySensor.active
        checked: proximitySensor.active && proximitySensor.reading.near
        automaticCheck: false
        scale: 10
    }
}
