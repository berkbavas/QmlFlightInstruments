import "../../Misc/Util"

import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

CircularGauge {
    id: root
    minimumValue: 3
    maximumValue: 7
    stepSize: 0.0001
    value: 0

    property double minimumValueAngle: 135
    property double maximumValueAngle: 45

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: root.minimumValueAngle
        maximumValueAngle: root.maximumValueAngle
        tickmarkStepSize: 1
        labelStepSize: 1
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
                        context.lineWidth = 0.075 * outerRadius
                        context.beginPath()
                        context.arc(outerRadius,
                                    outerRadius,
                                    outerRadius - tickmarkInset - context.lineWidth / 2 - 0.015 * outerRadius,
                                    (valueToAngle(5.5) - 90) * Math.PI / 180.0, (valueToAngle(4.5) - 90) * Math.PI / 180.0,
                                    false)
                        context.strokeStyle = "#00c300"
                        context.stroke()
                    }
                }
            }
        }
    }
}
