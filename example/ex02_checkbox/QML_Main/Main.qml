import QtQuick
import "content" as MyContent

Window {
    id: root; visible: true; width: 250; height: 100
    color: "lightblue"
    MyContent.NewCheckBox {
        anchors.centerIn: parent
        onMyChecked: (checkValue) => {
            if(checkValue)
                root.color = "red"
            else
                root.color = "lightblue"
        }
    }
}