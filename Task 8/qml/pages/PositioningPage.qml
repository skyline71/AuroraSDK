import QtQuick 2.6
import Sailfish.Silica 1.0
import QtPositioning 5.3

import "../assets"

Page {
    property var destination : QtPositioning.coordinate(55.751244, 37.618423)

    NmeaPositionSource {
        id: positionSource
        active: activeSwitch.checked
    }
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: pageHeader.height + displayColumn.height

        PageHeader {
            id: pageHeader
            title: qsTr("PositionSource")
        }
        ViewPlaceholder {
            text: qsTr("No positioning data")
            enabled: !positionSource.valid
        }
        Column {
            id: displayColumn
            y: pageHeader.height
            width: parent.width
            visible: positionSource.valid

            ValueDisplay {
                label: qsTr("Timestamp")
                value: positionSource.position.timestamp
                valid: positionSource.position.coordinate.isValid
                notValidText: qsTr("No timestamp data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Coordinate")
                value: positionSource.position.coordinate
                valid: positionSource.position.coordinate.isValid
                notValidText: qsTr("No coordinate data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Latitude")
                value: positionSource.position.coordinate.latitude.toFixed(6)
                valid: positionSource.position.latitudeValid
                notValidText: qsTr("No latitude data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Longitude")
                value: positionSource.position.coordinate.longitude.toFixed(6)
                valid: positionSource.position.longitudeValid
                notValidText: qsTr("No longitude data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Altitude")
                value: positionSource.position.coordinate.altitude.toFixed(6)
                valid: positionSource.position.altitudeValid
                notValidText: qsTr("No altitude data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Distance")
                value: qsTr("%1 meters").arg(positionSource.position.coordinate.distanceTo(destination))
                valid: true
                notValidText: qsTr("No distance data")
                width: parent.width
            }
            ValueDisplay {
                label: qsTr("Speed")
                value: qsTr("%1 meters / second").arg(positionSource.position.speed)
                valid: positionSource.position.speedValid
                notValidText: qsTr("No speed data")
                width: parent.width
            }
            Switch {
                id: activeSwitch
                anchors.horizontalCenter: parent.horizontalCenter
                icon.source: "image://theme/icon-m-gps"
                checked: false
            }
        }
    }
}
