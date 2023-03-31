import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml 2.12
import QtQuick.Window 2.12

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Window {
    id: window

    visible: true
    width: 480
    height: 480
    title: qsTr("Qt Spinner")

    color:"#F1F1F1"





    Rectangle{

        id:loadingPopup

        visible: true
        width: parent.width
        height:parent.height
        color:"transparent"

        Rectangle{

            visible: parent.visible
            width: parent.width
            height:parent.height
            color: "black"
            opacity: 0.4
        }

        MouseArea{
            width: parent.width
            height:parent.height
            enabled: parent.visible
        }

        Rectangle{

            visible: parent.visible
            width: parent.width/3
            height: parent.width/3
            radius: width/8
            anchors.centerIn: parent
            color: "#FFFFFF"
            opacity: 0.8

            BusyIndicator {
                running: parent.visible
                width: parent.width
                height: parent.width
                anchors.centerIn: parent

                style: CustomBusyIndicatorStyle {
                    lines: 42
                    length: 15
                    width: 3
                    radius: 56
                    corner: 1
                    speed: 40
                    trail: 0.51
                    clockWise: true
                    opacity: 1
                    color: "#7B756B"
                    highlightColor: "#0091FF"
                    bgColor: "transparent"
                }
            }

        }

    }

}
