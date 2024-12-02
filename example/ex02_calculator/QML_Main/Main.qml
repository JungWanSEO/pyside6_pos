import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "js/lib.js" as JUtils

Window {
    id: root; visible: true; width: 300; height: 300
    title: "Calculator Example"
    property string val: ""
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 9
        RowLayout {
            Layout.fillWidth: true
            TextField {
                id: input1; Layout.fillWidth: true
            }
        }
    }
    
}