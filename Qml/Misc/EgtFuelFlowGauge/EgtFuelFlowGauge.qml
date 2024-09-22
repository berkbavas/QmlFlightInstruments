import "../../Misc/Util"

import QtQuick 2.0

Item {
    property double radius: 300

    width: 2 * radius
    height: 2 * radius

    property double egt: 0
    property double fuelFlow: 0

    Rectangle {
        width: 2 * radius
        height: 2 * radius
        radius: parent.radius
        clip: true
        color: "#181818"
        scale: 0.775

        EgtGauge {
            x: -0.525 * width
            y: 0
            width: parent.width
            height: parent.height
            value: egt
        }

        FuelFlowGauge {
            x: 0.525 * width
            y: 0
            width: parent.width
            height: parent.height
            value: fuelFlow
        }

        GaugeMask {}

        CustomText {
            x: 30 / 300 * parent.radius
            width: 40 / 300 * parent.radius
            height: 195 / 300 * parent.radius
            color: "#ffffff"
            text: "EGT"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 1
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 530 / 300 * parent.radius
            width: 20 / 300 * parent.radius
            height: 230 / 300 * parent.radius
            color: "#ffffff"
            text: "FUEL"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.05 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 1
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 560 / 300 * parent.radius
            width: 30 / 300 * parent.radius
            height: 230 / 300 * parent.radius
            color: "#ffffff"
            text: "F LOW"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.05 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 1
            wrapMode: Text.Wrap
        }
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/misc/case.svg"
    }
}
