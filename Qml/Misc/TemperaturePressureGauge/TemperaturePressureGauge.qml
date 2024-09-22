import "../../Misc/Util"

import QtQuick 2.0

Item {
    property double radius: 300
    property double engineTemperature: 0
    property double enginePressure: 0

    width: 2 * radius
    height: 2 * radius

    Rectangle {
        width: 2 * radius
        height: 2 * radius
        radius: parent.radius
        clip: true
        color: "#181818"
        scale: 0.775

        TemperatureGauge {
            x: -0.525 * width
            y: 0
            width: parent.width
            height: parent.height
            value: engineTemperature
        }

        PressureGauge {
            x: 0.525 * width
            y: 0
            width: parent.width
            height: parent.height
            value: enginePressure
        }

        GaugeMask {}

        CustomText {
            x: 110 / 300 * parent.radius
            color: "#ffffff"
            text: "°F"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.05 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.8
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 30 / 300 * parent.radius
            width: 40 / 300 * parent.radius
            height: 195 / 300 * parent.radius
            color: "#ffffff"
            text: "TEMP"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Math.max(6, 0.075 * parent.width)
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.8
            wrapMode: Text.Wrap
        }

        CustomText {
            x: 530 / 300 * parent.radius
            width: 40 / 300 * parent.radius
            height: 230 / 300 * parent.radius
            color: "#ffffff"
            text: "PRESS"
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
