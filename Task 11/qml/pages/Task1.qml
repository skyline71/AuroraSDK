import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets"

Page {
    allowedOrientations: Orientation.All
    property string value: ""

    PageHeader { id: pageHeader; title: qsTr("Числа Фибоначчи") }

    WorkerScript {
        id: myWorker
        source: "../assets/workerscript.js"
        onMessage: {
            value = messageObject.result
        }
    }

    Row {
        id: row
        anchors.top: pageHeader.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Theme.paddingLarge

        Spinner {
            id: spinner
            label: "Номер"
            onValueChanged: {
                myWorker.sendMessage(spinner.value)
            }
        }

        Column {
            anchors.verticalCenter: row.verticalCenter
            spacing: Theme.paddingLarge
            Button {
                text: "Вычислить"
                onClicked: {
                    resultText.text = "%1-e число Фибоначчи равно %2".
                    arg(spinner.value).arg(value)
                }
            }
            Button {
                text: "Сбросить"
                onClicked: {
                    resultText.text = ""
                    spinner.value = 0
                }
            }
        }
    }

    Label {
        width: parent.width
        anchors.top: row.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.horizontalPageMargin
        Text {
            id: resultText
            anchors.fill: parent
            color: "white"
            wrapMode: Text.WordWrap
        }
    }
}
