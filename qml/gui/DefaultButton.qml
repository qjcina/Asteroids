import QtQuick
import Felgo

StyledButton {
    id: control
    color: "white"
    textColor: "black"
    radius: 10
    borderWidth: activeFocus ? 2 : 1
    borderColor: "#888888"

    contentItem: Text {
        text: control.text
        font: control.font
        color: control.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
