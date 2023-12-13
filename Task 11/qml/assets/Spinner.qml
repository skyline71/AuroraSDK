import QtQuick 2.0

Rectangle {
    width: 200
    height: 200
    color: "transparent"
    property alias value: list.currentIndex
    property alias label: caption.text

    Text {
        id: caption
        text: "Spinner"
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40;
    }

    Rectangle {
        anchors.top: caption.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 100
        width: 100
        color: "#35FFFFFF"
        ListView {
            id: list
            anchors.fill: parent
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: height/4
            preferredHighlightEnd: height/4
            clip: true
            model: 1000
            delegate: Text {
                font.pixelSize: 45;
                color: "white";
                text: index;
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
