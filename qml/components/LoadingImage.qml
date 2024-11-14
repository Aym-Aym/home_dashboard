import QtQuick 6.7

// Infinit loading image
Item {
    anchors.fill: parent

    Image {
        property int stepAngle: 45
        property int maxAngle: 360
        property int currentAngle: 0

        id: reloadIcon

        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        width: 30
        height: 30

        source: "../../assets/images/reload.svg"

        // Timer for infinit animation
        Timer {
            id: rotationTimer

            interval: 50
            repeat: true
            running: true

            onTriggered: {
                reloadIcon.currentAngle = (reloadIcon.currentAngle + reloadIcon.stepAngle) % reloadIcon.maxAngle;
                reloadIcon.rotation = reloadIcon.currentAngle;
            }
        }
    }
}
