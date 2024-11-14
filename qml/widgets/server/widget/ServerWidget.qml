import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../../../components/"

// Server widget component
Item {
    id: serverWidget

    property bool widget_open: false

    MouseArea {
        anchors.fill: parent
        enabled: root.mouseAreasStatus

        onReleased: {
            popup.url = "../widgets/server/pages/Server.qml";
            popup.open();
        }
    }

    // Logo
    Image {
        anchors {
            topMargin: 0
            bottomMargin: 0
            left: parent.left
            leftMargin: 35
            verticalCenter: parent.verticalCenter
        }
        width: 45
        fillMode: Image.PreserveAspectFit

        source: "../../../../assets/images/icons/server_status.svg";
    }

    // Title
    Text {
        id: serverTitle

        anchors {
            verticalCenter: parent.verticalCenter
            left: currentStatus.left
            leftMargin: 0
            verticalCenterOffset: -17
        }

        color: root.mainTextColor

        text: "AYMSERVER"

        font {
            pointSize: 18
            styleName: "Light"
        }
    }

    Text {
        id: currentStatus

        anchors {
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: 3
            horizontalCenter: parent.horizontalCenter
        }

        color: root.secondaryTextColor

        text: "Status: <font color='lime'>ONLINE</font>"

        font.pointSize: 12
    }

    Text {
        id: currentUptime

        anchors {
            verticalCenter: parent.verticalCenter
            left: currentStatus.left
            verticalCenterOffset: 20
            leftMargin: 0
        }

        color: root.secondaryTextColor

        text: "Uptime: 2d, 03:15:42"

        font.pointSize: 12
    }
}
