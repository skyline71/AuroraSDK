import QtQuick 2.6
import Sailfish.Silica 1.0
import QtSensors 5.2

Page {
    SilicaListView {
        id: sensorsListView
        anchors.fill: parent
        header: PageHeader { title: qsTr("Sensors") }
        model:  ListModel { }
        section {
            //ToDo: make sections by sensor type
            property: "type"
            delegate: SectionHeader { text: section }
        }
        delegate: ListItem {
            // ToDo: push the correpsonding page to the stack
            Label {
                // ToDo: use sensor identifier as text
                // ToDo: highlight default sensor with bold font
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    right: parent.right
                    margins: Theme.horizontalPageMargin
                }
                Text {
                    text: model.sensorIdentifier
                    font.bold: (model.isDefault ? true : false)
                    font.pixelSize: 25
                    color: "white"
                }
            }
            onClicked: pageStack.push(Qt.resolvedUrl("%1Page.qml".arg(model.type)))
        }
        Component.onCompleted: {
            // ToDo: fill model with sensors descriptions
            QmlSensors.sensorTypes().forEach(function (sensorType) {
                var defaultSensor = QmlSensors.defaultSensorForType(sensorType);
                QmlSensors.sensorsForType(sensorType).forEach(function (sensor) {
                    model.append({
                                     sensorIdentifier: sensor,
                                     type: sensorType,
                                     isDefault: sensor === defaultSensor
                                 })
                });
            });
        }

        ViewPlaceholder {
            text: qsTr("No sensors")
            enabled: sensorsListView.count === 0
        }
    }
}
