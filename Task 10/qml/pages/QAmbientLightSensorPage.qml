import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: ambientLightSensor.identifier

    AmbientLightSensor {
        id: ambientLightSensor
        active: true
    }
    PageHeader { id: header; title: qsTr("Ambient Light Sensor") }
    // ToDo: insert column with named cells to display light level
    ListModel {
        id: dataModel
        Component.onCompleted: {
            dataModel.append([
                                 {
                                     name:  qsTr("Sunny"),
                                     lightLevel:  AmbientLightReading.Sunny },
                                 {
                                     name:  qsTr("Bright"),
                                     lightLevel:  AmbientLightReading.Bright },
                                 {
                                     name:  qsTr("Light"),
                                     lightLevel:  AmbientLightReading.Light },
                                 {
                                     name:  qsTr("Twilight"),
                                     lightLevel:  AmbientLightReading.Twilight },
                                 {
                                     name:  qsTr("Dark"),
                                     lightLevel: AmbientLightReading.Dark }
                             ])
        }
    }

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: Theme.paddingLarge
        Repeater {
            model: dataModel
            Rectangle {
                width: column.width * 3/4; height: Theme.itemSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                color: (ambientLightSensor.reading.lightLevel < model.lightLevel ? "transparent" : Theme.rgba(
                              Theme.highlightBackgroundColor,
                              Theme.highlightBackgroundOpacity
                              )
                        )
                Text {
                    anchors.centerIn: parent
                    text: model.name
                    font.pixelSize: Theme.fontSizeMedium
                    color: "white"
                }
            }
        }
    }
}
