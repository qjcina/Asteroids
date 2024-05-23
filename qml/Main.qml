import Felgo
import QtQuick

import "entities"

GameWindow {
    id: gameWindow

    activeScene: scene

    screenWidth: 960
    screenHeight: 640

    Scene {
        id: scene

        width: 960
        height: 640

        scaleMode: "zoomToBiggerSide"

        EntityManager {
            id: entityManager
            entityContainer: scene
        }

        PhysicsWorld {

        }

        Player {
            id: player
            anchors.centerIn: scene
        }

        MouseArea {
            anchors.fill: scene
            hoverEnabled: true

            onPositionChanged: (mouse) => {
                // mouse position detection
                player.targetDirection = Qt.point(mouse.x, mouse.y);
            }

            onPressed: (mouse) =>  {
                // touch point detection
                player.targetDirection = Qt.point(mouse.x, mouse.y);
            }
        }
    }
}
