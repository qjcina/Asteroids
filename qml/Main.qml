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

        readonly property bool gameFinished: livesSystem.lives <= 0

        width: 960
        height: 640

        scaleMode: "zoomToBiggerSide"

        EntityManager {
            id: entityManager
            entityContainer: scene
        }

        PhysicsWorld {
            running: !scene.gameFinished
        }

        AsteroidSystem {

        }

        LivesSystem {
            id: livesSystem
            scoreSystem: scoreSystem

            onLivesChanged: {
                if (livesSystem.lives === 0) {
                    // TODO: Show game over menu
                }
            }
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
                topMargin: 10
            }
        }

        LivesDisplay {
            anchors {
                right: scene.gameWindowAnchorItem.right
                top: scene.gameWindowAnchorItem.top
                left: scene.gameWindowAnchorItem.left

                rightMargin: 10
                leftMargin: 10
                topMargin: 10
            }
        }

        MouseArea {
            enabled: !scene.gameFinished
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
