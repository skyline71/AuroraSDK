import QtQuick 2.6
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0
import QtMultimedia 5.6
import QtSensors 5.2

Page {
    property string filePath: StandardPaths.pictures + "/" + Qt.application.name + ".jpg"

    Camera {
        id: camera

        property int deviceIndex: 0

        function switchDevice() {
            stop();
            if (deviceIndex + 1 >= QtMultimedia.availableCameras.length)
                deviceIndex = 0;
            else
                ++deviceIndex;
            start();
        }

        deviceId: QtMultimedia.availableCameras[deviceIndex].deviceId
        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
        captureMode: Camera.CaptureStillImage
        flash.mode: Camera.FlashRedEyeReduction
        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceAuto
        imageCapture.onImageSaved: {
            photoPreview.source = camera.imageCapture.capturedImagePath;
            photoPreview.visible = true;
        }
    }
    OrientationSensor { id: orientationSensor; active: true }
    VideoOutput {
        id: viewfinder

        property bool mirror: camera.position === Camera.FrontFace

        anchors.fill: parent
        source: camera
        visible: !photoPreview.visible
    }
    MouseArea {
        id: touchHandler
        anchors.fill: parent
        onPressAndHold: camera.searchAndLock()
        onClicked: {
            if (orientationSensor.reading) {
                switch (orientationSensor.reading.orientation) {
                case OrientationReading.TopUp:
                    camera.metaData.orientation = viewfinder.mirror ? 90 : 270;
                    break;
                case OrientationReading.TopDown:
                    camera.metaData.orientation = viewfinder.mirror ? 270 : 90;
                    break;
                case OrientationReading.RightUp:
                    camera.metaData.orientation = viewfinder.mirror ? 0 : 0;
                    break;
                case OrientationReading.LeftUp:
                    camera.metaData.orientation = viewfinder.mirror ? 180 : 180;
                    break;
                default:
                    camera.metaData.orientation = viewfinder.mirror ? 90 : 270;
                }
            } else {
                camera.metaData.orientation = viewfinder.mirror ? 90 : 270;
            }
            camera.imageCapture.captureToLocation(filePath);
        }
    }
    Row {
        id: buttonsRow
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge
        }
        spacing: Theme.paddingLarge

        IconButton {
            icon.source: "image://theme/icon-m-reload"
            onClicked: camera.switchDevice()
        }
    }
    Image {
        id: photoPreview
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: photoPreview.visible = false
        }
    }
}
