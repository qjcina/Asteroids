import Felgo
import QtQuick

import Asteroids

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

        AsteroidSystem {

        }

        ScoreSystem {
            id: scoreSystem
        }

        Player {
            id: player
            anchors.centerIn: scene
        }

        Text {
            id: score

            text: "Score: " + scoreSystem.currentScore
            font.pixelSize: 28
            color: "white"
            anchors {
                left: scene.gameWindowAnchorItem.left
                top: scene.gameWindowAnchorItem.top

                leftMargin: 10
                rightMargin: 10
            }
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
