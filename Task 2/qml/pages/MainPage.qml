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
    backgroundColor: "white"

    PageHeader {
        objectName: "pageHeader"
        title: "Основы QML"
        titleColor: "black"
    }

    Item {
        id: solution1

        Rectangle {
            id: redRect
            color: "red"
            x: 100
            y: 200
            width: 200; height: 200
        }

        Rectangle {
            id: greenRect
            color: "#00FF00"
            width: redRect.width; height: redRect.height
            anchors {
                top: redRect.bottom; topMargin: -(height/2)
                left: redRect.right
            }
        }

        Rectangle {
            id: blueRect
            color: "blue"
            width: redRect.width; height: redRect.height
            anchors {
                top: redRect.top
                left: greenRect.right; leftMargin: -(width/2)
            }

            Text {
                text: qsTr("  Синий\nквадрат")
                color: "white"
                anchors.centerIn: blueRect
                font { bold: true; pixelSize: 30 }
            }
        }
    }

    Item {
        id: solution2
        anchors.fill: parent

        Rectangle {
            id: animRect
            color: "#4B0082"
            x: parent.width * 1/5; y: parent.height * 3/5
            width: 300; height: 300

            MouseArea {
                anchors.fill: animRect
                onClicked: anim.start()
            }

            ParallelAnimation {
                id: anim
                NumberAnimation {
                    target: animRect
                    property: "width";
                    from: 300; to: 100;
                    duration: 1000
                }
                NumberAnimation {
                    target: animRect
                    property: "x";
                    from: parent.width * 1/5; to: parent.width * 1/5 + 200;
                    duration: 1000
                }
                RotationAnimation {
                    target: animRect
                    property: "rotation";
                    from: 0; to: 45;
                    duration: 1000
                }
            }
        }
    }
}
