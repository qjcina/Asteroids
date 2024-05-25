import QtQuick
import Felgo
import Asteroids

Item {
    id: gameOverPopup

    anchors.fill: scene.gameWindowAnchorItem

    Rectangle {
        anchors.fill: gameOverPopup
        color: "black"
        opacity: 0.75
    }

    Row {
        id: controlsRow
        anchors.centerIn: gameOverPopup

        spacing: 5

        TextInput {
            id: nameInput
            height: button.height
            width: 300

            color: "white"

            text: "Your name here..."
            cursorVisible: true
            padding: 8
            verticalAlignment: TextInput.AlignVCenter
            maximumLength: 16

            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "#888888"
                border.width: 2
                radius: 10
            }
        }

        StyledButton {
            id: button
            color: "white"
            textColor: "black"
            radius: 10
            borderWidth: activeFocus ? 2 : 1
            borderColor: "#888888"

            text: "Continue"

            onClicked: {
                HighscoresSystem.saveScore(scoreSystem, nameInput.text);
            }
        }
    }

    Text {
        color: "white"
        anchors {
            horizontalCenter: gameOverPopup.horizontalCenter
            bottom: controlsRow.top
            bottomMargin: 50
        }

        font.pixelSize: gameOverPopup.height * 0.1
        text: "Game Over"
    }
}
