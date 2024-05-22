import QtQuick
import Felgo

EntityBase {
    property point targetDirection: Qt.point(0,0)
    readonly property real direction: {
        let shipOrigin = mapToItem(parent, Qt.point(shipImage.width / 2, shipImage.height / 2))
        return Math.atan2(targetDirection.y - shipOrigin.y,
                          targetDirection.x - shipOrigin.x)
    }

    entityId: "player"
    entityType: "player"
    transform: Rotation {
        angle: direction * (180/Math.PI) + 90
        origin {
            x: shipImage.width / 2
            y: shipImage.height / 2
        }

        Behavior on angle {
            RotationAnimation {
                duration: 500
                direction: RotationAnimation.Shortest
            }
        }
    }

    MultiResolutionImage {
        id: shipImage
        width: 64
        height: 64
        source: Qt.resolvedUrl("../../assets/ship_E.png")
    }
}
