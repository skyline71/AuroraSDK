import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    backgroundColor: "#9D6C6C"
    property string login : ""
    property string password : ""
    property string username : ""
    property var jsonString
    property var jsonObject

    function requestCreate(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(request) {
            return function() {
                if (request.readyState === XMLHttpRequest.DONE)
                    callback(request);
            };
        })(xhr);
        xhr.open("POST", url, true);
        var params = "name=" + encodeURIComponent("user") + "&" + "job=" + encodeURIComponent("main")
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
        xhr.send(params)
    }

    function requestSuccess(url, callback, usr) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(request) {
            return function() {
                if (request.readyState === XMLHttpRequest.DONE)
                    callback(request);
            };
        })(xhr);
        xhr.open("POST", url, true);
        var params = "username=" + encodeURIComponent(usr) + "&" + "email=" + encodeURIComponent(login) + "&" + "password=" + encodeURIComponent(password)
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
        xhr.send(params)
    }

    function requestUnsuccess(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(request) {
            return function() {
                if (request.readyState === XMLHttpRequest.DONE)
                    callback(request);
            };
        })(xhr);
        xhr.open("POST", url, true);
        var params = "email=" + encodeURIComponent(login)
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
        xhr.send(params)
    }

    Column {
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 100

        TextArea {
            id: textArea
            readOnly: true
        }

        TextField {
            id: textLogin
            label: "Чтобы добавить логин нажмите Enter"
            placeholderText: "Введите логин"
            width: parent.width

            EnterKey.onClicked: {
                login = text
                text = ""
                if(login != "") textArea.text = "Логин добавлен успешно"
            }
        }
        TextField {
            id: textPassword
            label: "Чтобы добавить пароль нажмите Enter"
            placeholderText: "Введите пароль"
            width: parent.width

            EnterKey.onClicked: {
                password = text
                text = ""
                if(password != "") textArea.text = "Пароль добавлен успешно"
            }
        }

        Button {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: "Зарегестрироваться"
            }
            onClicked: {
                console.log("login: " + login + "\n" + "pass: " + password)
                if(login == "") textArea.text = "Ошибка! Введите логин"
                else if(password == "") {
                    requestUnsuccess("https://reqres.in/api/register", function (request) {
                        jsonString = request.responseText
                        jsonObject = JSON.parse(jsonString)
                        console.log(jsonString)
                        textArea.text = jsonObject.error
                    })
                    textArea.text = ""
                    login = ""
                    password = ""
                }
                else {
                    requestCreate("https://reqres.in/api/users", function (request) {
                        jsonString = request.responseText
                        jsonObject = JSON.parse(jsonString)
                        console.log(jsonString)
                        username = jsonObject.name
                    })
                    requestSuccess("https://reqres.in/api/register", function (request) {
                        jsonString = request.responseText
                        jsonObject = JSON.parse(jsonString)
                        console.log(jsonString)
                        textArea.text = "Username: " + username + " \nToken: " + jsonObject.token
                    }, username)
                    textArea.text = ""
                    login = ""
                    password = ""
                }
            }
        }
    }
}
