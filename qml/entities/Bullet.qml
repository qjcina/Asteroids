import QtQuick
import Felgo

EntityBase {

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
    }
}
