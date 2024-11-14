import QtQuick 6.7
import QtQuick.Controls 6.7

Window {
    id: root

    property bool mouseAreasStatus: true
    property bool dev: true
    property color transparentColor: "#00000000"
    property color mainTextColor: "#fff"
    property color secondaryTextColor: "#7b7d7f"
    property color secondaryColor1: "#3a4ec4"
    property color secondaryColor2 : "#e8b261"

    width: 1194
    height: 834
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    color: "#000"
    visible: true

    // Main background
    Image {
        id: windowBg

        x: -4
        y: 0
        source: "../assets/images/bg.svg"
        fillMode: Image.PreserveAspectFit

        Loader {
            id: dashboard

            Behavior on opacity {
                PropertyAnimation {
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }

            anchors.fill: parent

            opacity: dev? 1: 0
            active: dev? true: false

            source: "Dashboard.qml"
        }
    }

    // Loading screen
    Rectangle {
        id: loadingScreen

        anchors.fill: parent

        color: root.transparentColor

        enabled: dev? false: true
        visible: dev? false: true

        Component.onCompleted: {
            loadingTimer.start();
        }

        // Title
        Text {
            id: loadingScreenTxt

            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            color: root.mainTextColor

            text: "AymDashboard"

            font {
                styleName: "Thin"
                pointSize: 30
            }
        }

        // Loading bars
        Rectangle {
            id: loadingBar2

            PropertyAnimation on width {
                id: loadingAnimation2
                from: 1
                to: loadingBar2.width
                duration: 3000
                running: true
            }

            anchors {
                right: loadingScreenTxt.right
                top: loadingBar1.bottom
                topMargin: 2
            }

            width: 170
            height: 1

            color: root.secondaryColor2
        }

        Rectangle {
            id: loadingBar1

            PropertyAnimation on width {
                id: loadingAnimation
                from: 1
                to: loadingBar1.width
                duration: 3000
                running: true
            }

            anchors {
                left: loadingScreenTxt.left
                top: loadingScreenTxt.bottom
                topMargin: 5
            }

            width: 170
            height: 1

            color: root.secondaryColor1
        }

        // Loading percentage
        Text {
            anchors {
                top: loadingBar1.bottom
                topMargin: 5
                horizontalCenter: loadingScreenTxt.horizontalCenter
            }

            text: Math.round((loadingBar1.width * 100) / 170) + "%"
            color: "#fff"
        }

        // Timer for transition to dashboard
        Timer {
            id: loadingTimer

            interval: 3000
            repeat: false

            onTriggered: {
                dashboard.active = true;
                dashboard.opacity = 1;
                loadingScreen.visible = false;
                loadingScreen.enabled = false;
            }
        }
    }
}
