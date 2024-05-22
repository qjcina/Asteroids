import Felgo
import QtQuick

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
    }
}
