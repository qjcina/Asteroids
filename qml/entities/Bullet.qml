import QtQuick
import Felgo

EntityBase {
    id: bullet
    property alias velocity: collider.linearVelocity

    entityType: "bullet"

    Rectangle {
        width: 2
        height: 2
        color: "white"
    }

    BoxCollider {
        id: collider
        anchors.fill: parent

        categories: Box.Category2
        collidesWith: Box.Category1

        fixture.onBeginContact: (other, contactNormal) => {
            bullet.removeEntity();
        }
    }
}
