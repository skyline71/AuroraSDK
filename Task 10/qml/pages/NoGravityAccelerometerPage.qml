import QtQuick 2.6
import Sailfish.Silica 1.0
import Sensors 1.0
import "../assets"

Page {
    property alias sensorIdentifier: accelerometer.identifier

    NoGravityAccelerometer {
        id: accelerometer
        active: true
    }

    Column {
        anchors.fill: parent
        spacing: Theme.paddingLarge

        PageHeader { title: qsTr("No Gravity Accelerometer") }
        ValueDisplay {
            label: qsTr("x")
            value: accelerometer.reading.x.toFixed(6)
            valid: accelerometer.reading
            notValidText: qsTr("No accelerometer data")
            width: parent.width
        }
        ValueDisplay {
            label: qsTr("y")
            value: accelerometer.reading.y.toFixed(6)
            valid: accelerometer.reading
            notValidText: qsTr("No accelerometer data")
            width: parent.width
        }
        ValueDisplay {
            label: qsTr("z")
            value: accelerometer.reading.z.toFixed(6)
            valid: accelerometer.reading
            notValidText: qsTr("No accelerometer data")
            width: parent.width
        }
    }
}
