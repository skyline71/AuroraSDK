import QtQuick 2.6
import Sailfish.Silica 1.0
import QtWebSockets 1.0
import "../assets"
import Base64 1.0

Page {
    property int count : 0

    WebSocketServer {
        id: socketServer
        listen: true
        onClientConnected: {
            webSocket.onTextMessageReceived.connect(function(message) {
                console.log(qsTr("Server received message: %1").arg(message));
                var text = JSON.parse(message)
                if(count==0) {
                    webSocket.sendTextMessage(qsTr("Hello Client! Send me something"));
                }
                else {
                    webSocket.sendTextMessage(qsTr(text.data));
                }
                count++
            });
            console.log("WebSocket connected")
        }
        onErrorStringChanged: {
            console.log(qsTr("Server error: %1").arg(errorString));
        }
        Component.onCompleted: {
            console.log("Listening on url:", url)
        }
    }

    WebSocket {
        id: socket
        url: socketServer.url
        active: false

        onTextMessageReceived: {
            chatView.postIncomingText(message, qsTr("Server"))
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
                    width: parent.width
                    enabled: socket.status === WebSocket.Open
                    placeholderText: qsTr("Input message")
                    label: qsTr("Message")
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-sms"
                    EnterKey.onClicked: {
                        chatView.postOutgoingText(text, qsTr("Me"));
                        chatView.scrollToBottom();
                        socket.sendTextMessage(JSON.stringify({type: "text", data: text}));
                        text = "";
                    }
                }
            }
        }

        Base64 { id: base64 }

        PushUpMenu {
            MenuItem {
                text: qsTr("Send image")
                onClicked: {
                    var imagePicker =
                        pageStack.push("Sailfish.Pickers.ImagePickerPage");
                    imagePicker.selectedContentChanged.connect(function () {
                        var image = imagePicker.selectedContent
                        chatView.postOutgoingImage(image, qsTr("Me"))
                        chatView.scrollToBottom();
                        //To-Do: image encoding to websocket
                    });
                }
            }
        }
    }
}
