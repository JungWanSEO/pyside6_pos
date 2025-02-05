import QtQuick

Window {
    visible: true
    width: Screen.width
    height: Screen.height
    Flickable {
        width: Screen.width; height: Screen.height
        contentWidth: Screen.width
        contentHeight: Screen.height * 2
        interactive : true
        Image {
            id: ground
            anchors.fill: parent
            source: "images/ground.jpg"
            sourceSize.width: Screen.width
            sourceSize.height: Screen.height * 2
        }
        Image {
            id: player
            source: "images/player.png"
            x: Screen.width / 2
            y: Screen.height / 2
        }
    }
}