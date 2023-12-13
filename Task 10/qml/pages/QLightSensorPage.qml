import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: lightSensor.identifier

    LightSensor {
        id: lightSensor
        active: true
    }
    PageHeader { title: qsTr("Light Sensor") }
    // ToDo: insert text to display illuminance in lux
    Label {
        anchors.centerIn: parent
        text: lightSensor.reading ?
                  qsTr("%1 lux").arg(lightSensor.reading.illuminance) :
                  qsTr("Unknown")
        font.pixelSize: Theme.fontSizeExtraLarge
        color: Theme.highlightColor
    }
}
