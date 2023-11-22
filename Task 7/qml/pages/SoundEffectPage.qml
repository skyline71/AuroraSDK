import QtQuick 2.6
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    SoundEffect {
        id: soundEffect
        source: "file:///usr/share/%1/soundeffects/gun.wav".arg(Qt.application.name)
        volume: volumeSlider.value
        loops: loopsSlider.value
    }

    Component.onCompleted: {
        console.log(soundEffect.source)
    }

    PageHeader { title: qsTr("Sound Effect") }

    MouseArea {
        id: touchHandler
        anchors.fill: parent
        onClicked: {
            if (soundEffect.playing)
                soundEffect.stop();
            else
                soundEffect.play();
        }
    }

    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: Theme.paddingLarge

        Slider {
            id: volumeSlider
            width: parent.width
            label: qsTr("Volume")
            value: 0.5
            valueText: value
            minimumValue: 0
            maximumValue: 1
            stepSize: 0.1
        }
        Slider {
            id: loopsSlider
            width: parent.width
            label: qsTr("Loops")
            value: 1
            valueText: value
            minimumValue: 1
            maximumValue: 10
            stepSize: 1
        }
        Slider {
            width: parent.width
            label: qsTr("Progress")
            value: soundEffect.loops - soundEffect.loopsRemaining
            minimumValue: 0
            maximumValue: loopsSlider.value
            enabled: false
        }
    }
}
