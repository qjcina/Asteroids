import QtQuick
import Felgo

import "../gui"

Scene {
    id: scene

    width: 960
    height: 640

    signal startGame
    signal showHighscores

    Image {
        anchors.fill: scene.gameWindowAnchorItem
        source: Qt.resolvedUrl("../../assets/background.png")
        fillMode: Image.Tile
    }

    Column {
        id: column
        anchors {
            fill: scene.gameWindowAnchorItem
            margins: scene.width * 0.2
        }
        spacing: 10

        Text {
            color: "white"
            anchors {
                horizontalCenter: column.horizontalCenter
            }

            font.pixelSize: scene.height * 0.1
            text: "Asteroids"
        }

        DefaultButton {
            text: "Start Game"
            anchors {
                horizontalCenter: column.horizontalCenter
            }

            width: 200

            onClicked: {
                scene.startGame();
            }
        }

        DefaultButton {
            text: "Highscores"
            anchors {
                horizontalCenter: column.horizontalCenter
            }

            width: 200

            onClicked: {
                scene.showHighscores();
            }
        }

        DefaultButton {
            text: "Exit"
            anchors {
                horizontalCenter: column.horizontalCenter
            }

            width: 200

            onClicked: {
                Qt.quit();
            }
        }
    }
}
