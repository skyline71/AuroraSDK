﻿import QtQuick 2.6
import Sailfish.Silica 1.0
import QtWebSockets 1.0
import "../assets"

Page {
    property string messageType: "text"

    WebSocket {
        id: socket
        url: "ws://192.168.1.3:9000"
        active: true

        onTextMessageReceived: {
            if(messageType=="text") {
                chatView.postIncomingText(message, qsTr("Server"))
            }
            else if(messageType=="image") {
                chatView.postIncomingImage(message, qsTr("Server"))
            }
            chatView.scrollToBottom();
        }
        onStatusChanged: {
            if (socket.status === WebSocket.Error) {
                console.log("Error: %1".arg(socket.errorString));
            } else if (socket.status === WebSocket.Open) {
                chatView.postInfo(qsTr("Socket opened"));
            } else if (socket.status === WebSocket.Closed) {
                chatView.postInfo(qsTr("Socket closed"));
            }
            chatView.scrollToBottom();
        }
        Component.onCompleted: console.log("Listening on url from server:", url)
    }

    SilicaFlickable {
        anchors.fill: parent

        Column {
            width: parent.width
            height: parent.height

            ChatView {
                id: chatView
                width: parent.width
                height: parent.height - inputArea.height
                clip: true
                header: PageHeader { title: qsTr("WebSockets") }
            }
            Rectangle {
                id: inputArea
                width: parent.width
                height: childrenRect.height
                color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)

                TextField {
                    id: textField
                    width: parent.width
                    enabled: socket.status === WebSocket.Open
                    placeholderText: qsTr("Input message")
                    label: qsTr("Message")
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-sms"
                    EnterKey.onClicked: {
                        chatView.postOutgoingText(text, qsTr("Me"));
                        messageType = "text"
                        socket.sendTextMessage(JSON.stringify({type: messageType, data: text}));
                        text = "";
                        chatView.scrollToBottom();
                    }
                }
            }
        }

        PushUpMenu {
            MenuItem {
                text: qsTr("Send image")
                onClicked: {
                    var imagePicker =
                        pageStack.push("Sailfish.Pickers.ImagePickerPage");
                    imagePicker.selectedContentChanged.connect(function () {
                        var image = imagePicker.selectedContent
                        chatView.postOutgoingImage(image, qsTr("Me"))
                        messageType = "image"
                        socket.sendTextMessage(JSON.stringify({type: messageType, data: image.toString()}));
                        textField.text = ""
                        chatView.scrollToBottom();
                    });
                }
            }
        }
    }
}
