import Felgo
import QtQuick

import Asteroids

import "scenes"

GameWindow {
    id: gameWindow

    activeScene: sceneLoader.item

    screenWidth: 960
    screenHeight: 640

    Loader {
        id: sceneLoader

        sourceComponent: menuSceneComponent
    }

    Component {
        id: highscoresSceneComponent
        HighscoresScene {
            onShowMenu: {
                sceneLoader.sourceComponent = menuSceneComponent
            }
        }
    }

    Component {
        id: menuSceneComponent
        MenuScene {
            onStartGame: {
                sceneLoader.sourceComponent = gameSceneComponent
            }

            onShowHighscores: {
                sceneLoader.sourceComponent = highscoresSceneComponent
            }
        }
    }

    Component {
        id: gameSceneComponent
        GameScene {
            onScoreSaved: {
                sceneLoader.sourceComponent = menuSceneComponent
            }
        }
    }
}
