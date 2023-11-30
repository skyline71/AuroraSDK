import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverPlaceholder {
        objectName: "placeholder"
        text: "Координаты и карты"
        icon {
            source: Qt.resolvedUrl("../icons/positioning-and-location.svg")
            sourceSize { width: icon.width; height: icon.height }
        }
        forceFit: true
    }
}
