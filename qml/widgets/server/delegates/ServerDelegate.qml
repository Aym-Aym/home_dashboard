import QtQuick 6.7
import QtQuick.Layouts 6.7
import Qt.labs.qmlmodels

import "../../../components/"
import "../../../"

// Delegate chooser for the Server info list
DelegateChooser {
    role: "type"

    // List delegate type
    DelegateChoice {
        roleValue: "list"

        Rectangle {
            id: selectionColor

            Behavior on color {
                PropertyAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }

            width: dataList.width
            height: 20

            radius: 2

            color: index % 2? "#50000000": root.transparentColor

            // Mouse area for hover color change on list items
            MouseArea {
                anchors.fill: parent

                hoverEnabled: true

                onEntered: {
                    parent.color = root.secondaryColor1;
                    nameTxt.color = root.mainTextColor;
                }

                onExited: {
                    parent.color = index % 2? "#50000000": root.transparentColor;
                    nameTxt.color = root.secondaryTextColor;
                }

                RowLayout {
                    anchors.fill: parent

                    Text {
                        id: nameTxt

                        Behavior on color {
                            PropertyAnimation {
                                duration: 250
                                easing.type: Easing.InOutQuad
                            }
                        }

                        Layout.alignment: Qt.AlignLeft
                        Layout.leftMargin: 10

                        color: root.secondaryTextColor

                        text: name
                    }

                    Text {
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin: 10

                        color: root.mainTextColor

                        text: value
                    }
                }
            }
        }
    }

    // Reload list delegate
    DelegateChoice {
        roleValue: "loader"

        LoadingImage {
            Component.onCompleted: {
                loadingTimer.start()
            }

            Timer {
                id: loadingTimer
                interval: 3000
                repeat: false

                onTriggered: {
                    dataList.model.clear();
                    dataList.model = Qt.createComponent("../../models/server/ServerModel.qml").createObject();
                }
            }
        }
    }
}
