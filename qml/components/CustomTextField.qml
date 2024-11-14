import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import QtQuick.Controls.Basic

// Custom text field
TextField {
    id: customTextField

    font.pixelSize: 12

    background: Rectangle {
        Behavior on color {
            PropertyAnimation {
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }

        Behavior on border.color {
            PropertyAnimation {
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }

        border {
            width: 1
            color: parent.focus? "#3a4ec4": parent.hovered? "#6d77b4": "#50000000"
        }
        radius: 6

        color: parent.focus? "#50000000": parent.hovered? "#256d77b4": "#50000000"
    }
}
