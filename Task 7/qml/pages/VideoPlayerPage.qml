import QtQuick 2.6
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    allowedOrientations: Orientation.All
    onStatusChanged: if (status === PageStatus.Deactivating) player.pause()

    SilicaFlickable {
        anchors.fill: parent

        Video {
            id: player
            width: parent.width
            height: parent.height
            autoPlay: true
            onPositionChanged: positionSlider.value = position

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (player.playbackState === MediaPlayer.PlayingState)
                        player.pause();
                    else
                        player.play();
                }
            }
        }

        PullDownMenu {
            id: videoSelectMenu
            quickSelect: true

            MenuItem {
                text: qsTr("Select video")
                onClicked: {
                    var videoPicker = pageStack.push("Sailfish.Pickers.VideoPickerPage",
                                                     { allowedOrientations: Orientation.All });
                    videoPicker.selectedContentChanged.connect(function () {
                        player.source = videoPicker.selectedContent;
                        player.play();
                    });
                }
            }
        }
    }

    Slider {
        id: positionSlider
        anchors {
            left: parent.left;
            right: parent.right
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge
        }
        minimumValue: 0
        maximumValue: player.duration || 1
        onReleased: player.seek(value)
    }
}
