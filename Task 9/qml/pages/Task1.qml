import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string jsonString
    property var jsonObject

    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(request) {
            return function() {
                if (request.readyState === XMLHttpRequest.DONE)
                    callback(request);
            };
        })(xhr);
        xhr.open("GET", url, true);
        xhr.send();
    }

    ListModel { id: dataModel }

    SilicaListView {
        width: parent.width;
        anchors.fill: parent
        spacing: 20
        model: dataModel

        delegate: Column {
            width: parent.width
            Text {
                width: parent.width
                text: "userID: " + model.userId
                font.pixelSize: 25
                color: "white"
            }
            Text {
                width: parent.width
                text: "ID: " + model.id
                font.pixelSize: 25
                color: "white"
            }
            Text {
                width: parent.width
                text: "Название: " + model.title
                font.pixelSize: 25
                color: "white"
                wrapMode: Text.WordWrap
            }
            Text {
                width: parent.width
                text: "Статус: " + model.completed
                font.pixelSize: 25
                color: "white"
            }
        }

        Component.onCompleted: {
            request("https://jsonplaceholder.typicode.com/todos", function (request) {
                jsonString = request.responseText
                jsonObject = JSON.parse(jsonString)
                dataModel.append(jsonObject)
            })
        }
    }
}
