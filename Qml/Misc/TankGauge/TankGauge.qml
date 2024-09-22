import "../../Misc/Util"

import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    property double radius: 300
    property double leftTankFuel: 0
    property double rightTankFuel: 0

    Rectangle {
        width: 2 * radius
        height: 2 * radius
        radius: parent.radius
        clip: true
        color: "#181818"
        scale: 0.775

        LeftTankGauge {
            x: -0.55 * width
            y: 0
            width: parent.width
            height: parent.height
            value: leftTankFuel
        }

        RightTankGauge {
            x: 0.55 * width
            y: 0
            width: parent.width
            height: parent.height
            value: rightTankFuel
        }

        CustomText {
            y: 20
            text: "FULL"
            font.pixelSize: Math.max(6, 0.1 * parent.width)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomText {
            y: 450 / 300 * parent.radius
            height: 20 / 300 * parent.radius
            text: "GALLONS"
            anchors.left: qtyText.left
            anchors.right: qtyText.right
            color: "#ffffff"
            font.pixelSize: Math.max(6, 0.04 * parent.width)
            horizontalAlignment: Text.AlignHCenter
        }

        CustomText {
            id: qtyText
            y: 510 / 300 * parent.radius
            color: "#ffffff"
            text: "QTY"
            font.pixelSize: Math.max(6, 0.1 * parent.width)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        GaugeMask {}

        CustomText {
            x: 30 / 300 * parent.radius
            width: 30 / 300 * parent.radius
            height: 195 / 300 * parent.radius
            color: "#ffffff"
            text: "LEFT"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.8
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 540 / 300 * parent.radius
            width: 30 / 300 * parent.radius
            height: 230 / 300 * parent.radius
            color: "#ffffff"
            text: "RIGHT"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.8
            wrapMode: Text.Wrap
        }
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/misc/case.svg"
    }
}
