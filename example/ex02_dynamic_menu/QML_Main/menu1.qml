import QtQuick

Rectangle {
    width: 400; height: 300
    color: "blue"
    FontLoader{
        id: myFont; source: "./fonts/NanumGothic.ttf"
    }
    Text{
        anchors.centerIn: parent
        text: "Menu 1"
        font.family: myFont.name
        font.bold: true; font.pixelSize: 30
        color: "white"
    }
}
