import QtQuick

Window {
    visible: true; id: root; width: 400; height: 300; color: "black"
    
    property date today: new Date()
    property int daysInMonth: new Date(today.getYear(),        // 1900년 도부터 현재 2020 이면 120
                                       today.getMonth() + 1,   // getMonth()는 1월이 0, 3월이면 1을 더함.
                                       0).getDate()            // 1일은 1부터 시작
    property date showDate: new Date()

    // 일:0, 월:1, 화:2, 수:3, 목:4, 금:5, 토:6 값 중 하나를 리턴, 예) 수요일이면 3
    property int firstDay: new Date(showDate.getFullYear(), showDate.getMonth(), 1).getDay()

    Item {
        id: title; anchors.top: parent.top; anchors.topMargin: 10; width: parent.width
        height: 30
        Image {
            source: "./images/left.png"; anchors.left: parent.left; anchors.leftMargin: 10
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.getFullYear(), showDate.getMonth(), 0)
            }
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            color: "white";  text: Qt.formatDateTime(showDate, "M월")
            font.pointSize: 14
            font.bold: true
        }
        Image {
            source: "./images/right.png"; anchors.right: parent.right; anchors.rightMargin: 10
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.getFullYear(), showDate.getMonth() + 1, 1)
            }
        }
    }

    function isToday(idx) {
        if(today.getFullYear() != showDate.getFullYear())
            return false;
        if(today.getMonth() != showDate.getMonth())
            return false;

        return ( idx === today.getDate() - 1 )
    }

    Item {
        id: dayLabels
        anchors.top: title.bottom; anchors.left: parent.left; anchors.right: parent.right
        anchors.margins: 10
        Grid {
            id: grid; columns: 7; rows: 6; spacing: 10
            Repeater {
                model: firstDay + daysInMonth
                Rectangle {
                    color: {
                        if(index < firstDay)
                            root.color
                        else
                            isToday(index - firstDay) ? "yellow" : "white"
                    }
                    width: 45; height: 38
                    Text {
                        anchors.centerIn: parent; text: index + 1 - firstDay
                        opacity: (index < firstDay) ? 0.0 : 1.0
                        font.bold: isToday(index)
                    }
                }
            }
        }
    }
}