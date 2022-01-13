import "../../Misc"

import QtQuick 2.0

Item {
    property double radius: 300

    width: 2 * radius
    height: 2 * radius

    Rectangle {
        id: rectangle
        width: 2 * radius
        height: 2 * radius
        radius: parent.radius
        clip: true
        color: "#181818"
        scale: 0.775

        VacGauge {
            x: -0.525 * width
            y: 0
            width: parent.width
            height: parent.height
        }

        AmpGauge {
            x: 0.525 * width
            y: 0
            width: parent.width
            height: parent.height
        }

        GaugeMask {}

        CustomText {
            x: 110 / 300 * parent.radius
            width: 70 / 300 * parent.radius
            height: 90 / 300 * parent.radius
            color: "#ffffff"
            text: "IN. Hg."
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.05 * parent.width)
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            lineHeight: 0.8
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 30 / 300 * parent.radius
            width: 40 / 300 * parent.radius
            height: 195 / 300 * parent.radius
            color: "#ffffff"
            text: "VAC"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 1
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 530 / 300 * parent.radius
            width: 40 / 300 * parent.radius
            height: 230 / 300 * parent.radius
            color: "#ffffff"
            text: "AMP"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 1
            wrapMode: Text.Wrap
        }
    }

    CustomImage {
        anchors.fill: parent
        source: "../../Resources/misc/case.svg"
    }
}


/*##^##
Designer {
    D{i:0;formeditorColor:"#000000"}D{i:2}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:1}D{i:8}
}
##^##*/
