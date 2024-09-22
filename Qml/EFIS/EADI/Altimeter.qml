import QtQuick 2.0

Item {
    width: 300
    height: 300

    property double scaleRatio: 1

    property double altitude: 0
    property double bugValue: 0

    property double maximumAltitude: 99999
    property double minimumAltitude: 0
    property double tickmarkStepSize: 100
    property double labelStepSize: 500

    readonly property int tickmarkCount: (maximumAltitude - minimumAltitude) / tickmarkStepSize
    readonly property int visibleTickmarkCount: 175 / (tickmarkStepSize * pixelPerAltitude)

    readonly property int labelCount: (maximumAltitude - minimumAltitude) / labelStepSize
    readonly property int visibleLabelCount: 175 / (labelStepSize * pixelPerAltitude)

    readonly property double pixelPerAltitude: 0.150

    property double altitudeBugDeltaY: 0

    onAltitudeChanged: update()
    onBugValueChanged: update()

    function update() {

        altitudeBugDeltaY = pixelPerAltitude * (altitude - bugValue)

        if (altitudeBugDeltaY < -85.0)
            altitudeBugDeltaY = -85.0
        else if (altitudeBugDeltaY > 85.0)
            altitudeBugDeltaY = 85.0

        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        x: 231
        y: 37.5
        width: 36 * scaleRatio
        height: 175 * scaleRatio
        scale: 1 / scaleRatio
        transformOrigin: Item.TopLeft

        antialiasing: true
        onPaint: {
            var ctx = getContext('2d')
            ctx.reset()

            ctx.scale(scaleRatio, scaleRatio)

            // Back
            ctx.fillStyle = "#343434"
            ctx.fillRect(0, 0, 36, 175)

            ctx.translate(0, altitude * pixelPerAltitude)

            // Ground
            ctx.fillStyle = "#402000"
            ctx.fillRect(0, 0.5 * 175, 36, 0.5 * 175)

            // White tickmarks
            ctx.strokeStyle = "#ffffff"
            ctx.lineWidth = 1

            var lowestIndex = Math.round((altitude - minimumAltitude) / tickmarkStepSize - visibleTickmarkCount / 2)
            var highestIndex = Math.round(lowestIndex + visibleTickmarkCount)

            if (lowestIndex < 0)
                lowestIndex = 0

            for (var i = lowestIndex; i <= highestIndex; i++) {
                ctx.beginPath()
                ctx.moveTo(0, 0.5 * 175 - i * tickmarkStepSize * pixelPerAltitude)
                ctx.lineTo(6, 0.5 * 175 - i * tickmarkStepSize * pixelPerAltitude)
                ctx.stroke()
            }

            // Labels
            ctx.textAlign = "right"
            ctx.textBaseline = 'middle'
            ctx.fillStyle = "#ffffff"

            lowestIndex = Math.round((altitude - minimumAltitude) / labelStepSize - visibleLabelCount / 2)
            highestIndex = Math.round(lowestIndex + visibleLabelCount)

            if (lowestIndex < 0)
                lowestIndex = 0

            for (i = lowestIndex; i <= highestIndex; i++) {
                var valueString = i * labelStepSize
                valueString = valueString.toFixed(0)

                if (valueString.length < 4)
                    ctx.font = "11px 'Courier Std'"
                else if (valueString.length === 4)
                    ctx.font = "10px 'Courier Std'"
                else
                    ctx.font = "9px 'Courier Std'"

                ctx.fillText(valueString, 34, 0.5 * 175 - i * labelStepSize * pixelPerAltitude)
            }
        }
    }

    CustomImage {
        id: alt_bug
        x: 225
        y: 110
        height: 30
        source: "qrc:/Resources/Images/eadi/eadi_alt_bug.svg"
        sourceSize.height: 150
        sourceSize.width: 375
        transform: Translate {
            y: altitudeBugDeltaY
        }
    }

    CustomImage {
        id: alt_frame
        x: 225
        y: 110
        height: 30
        source: "qrc:/Resources/Images/eadi/eadi_alt_frame.svg"
        sourceSize.height: 150
        sourceSize.width: 375
    }

    Text {
        x: 241
        y: 119
        width: 31
        height: 11
        text: altitude.toFixed(0)
        font.family: "Courier Std"
        font.pixelSize: 11
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        antialiasing: true
    }

    Rectangle {
        id: mask1
        x: 225
        y: 212
        width: 42
        height: 12
        color: "#000000"
    }

    Rectangle {
        id: mask2
        x: 225
        y: 26
        width: 42
        height: 12
        color: "#000000"
    }
}
