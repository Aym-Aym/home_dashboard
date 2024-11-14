import QtQuick 6.7
import QtQuick.Window 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes 2.15

import "widgets/thermostat/widget"
import "widgets/weather/widget"
import "widgets/server/widget"
import "components"
import "."

Item {
    Image {
        id: contentBg

        x: 83
        y: 0
        fillMode: Image.PreserveAspectFit

        source: "../assets/images/content_bg.png"

        // Main dashboard layout
        ColumnLayout {
            id: mainLayout

            property string shadowColor: "#25000000"
            property int shadowVerticalOffset: 5

            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 46
                topMargin: 59
            }

            // Top row widgets
            RowLayout {
                layoutDirection: Qt.LeftToRight
                spacing: 19

                Layout.fillHeight: false
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                // Server widget
                Item {
                    id: serverWidget

                    implicitWidth: 346
                    implicitHeight: 96

                    Image {
                        id: serverBg

                        fillMode: Image.PreserveAspectFit

                        source: "../assets/images/server_bg.png"

                        Rectangle {
                            anchors.fill: parent
                            bottomLeftRadius: 12
                            bottomRightRadius: 12
                            topRightRadius: 12
                            topLeftRadius: 36

                            color: root.transparentColor

                            ServerWidget{
                                id: serverWidgetComponent

                                anchors.fill: parent

                                opacity: 1
                            }
                        }
                    }

                    DropShadow {
                        anchors.fill: serverBg
                        horizontalOffset: 0
                        verticalOffset: mainLayout.shadowVerticalOffset
                        radius: 10

                        color: mainLayout.shadowColor

                        source: serverBg

                        samples: 17
                    }
                }

                // Weather widget
                Item {
                    id: weatherWidget

                    implicitWidth: childrenRect.width
                    implicitHeight: childrenRect.height

                    Image {
                        id: weatherBg

                        fillMode: Image.PreserveAspectFit

                        source: "../assets/images/weather_bg.png"

                        Weather {}
                    }

                    DropShadow {
                        anchors.fill: weatherBg
                        horizontalOffset: 0
                        verticalOffset: mainLayout.shadowVerticalOffset
                        radius: 10

                        color: mainLayout.shadowColor

                        source: weatherBg

                        samples: 17
                    }
                }

                // Time widget
                Item {
                    width: 147

                    Layout.topMargin: 16
                    Layout.leftMargin: 13
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    ColumnLayout {
                        Text {
                            id: timeTxt

                            horizontalAlignment: Text.AlignLeft

                            color: root.mainTextColor

                            text: qsTr("05:58PM")

                            font {
                                styleName: "Thin"
                                pointSize: 35
                            }
                        }

                        Text {
                            id: dateTxt

                            horizontalAlignment: Text.AlignLeft
                            Layout.topMargin: -3
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                            color: root.secondaryTextColor

                            text: qsTr("Saturday, September 23")

                            font {
                                styleName: "Light"
                                pointSize: 12
                            }
                        }
                    }
                }
            }

            // Mid row widgets
            RowLayout {
                layoutDirection: Qt.LeftToRight

                Layout.topMargin: 46
                Layout.fillHeight: false
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                spacing: 19

                // Thermostat widget
                Thermostat {
                    id: thermostatWidget

                       DropShadow {
                           anchors.fill: thermostatWidget
                           horizontalOffset: 0
                           verticalOffset: mainLayout.shadowVerticalOffset
                           radius: 10

                           color: mainLayout.shadowColor

                           source: thermostatWidget

                           samples: 17
                       }
                }

                // Sensor widget
                Item {
                    id: sensorsWidget

                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                    implicitWidth: childrenRect.width
                    implicitHeight: childrenRect.height

                    Image {
                        id: sensorsBg

                        fillMode: Image.PreserveAspectFit

                        source: "../assets/images/home_sensors_bg.png"
                    }

                    DropShadow {
                        anchors.fill: sensorsBg
                        horizontalOffset: 0
                        verticalOffset: mainLayout.shadowVerticalOffset
                        radius: 10

                        color: mainLayout.shadowColor

                        source: sensorsBg

                        samples: 17
                    }
                }

                // Wifi widget
                Item {
                    id: wifiDevicesWidget

                    implicitWidth: childrenRect.width
                    implicitHeight: childrenRect.height

                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                    Image {
                        id: wifiDevicesBg

                        fillMode: Image.PreserveAspectFit

                        source: "../assets/images/wifi_devices_bg.png"
                    }

                    DropShadow {
                        anchors.fill: wifiDevicesBg
                        horizontalOffset: 0
                        verticalOffset: mainLayout.shadowVerticalOffset
                        radius: 10

                        color: mainLayout.shadowColor

                        source: wifiDevicesBg

                        samples: 17
                    }
                }
            }
        }
    }

    // Popups
    CustomPopup {
        id: popup
    }
}
