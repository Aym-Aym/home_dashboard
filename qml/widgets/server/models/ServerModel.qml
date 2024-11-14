import QtQuick 6.7

ListModel {
    id: serverModel

    ListElement {
        type: "list"
        name: "Status"
        value: "<font color='lime'>ONLINE</font>"
    }

    ListElement {
        type: "list"
        name: "Uptime"
        value: "2d, 03:15:42"
    }

    ListElement {
        type: "list"
        name: "Ip"
        value: "192.168.1.60"
    }

    ListElement {
        type: "list"
        name: "Mac address"
        value: "XX:XX:XX:XX:XX"
    }

    ListElement {
        type: "list"
        name: "Disk0"
        value: "150.00G/1T"
    }

    ListElement {
        type: "list"
        name: "Disk1"
        value: "250.00G/1T"
    }
}
