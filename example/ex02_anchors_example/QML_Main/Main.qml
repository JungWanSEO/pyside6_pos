import QtQuick

Window {
    visible: false; width: 400; height: 200; title: "anchors example"
    FontLoader {
        id: myFont
        source: "fonts/NanumGothic.ttf"
    }
    Rectangle {
        width: 400; height: 200;
        Image {
            source: "images/bluebackground.png"
        }
        BorderImage {
            source: "images/bluebutton.png"
            border: {
                left: 13; top: 13; right: 13; bottom: 13;
            }
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15
            width: 350; height: 75
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.verticalCenter: parent.verticalCenter
                source: "images/login.png"
            }
            Text {
                anchors.centerIn: parent
                text: "Login"
                font.family: myFont.name; font.bold: true; color: "white"; font.pixelSize: 12
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Chicked!!")
                }
            }
        }
    }
}