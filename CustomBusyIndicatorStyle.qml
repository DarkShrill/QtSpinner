import QtQuick 2.3
import QtQuick.Controls.Styles 1.2

BusyIndicatorStyle {
    id: style
    property int lines: 11
    property real length: 10 // % of the width of the control
    property real width: 5 // % of the height of the control
    property real radius: 13 // % of the width of the control
    property real corner: 1 // between 0 and 1
    property real speed: 100 // smaller is faster
    property real trail: 0.6 // between 0 and 1
    property bool clockWise: true

    property real opacity: 0.7
    property string color: "#7B756B"
    property string highlightColor: "white"
    property string bgColor: "black"

    indicator: Rectangle {
        color: style.bgColor
        visible: control.running
        Repeater {
            id: repeat
            model: style.lines
            Rectangle {
                property real factor: control.width / 200
                color: style.color
                opacity: style.opacity
                Behavior on color {
                    ColorAnimation {
                        from: style.highlightColor
                        duration: style.speed * style.lines * style.trail
                    }
                }
                radius: style.corner * height / 2
                width: style.length * factor
                height: style.width * factor
                x: control.width / 2 + style.radius * factor
                y: control.height / 2 - height / 2
                transform: Rotation {
                    origin.x: -style.radius * factor
                    origin.y: height / 2
                    angle: index * (360 / repeat.count)
                }
                Timer {
                    id: reset
                    interval: style.speed * (style.clockWise ? index : style.lines - index)
                    onTriggered: {
                        parent.opacity = 1
                        parent.color = style.highlightColor
                        reset2.start()
                    }
                }
                Timer {
                    id: reset2
                    interval: style.speed
                    onTriggered: {
                        parent.opacity = style.opacity
                        parent.color = style.color
                    }
                }
                Timer {
                    id: globalTimer // for a complete cycle
                    interval: style.speed * style.lines
                    onTriggered: {
                        reset.start()
                    }
                    triggeredOnStart: true
                    repeat: true
                }
                Component.onCompleted: {
                    globalTimer.start()
                }
            }
        }
    }
}
