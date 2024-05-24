import QtQuick
import Felgo

EntityBase {
    id: asteroid
    property alias velocity: collider.linearVelocity
    property int size: 3

    entityType: "asteroid"

    MultiResolutionImage {
        id: asteroidImage
        width: 21 * asteroid.size
        height: 21 * asteroid.size
        source: Qt.resolvedUrl("../../assets/meteor_detailedLarge.png")
    }

    BoxCollider {
        id: collider
        anchors.fill: asteroidImage
        categories: Box.Category1
        collidesWith: Box.Category2

        fixture.onBeginContact: (other, contactNormal) => {
            if (size > 1) {
                entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Asteroid.qml"), {
                    x: asteroid.x,
                    y: asteroid.y,
                    velocity: Qt.point(-asteroid.velocity.y, asteroid.velocity.x),
                    size: asteroid.size - 1
                });
                entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Asteroid.qml"), {
                    x: asteroid.x,
                    y: asteroid.y,
                    velocity: Qt.point(asteroid.velocity.y, -asteroid.velocity.x),
                    size: asteroid.size - 1
                });
            }

            scoreSystem.increaseScore();

            asteroid.removeEntity();
        }
    }
}
