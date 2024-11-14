import QtQuick 6.7
import QtQuick.Controls 6.7
import Qt5Compat.GraphicalEffects

// Custom popup
Rectangle {
    id: customPopup

    property int widgetWidth: 346
    property int widgetHeight: 96
    property double widgetPosX: 125
    property double widgetPosY: 60
    property url url: ""

    width: root.width
    height: root.height

    color: "#95000000"
    opacity: 0

    Behavior on opacity {
        PropertyAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    // Custom function to open the popup
    function open() {
        popupContent.open();
        opacity = 1;
    }

    // Custom function to close the popup
    function close() {
        popupContent.close();
        opacity = 0;
    }

    // Popup content
    Popup {
        id: popupContent

        x: (root.width/2) - (width/2)
        y: (root.height/2) - (height/2)

        margins: 0
        padding: 6

        // Background content
        background: Item {
            id: popupBg

            Image {
                id: topLeftBg
                anchors {
                    top: parent.top
                    left: parent.left
                }
                source: "../../assets/images/generic_bg_topleft.png"
            }

            Image {
                id: leftBg
                height: parent.height - topLeftBg.height - bottomleftBg.height
                anchors {
                    top: topLeftBg.bottom
                    left: parent.left
                }
                source: "../../assets/images/generic_bg_left.png"
            }

            Image {
                id: bottomleftBg
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }
                source: "../../assets/images/generic_bg_bottomleft.png"
            }

            Image {
                id: bottomBg
                width: parent.width - bottomleftBg.width - bottomRightBg.width
                anchors {
                    bottom: parent.bottom
                    left: bottomleftBg.right
                }
                source: "../../assets/images/generic_bg_bottom.png"
            }

            Image {
                id: bottomRightBg
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                }
                source: "../../assets/images/generic_bg_bottomright.png"
            }

            Image {
                id: rightBg
                height: parent.height - bottomRightBg.height - topRightBg.height
                anchors {
                    bottom: bottomRightBg.top
                    right: parent.right
                }
                source: "../../assets/images/generic_bg_right.png"
            }

            Image {
                id: topRightBg
                anchors {
                    top: parent.top
                    right: parent.right
                }
                source: "../../assets/images/generic_bg_topright.png"
            }

            Image {
                id: topBg
                width: parent.width - topRightBg.width - topLeftBg.height
                anchors {
                    top: parent.top
                    right: topRightBg.left
                }
                source: "../../assets/images/generic_bg_top.png"
            }

            Image {
                id: centerBg
                width: parent.width - topRightBg.width - topLeftBg.height
                height: parent.height - bottomRightBg.height - topRightBg.height
                anchors {
                    top: topBg.bottm
                    left: leftBg.right
                    right: rightBg.left
                    bottom: bottomBg.top
                }
                source: "../../assets/images/generic_bg_center.png"
            }
        }

        // Content
        contentItem: Loader {
            id: loader

            source: customPopup.url


            // Close button
            RoundButton {
                width: 20
                height: 20

                radius: 10

                anchors {
                    top: parent.top
                    topMargin: -(this.width/2) - (popupContent.padding)
                    right: parent.right
                    rightMargin: -(this.height/2) - (popupContent.padding)
                }

                background: Image {
                    source: "../../assets/images/icons/xmark.circle.fill.svg"
                }

                onReleased: {
                    popupContent.close();
                }
            }
        }

        // Transition animation on opening
        enter:  Transition {
            NumberAnimation {
                property: "width"
                from: customPopup.widgetWidth; to: loader.implicitWidth + 12
                duration: 150
            }
            NumberAnimation {
                property: "height"
                from: customPopup.widgetHeight; to: loader.implicitHeight + 12
                duration: 150
            }
            NumberAnimation {
                property: "x"
                from: customPopup.widgetPosX; to: (root.width/2) - ((loader.implicitWidth + 12)/2)
                duration: 150
            }
            NumberAnimation {
                property: "y"
                from: customPopup.widgetPosY; to: (root.height/2) - ((loader.implicitHeight + 12)/2)
                duration: 150
            }
            NumberAnimation {
                property: "opacity"
                from: 0; to: 1
                duration: 50
            }
        }

        // Transition animation on closing
        exit: Transition {
            NumberAnimation {
                property: "width"
                from: loader.implicitWidth + 12; to: customPopup.widgetWidth
                duration: 150
            }
            NumberAnimation {
                property: "height"
                from: loader.implicitHeight + 12; to: customPopup.widgetHeight
                duration: 150
            }
            NumberAnimation {
                property: "x"
                from:  (root.width/2) - ((loader.implicitWidth + 12)/2); to: customPopup.widgetPosX
                duration: 150
            }
            NumberAnimation {
                property: "y"
                from: (root.height/2) - ((loader.implicitHeight + 12)/2); to: customPopup.widgetPosY
                duration: 150
            }
            NumberAnimation {
                property: "opacity"
                from: 1; to: 0
                duration: 150
            }
        }

        onOpened: {
            root.mouseAreasStatus = false;
        }

        onClosed: {
            customPopup.opacity = 0;
            root.mouseAreasStatus = true;
            loader.active = false;
            loader.source = customPopup.url;
            loader.active = true;
        }
    }
}
