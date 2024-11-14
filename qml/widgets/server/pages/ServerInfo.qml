import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

import "../models"
import "../delegates"
import "../../../components"
import "../../../"

// Server default info page
ColumnLayout {
    spacing: 6

    // Server info list
    Rectangle {
        id: listBg

        implicitHeight: dataList.implicitHeight + 12

        Layout.fillWidth: true
        Layout.fillHeight: true

        color: "#50000000"

        radius: 6
        clip: true

        ListView {
            id: dataList

            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                margins: 6
            }

            implicitHeight: childrenRect.height

            model: ServerModel {}

            delegate: ServerDelegate {}

            Component.onCompleted: {
                function testings() {
                    if (dataList.model.get(0).type === "list") {
                        dataList.model.clear();
                        dataList.model.append({type: "loader"});

                        serverWidget.opacity = 0;
                        serverWidgetLoader.opacity = 1;
                    }
                }
            }
        }
    }

    // Server buttons
    RowLayout {
        spacing: 6

        LogoButton {
            id: refreshBtn

            text: "Refresh"

            source: "../../assets/images/icons/arrow.triangle.2.circlepath.svg"

            logoAnimate: true

            onReleased: {
                if (dataList.model.get(0).type === "list") {
                    dataList.model.clear();
                    dataList.model.append({type: "loader"});
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

        LogoButton {
            id: restartBtn

            text: "Restart"

            source: "../../assets/images/icons/repeat.circle.fill.svg"

            onReleased: {
                serverStackView.push("ServerLogin.qml", {loginType: "restart"});
            }
        }

        LogoButton {
            id: powerBtn

            text: "Power off"

            source: "../../assets/images/icons/power.circle.fill.on.svg"

            onReleased: {
                serverStackView.push("ServerLogin.qml");
            }
        }
    }
}
