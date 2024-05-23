import QtQuick
import Felgo

EntityBase {
    id: player

    property point targetDirection: Qt.point(0,0)

    width: 64
    height: 64

    entityId: "player"
    entityType: "player"
    transform: Rotation {
        id: rotationTransform
        angle: internal.angle + 90
        origin {
            x: shipImage.width / 2
            y: shipImage.height / 2
        }
    }

    MultiResolutionImage {
        id: shipImage
        anchors.fill: player
        source: Qt.resolvedUrl("../../assets/ship_E.png")
    }

    QtObject {
        id: internal

        property real angle: direction * (180/Math.PI)
        readonly property real direction: {
            let shipOrigin = player.mapToItem(parent, Qt.point(shipImage.width / 2, shipImage.height / 2))
            return Math.atan2(targetDirection.y - shipOrigin.y,
                              targetDirection.x - shipOrigin.x)
        }

        Behavior on angle {
            RotationAnimation {
                duration: 500
                direction: RotationAnimation.Shortest
            }
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true

        onTriggered: {
            const rotation = internal.angle * (Math.PI/180);
            const speed = 100;
            const velocity = Qt.point(Math.cos(rotation) * speed, Math.sin(rotation) * speed);
            const originDistance = shipImage.width / 2;
            const origin = Qt.point(Math.cos(rotation) * originDistance, Math.sin(rotation) * originDistance);
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Bullet.qml"), {
                x: player.x + originDistance + origin.x,
                y: player.y + originDistance + origin.y,
                velocity: velocity
            });
        }
    }
}
