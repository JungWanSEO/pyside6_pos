import QtQuick

Window {
    id: rotation
    width: 512; height: 320; visible: true; title: "바람개비 예제"
    color: "#D8D8D8"
    property int rotationStep: 90
    BorderImage {
        source: "images/background.png"
    }
    Image {
        id: pole
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        source: "images/stick.png"
    }
    Image {
        id: wheel
        anchors.centerIn: parent
        source: "images/wheel.png"
        Behavior on rotation {
            NumberAnimation{
                duration: 250
            }
        }

    }
    MouseArea {   
        anchors.fill: parent
        onPressed: {
            wheel.rotation += rotationStep
        }  
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onLeftPressed: {
            wheel.rotation -= rotation.rotationStep
        }
        Keys.onRightPressed: {
            wheel.rotation += rotation.rotationStep
        }
    }
} 