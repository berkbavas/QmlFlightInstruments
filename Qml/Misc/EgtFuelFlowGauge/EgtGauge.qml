import "../../Misc/Util"

import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

CircularGauge {
    id: root
    minimumValue: 700
    maximumValue: 1900
    stepSize: 1
    value: 0

    property double minimumValueAngle: 125
    property double maximumValueAngle: 55

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: root.minimumValueAngle
        maximumValueAngle: root.maximumValueAngle
        tickmarkStepSize: 75
        labelStepSize: 1000
        minorTickmarkCount: 0

        labelInset: 0.25 * outerRadius
        tickmarkInset: 0.02 * outerRadius

        tickmark: Rectangle {
            color: "#ffffff"
            width: 0.02 * outerRadius
            height: 0.115 * outerRadius
            radius: 0.01 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Item {}

        foreground: Item {}

        needle: CustomNeedle {
            width: 0.075 * outerRadius
            height: 0.95 * outerRadius
        }

        background: Item {
            id: background
            width: 2 * outerRadius
            height: 2 * outerRadius

            CustomText {
                color: "#ffffff"
                x: 1.6 * outerRadius
                y: 1.6 * outerRadius
                text: "25 °C"
                font.pixelSize: Math.max(6, 0.05 * parent.width)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            CustomText {
                color: "#ffffff"
                x: 1.63 * outerRadius
                y: 1.725 * outerRadius
                text: "DIV"
                font.pixelSize: Math.max(6, 0.05 * parent.width)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
