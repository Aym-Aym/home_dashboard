import QtQuick 2.15
import QtQuick.Controls 2.15

RoundButton {
    MouseArea {
        id: mouseArea

        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onPressed: mouse => {
            mouse.accepted = false;
        }
    }
}
