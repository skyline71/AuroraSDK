import QtQuick 2.6

Rectangle {
    property point center: Qt.point(0, 0)
    property vector2d velocity: Qt.vector2d(0, 0)
    property vector2d acceleration: Qt.vector2d(0, 0)
    property real updateFrequency: 1000

    x: center.x - radius
    y: center.y - radius
    width: 2* radius
    height: 2* radius

    // ToDo: make the ball reflect from the parent bounds

    Timer {
        interval: 1000 / updateFrequency
        repeat: true
        running: true
        onTriggered: {
            center.x += velocity.x / updateFrequency;
            center.y += velocity.y / updateFrequency;
            velocity.x += acceleration.x / updateFrequency;
            velocity.y += acceleration.y / updateFrequency;
        }
    }
    MouseArea {
        property vector2d pressedMousePosition
        anchors.fill: parent
        onPressed: pressedMousePosition = Qt.vector2d(mouseX, mouseY)
        onReleased: {
            velocity.x += 10 * (mouseX - pressedMousePosition.x)
            velocity.y += 10 * (mouseY - pressedMousePosition.y)
        }
    }
}
