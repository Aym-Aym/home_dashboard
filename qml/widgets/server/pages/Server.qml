import QtQuick 6.7
import QtQuick.Layouts 6.7
import QtQuick.Controls 6.7
import Qt5Compat.GraphicalEffects

import "../models"
import "../delegates"

// Server main page
Item {
    id: serverItem

    implicitWidth: 500
    implicitHeight: childrenRect.height

    clip: true

    // Server page title
    Item {
        id: title

        anchors.horizontalCenter: parent.horizontalCenter
        height: childrenRect.height

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 10
            padding: 10

            Image {
                width: 20
                fillMode: Image.PreserveAspectFit

                source: "../../../../assets/images/icons/server_status.svg"
            }

            Text {
                horizontalAlignment: Text.AlignLeft

                color: root.mainTextColor

                text: qsTr("AYMSERVER")

                font {
                    styleName: "Light"
                    pointSize: 20
                }
            }
        }
    }

    // Server stack pages
    StackView {
        id: serverStackView

        implicitHeight: 100
        height: page.height

        anchors {
            top: title.bottom
            left: parent.left
            right: parent.right
        }

        initialItem: ServerInfo {
            id: page
        }
    }
}
