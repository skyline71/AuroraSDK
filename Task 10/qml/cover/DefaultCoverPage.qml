import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverPlaceholder {
        objectName: "placeholder"
        text: "Работа с датчиками (сенсорами)"
        icon {
            source: Qt.resolvedUrl("../icons/sensors.svg")
            sourceSize { width: icon.width; height: icon.height }
        }
        forceFit: true
    }
}
