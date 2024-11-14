import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import QtQuick.Controls.Basic

import "../../../components"

// Server login page
Item {
    property string loginType: "powerOff"

    signal serverLoading()

    Item {
        anchors {
            right: parent.right
            rightMargin: 30
            left: parent.left
            leftMargin: 30
            top: parent.top
            topMargin: 10
        }

        ColumnLayout {
            spacing: 6

            anchors {
                left: parent.left
                right: parent.right
            }

            // Title
            Item {
                implicitWidth: childrenRect.width
                implicitHeight: childrenRect.height

                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 10

                Image {
                    id: credentialLogo

                    width: 13
                    fillMode: Image.PreserveAspectFit

                    source: "../../../../assets/images/icons/person.badge.key.svg"
                }

                Text {
                    id: credentialTxt

                    anchors {
                        left: credentialLogo.right
                        leftMargin: 4
                    }
                    horizontalAlignment: Text.AlignLeft


                    color: root.mainTextColor

                    text: qsTr("CREDENTIALS")

                    font {
                        styleName: "Light"
                        pointSize: 12
                    }
                }
            }

            // Text inputs
            ColumnLayout {
                spacing: 2

                CustomTextField {
                    placeholderText: "Username"

                    Layout.fillWidth: true
                    Layout.maximumHeight: 25

                    font.pixelSize: 12
                }

                CustomTextField {
                    echoMode: TextInput.Password
                    placeholderText: "Password"

                    Layout.fillWidth: true
                    Layout.maximumHeight: 25
                }
            }

            // Buttons
            RowLayout {
                Item { Layout.fillWidth: true }

                LogoButton {
                    id: cancelBtn

                    text: "Cancel"

                    source: "../../assets/images/icons/chevron.backward.circle.fill.svg"

                    onReleased: {
                        serverStackView.pop();
                    }
                }

                LogoButton {
                    id: cmdBtn

                    text: "Power off"

                    source: "../../assets/images/icons/power.circle.fill.on.svg"

                    Component.onCompleted: {
                        if (loginType == "restart") {
                            cmdBtn.source = "../../assets/images/icons/repeat.circle.fill.svg";
                            cmdBtn.text = "Reboot";
                        }
                    }

                    onReleased: {
                        serverStackView.pop();
                        serverLoading();
                    }
                }
            }
        }
    }
}
