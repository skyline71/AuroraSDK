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
import QtQuick.LocalStorage 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    backgroundColor: "#6B6B6B"

    PageHeader {
        id: pageHeader
        title: qsTr("База данных: Книги")
        titleColor: "white"
    }

    Column {
        id: textField
        width: parent.width
        anchors.top: pageHeader.bottom
        spacing: Theme.paddingSmall
        TextField {
            id: authorField
            labelVisible: false
            placeholderText: "Введите автора"
        }
        TextField {
            id: titleField
            labelVisible: false
            placeholderText: "Введите название"
        }
        TextField {
            id: tpField
            labelVisible: false
            placeholderText: "Введите число страниц"
        }
    }

    Dao { id: dao }

    SilicaListView {
        model: ListModel { id: booksListModel }
        width: parent.width
        anchors {
            top: textField.bottom
            topMargin: 10
            bottom: addButton.top
        }
        delegate: ListItem {
            Label {
                x: Theme.horizontalPageMargin
                width: parent.width;
                Text {
                    width: parent.width;
                    text: "%1) «%2» автора %3. Страниц: %4‎".arg(id).arg(title).arg(author).arg(tp)
                    font.pixelSize: 35
                    wrapMode: TextEdit.WordWrap
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        dao.deleteBook(id)
                        booksListModel.remove(index)
                    }
                }
            }
        }
    }

    Button {
        id: addButton
        text: "Добавить книгу"
        width: parent.width
        anchors.bottom: parent.bottom
        onClicked: {
            dao.insertBook(authorField.text, titleField.text, tpField.text)
            selectBooks()
        }
    }

    function selectBooks() {
        booksListModel.clear()
        dao.retrieveBooks(function (books) {
            for (var i = 0; i < books.length; i++) {
                var book = books.item(i);
                booksListModel.append({id: book.id, author: book.author,
                                          title: book.title, tp: book.tp });
            }
        });
    }
    //Component.onCompleted: dao.deleteBooks()
}
