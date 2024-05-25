import QtQuick
import Felgo

ListView {
    id: livesDisplay

    interactive: false
    orientation: ListView.Horizontal
    layoutDirection: Qt.RightToLeft
    model: livesSystem.lives
    spacing: 3
    delegate: MultiResolutionImage {
        width: 32
        height: 32
        source: Qt.resolvedUrl("../../assets/icon_plusSmall.png")
    }
}
