import "../../Misc/Util"

import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

CircularGauge {
    id: root
    minimumValue: -0
    maximumValue: 20
    stepSize: 0.001
    value: 0

    property double minimumValueAngle: -125
    property double maximumValueAngle: -55

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: root.minimumValueAngle
        maximumValueAngle: root.maximumValueAngle
        tickmarkStepSize: 2.5
        labelStepSize: 5
        minorTickmarkCount: 0

        labelInset: 0.275 * outerRadius
        tickmarkInset: 0.02 * outerRadius

        tickmark: Rectangle {
            color: "#ffffff"
            width: 0.02 * outerRadius
            height: 0.115 * outerRadius
            radius: 0.01 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            text: styleData.value
            color: "#ffffff"
            font.family: "Century Gothic"
            font.pixelSize: Math.max(6, 0.1 * outerRadius)
            font.weight: Font.Black
            antialiasing: true
        }

        foreground: Item {}

        needle: CustomNeedle {
            width: 0.075 * outerRadius
            height: 0.95 * outerRadius
        }

        background: Item {
            id: background
            width: 2 * outerRadius
            height: 2 * outerRadius

            CustomCanvas {
                anchors.fill: parent
                onPaint: {
                    if (context) {
                        context.reset()
                        context.lineWidth = 7 / 90 * outerRadius
                        context.beginPath()
                        context.arc(outerRadius, outerRadius, outerRadius - tickmarkInset - context.lineWidth / 2,
                                    (valueToAngle(0) - 90) * Math.PI / 180.0, (valueToAngle(11) - 90) * Math.PI / 180.0)
                        context.strokeStyle = "#00c300"
                        context.stroke()
                    }
                }
            }

            CustomText {
                color: "#ffffff"
                x: 0.1 * outerRadius
                y: 1.6 * outerRadius
                text: "GAL"
                font.pixelSize: Math.max(6, 0.05 * parent.width)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            CustomText {
                color: "#ffffff"
                x: 0.145 * outerRadius
                y: 1.725 * outerRadius
                text: "HR"
                font.pixelSize: Math.max(6, 0.05 * parent.width)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
