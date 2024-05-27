import QtQuick
import Felgo
import Asteroids

import "../entities"
import "../gui"
import ".."

Scene {
    id: scene

    readonly property bool gameFinished: livesSystem.lives <= 0

    width: 960
    height: 640

    scaleMode: "zoomToBiggerSide"

    signal scoreSaved

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
    }

    ScoreSystem {
        id: scoreSystem
    }

    CleanupSystem {
        id: cleanupSystem
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

    GameOverPopup {
        visible: scene.gameFinished
        enabled: visible
    }
}
