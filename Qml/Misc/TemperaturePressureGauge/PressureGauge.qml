import "../../Misc/Util"

import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

CircularGauge {
    id: root
    minimumValue: 0
    maximumValue: 115
    stepSize: 0.1
    value: 0

    property double minimumValueAngle: -135
    property double maximumValueAngle: -45

    style: CircularGaugeStyle {
        id: style

        property double tickmarkHeight: 0.115 * outerRadius

        minimumValueAngle: root.minimumValueAngle
        maximumValueAngle: root.maximumValueAngle
        tickmarkStepSize: 5
        labelStepSize: 5
        minorTickmarkCount: 0

        labelInset: 0.275 * outerRadius
        tickmarkInset: 0.02 * outerRadius

        tickmark: Rectangle {
            color: styleData.value === 115 || styleData.value === 20 ? "#e30000" : "#ffffff"
            width: 0.02 * outerRadius
            height: style.tickmarkHeight
            radius: 0.01 * outerRadius
            antialiasing: true
            visible: styleData.value === 0 ||
                     styleData.value === 20 ||
                     styleData.value === 40 ||
                     styleData.value === 60 ||
                     styleData.value === 80 ||
                     styleData.value === 100 ||
                     styleData.value === 115
        }

        tickmarkLabel: Text {
            text: styleData.value
            color: "#ffffff"
            font.family: "Century Gothic"
            font.pixelSize: Math.max(6, 0.1 * outerRadius)
            font.weight: Font.Black
            antialiasing: true
            visible: styleData.value === 0 ||
                     styleData.value === 20 ||
                     styleData.value === 60 ||
                     styleData.value === 100 ||
                     styleData.value === 115
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
                                    outerRadius - tickmarkInset - context.lineWidth / 2,
                                    (valueToAngle(90) - 90) * Math.PI / 180.0,
                                    (valueToAngle(50) - 90) * Math.PI / 180.0, true)
                        context.strokeStyle = "#00c300"
                        context.stroke()
                    }
                }
            }
        }
    }
}
