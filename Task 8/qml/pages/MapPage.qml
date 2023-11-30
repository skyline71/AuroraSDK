import QtQuick 2.6
import Sailfish.Silica 1.0

import QtPositioning 5.3
import QtLocation 5.0
import "../assets"

Page {
    NmeaPositionSource { id: positionSource }
    Map {
        id: map
        anchors.fill: parent
        plugin: Plugin {
            id: mapPlugin
            objectName: "mapPlugin"
            name: "webtiles"
            allowExperimental: false
            PluginParameter { name: "webtiles.scheme"; value: "https" }
            PluginParameter { name: "webtiles.host"; value: "tile.openstreetmap.org" }
            PluginParameter { name: "webtiles.path"; value: "/${z}/${x}/${y}.png" }
        }
        gesture.enabled: true
        zoomLevel: zoomSlider.value

        Binding {
            target: map
            property: "center"
            value: positionSource.position.coordinate
            when: positionSource.position.coordinate.isValid
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var mouseCoordinate = map.toCoordinate(Qt.point(mouse.x, mouse.y));
                var circle = Qt.createQmlObject("import QtLocation 5.0; MapCircle {}", map);
                circle.center = mouseCoordinate;
                circle.radius = 50.0;
                circle.color = "red";
                circle.border.width = 3;
                map.addMapItem(circle);
            }
            onPressAndHold: {
                var mouseCoordinate = map.toCoordinate(Qt.point(mouse.x, mouse.y));
                var circle = mapQuickCircleComponent.createObject(map, {
                    coordinate: mouseCoordinate,
                    diameter: footprints.diameter,
                    color: "green"
                });
                map.addMapItem(circle);
            }
        }

        Component.onCompleted: center = QtPositioning.coordinate(55.7522, 37.6156)
    }
    Slider {
        id: zoomSlider
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        minimumValue: map.minimumZoomLevel
        maximumValue: map.maximumZoomLevel
        value: 11
        highlighted: true
        handleVisible: true
    }
    Footprints {
        id: footprints
        visible: positionSource.position.coordinate.isValid
        coordinate: positionSource.position.coordinate
        diameter: Math.min(map.width, map.height) / 8
    }
    Component {
        id: mapQuickCircleComponent

        MapQuickCircle { }
    }

    Component.onCompleted: map.addMapItem(footprints)
}
