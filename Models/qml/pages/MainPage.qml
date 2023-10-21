/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"

        Text {
            id: textSelect
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 30
                leftMargin: 50
            }
            text: "Select Page"
            color: "white"
            font.pixelSize: 40
        }
        extraContent.children: [
            Image {
                id: button1
                width: 70; height: 70
                source: "https://upload.wikimedia.org/wikipedia/commons/1/13/1_number_black_and_white.svg"
                anchors {
                    top: parent.top
                    right: button2.left
                    topMargin: 25
                    rightMargin: 70
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: pageStack.push(Qt.resolvedUrl("Page1.qml"))
                }
            },
            Image {
                id: button2
                width: 70; height: 70
                source: "https://upload.wikimedia.org/wikipedia/commons/6/6c/2_number_black_and_white.svg"
                anchors {
                    top: parent.top
                    right: button3.left
                    topMargin: 25
                    rightMargin: 70
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
                }
            },
            Image {
                id: button3
                width: 70; height: 70
                source: "https://upload.wikimedia.org/wikipedia/commons/f/fc/3_number_black_and_white.svg"
                anchors {
                    top: parent.top
                    right: parent.right
                    topMargin: 25
                    rightMargin: 30
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
                }
            }
        ]
    }
}
