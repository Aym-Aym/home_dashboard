import QtQuick 6.7
import QtQuick.Controls 6.7

// Logo button
RoundButton {
    property bool logoAnimate: false
    property url source: ""
    property color mainColor: "#50000000"
    property color hoveredColor: root.secondaryColor1
    property string ext: ""
    property color textColor: root.mainTextColor

    id: logoButton

    height: btContent.implicitHeight
    width: btContent.implicitWidth
    radius: 6

    hoverEnabled: true

    // Background
    background: Rectangle {
        Behavior on color {
            PropertyAnimation {
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }

        radius: 6

        color: parent.hovered? hoveredColor: mainColor

        clip: true
    }

    // Content
    contentItem: Row {
        id: btContent

        leftPadding: 8
        rightPadding: 8

        spacing: 8

        // Logo
        Image {
            id: logo

            Behavior on rotation {
                NumberAnimation {
                    easing.type: Easing.Linear
                }
            }

            height: 15
            fillMode: Image.PreserveAspectFit

            source: logoButton.source
        }

        // Text
        Text {
            color: textColor

            text: logoButton.text
        }
    }

    // Mouse area for hover animations
    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            if (logoAnimate) {
                logo.rotation = 360;
            }
        }

        onExited: {
            if (logoAnimate) {
                logo.rotation = 0;
            }
        }

        onPressed: mouse => {
            mouse.accepted = false;
        }
    }
}
