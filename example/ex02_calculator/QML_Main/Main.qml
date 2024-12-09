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
                id: input1; Layout.fillWidth: true; focus: true
            }
            Label {
                text: " + "
            }
            TextField {
                id: input2; Layout.fillWidth: true;
            }
            Button {
                text: "Calcuation"
                onClicked:{
                    root.val = input1.text.trim() + "," + input2.text.trim()
                    root.jsCall(root.val)
                }
            }
        }

        Item {
            Layout.fillWidth: true; Layout.fillHeight: true;
            Rectangle {
                anchors.fill: parent
                //opacity: 투명값 ex) 0.2: 20%
                color: "gray"; opacity: 0.2; radius: 5
                border.color: Qt.darker(color)
            }
            ScrollView {
                id: scrollView; anchors.fill: parent; 
                anchors.margins: 9
                ListView {
                    id: resultView
                    model: ListModel {
                        id: outputModel
                    }
                    delegate: ColumnLayout {
                        width: ListView.view.width
                        Label {
                            Layout.fillWidth: true; color: "green"; text: "> " + model.expression
                        }
                        Label {
                            Layout.fillWidth: true; color: "blue"; text: "= " + model.result
                        }
                        Rectangle {
                            height: 1; Layout.fillWidth: true; color: "gray"; opacity: 0.2
                        }
                    }
                }
            }
        } //Item
    } //ColumnLayout

    function jsCall(exp){
        var data = JUtils.addCall(exp)
        outputModel.insert(0, data)
    }
    
}