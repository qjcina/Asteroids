import QtQuick
import Felgo
import Asteroids

import "../gui"

Scene {
    id: scene

    width: 960
    height: 640

    signal showMenu

    Image {
        anchors.fill: scene.gameWindowAnchorItem
        source: Qt.resolvedUrl("../../assets/background.png")
        fillMode: Image.Tile
    }

    Text {
        color: "white"
        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            bottom: highscoresList.top
            bottomMargin: 10
        }

        font.pixelSize: scene.height * 0.1
        text: "Highscores"
    }

    ListView {
        id: highscoresList

        readonly property int delegateHeight: 30

        model: HighscoresSystem
        interactive: false
        orientation: ListView.Vertical
        spacing: 10

        anchors.centerIn: scene.gameWindowAnchorItem
        height: 5 * highscoresList.delegateHeight + 4 * spacing
        width: scene.gameWindowAnchorItem.width * 0.5

        delegate: Item {
            width: scene.gameWindowAnchorItem.width * 0.5
            height: highscoresList.delegateHeight

            Rectangle {
                color: "#050a40"
                radius: 5
                anchors.fill: parent

                border {
                    width: 2
                    color: "#888888"
                }
            }

            Text {
                id: name
                color: "white"

                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                font.pixelSize: 15
                text: rName
            }

            Text {
                id: score
                color: "white"

                anchors {
                    right: parent.right
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                font.pixelSize: 20
                text: rScore
            }
        }
    }

    DefaultButton {
        text: "Back"
        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            top: highscoresList.bottom
            topMargin: 10
        }

        width: 200

        onClicked: {
            scene.showMenu();
        }
    }
}
