import QtQuick 2.0


Rectangle{
    color: "green"
    TabWidget {
        id: tabs
        width: 300
        height: 500

        Material{
            property string title: "素材库"
            width: parent.width
            height: parent.height
            //opacity: 0

            //color:"#2F2F2F"
        }

        Rectangle {
            property string title: "Red"
            anchors.fill: parent
            color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent; anchors.margins: 20
                color: "#ff7f7f"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                    text: "Roses are red"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }

            }

        }

        Rectangle {
            property string title: "Green"
            anchors.fill: parent
            color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent; anchors.margins: 20
                color: "#7fff7f"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                    text: "Flower stems are green"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }
            }
        }

        Rectangle {
            property string title: "Blue"
            anchors.fill: parent; color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent; anchors.margins: 20
                color: "#7f7fff"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                    text: "Violets are blue"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
    Rectangle{
        id:demo
        width: 50
        height: 30
        color: "red"
        Drag.active: area.drag
        z:5
        MouseArea{
            id:area
            anchors.fill: parent
            drag.target: parent

        }
    }
}



