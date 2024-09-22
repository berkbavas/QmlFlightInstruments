import QtQuick 2.0

Item {
    width: 300
    height: 300
    clip: false

    property double scaleRatio: 1

    property double airspeed: 0
    property double bugValue: 0

    property double maximumAirspeed: 9999
    property double minimumAirspeed: 0
    property double tickmarkStepSize: 10
    property double labelStepSize: 20

    readonly property double pixelPerSpeed: 1.5
    readonly property double highAirspeed: 160
    readonly property double lowAirspeed: 85

    readonly property int tickmarkCount: (maximumAirspeed - minimumAirspeed) / tickmarkStepSize
    readonly property int visibleTickmarkCount: 175 / (tickmarkStepSize * pixelPerSpeed)

    readonly property int labelCount: (maximumAirspeed - minimumAirspeed) / labelStepSize
    readonly property int visibleLabelCount: 175 / (labelStepSize * pixelPerSpeed)

    readonly property double redTickmarkStepSize: 5
    readonly property double redTickmarksCount: (maximumAirspeed - minimumAirspeed) / redTickmarkStepSize
    readonly property double visibleRedTickmarkCount: 175 / (redTickmarkStepSize * pixelPerSpeed)

    property double bugY: 0

    onAirspeedChanged: update()
    onBugValueChanged: update()

    function update() {

        let tempBugY = pixelPerSpeed * (airspeed - bugValue)

        if (tempBugY < -85.0)
            tempBugY = -85.0
        else if (tempBugY > 85.0)
            tempBugY = 85.0

        bugY = tempBugY

        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        x: 25
        y: 37.5
        width: 40 * scaleRatio
        height: 175 * scaleRatio
        antialiasing: true
        clip: true
        scale: 1 / scaleRatio
        transformOrigin: Item.TopLeft

        onPaint: {
            var ctx = getContext('2d')
            ctx.reset()

            ctx.scale(scaleRatio, scaleRatio)

            ctx.fillStyle = "#343434"
            ctx.fillRect(0, 0, 36, 175)

            ctx.translate(0, airspeed * pixelPerSpeed)

            var height = 175

            // White tickmarks
            {
                ctx.strokeStyle = "#ffffff"
                ctx.lineWidth = 1

                let lowestIndex = Math.round((airspeed - minimumAirspeed) / tickmarkStepSize - visibleTickmarkCount / 2)
                let highestIndex = Math.round(lowestIndex + visibleTickmarkCount)

                if (lowestIndex < 0)
                lowestIndex = 0

                for (var i = lowestIndex; i <= highestIndex; i++) {
                    ctx.beginPath()
                    let y = 0.5 * height - i * tickmarkStepSize * pixelPerSpeed
                    ctx.moveTo(30, y)
                    ctx.lineTo(36, y)
                    ctx.stroke()
                }
            }

            // Red tickmarks
            {

                ctx.strokeStyle = "#ff0000"
                ctx.lineWidth = 4
                for (i = 0; i < redTickmarksCount; i++) {
                    ctx.beginPath()
                    let y = 0.5 * height - highAirspeed * pixelPerSpeed - i * redTickmarkStepSize * pixelPerSpeed
                    ctx.moveTo(36, y)
                    ctx.lineTo(40, y)
                    ctx.stroke()
                }
            }

            // Labels
            {
                ctx.font = "10px 'Courier Std'"
                ctx.textAlign = "right"
                ctx.textBaseline = 'middle'
                ctx.fillStyle = "#ffffff"

                let lowestIndex = Math.round((airspeed - minimumAirspeed) / labelStepSize - visibleLabelCount / 2)
                let highestIndex = Math.round(lowestIndex + visibleLabelCount)

                if (lowestIndex < 0)
                    lowestIndex = 0

                for (var i = lowestIndex; i <= highestIndex; i++) {
                    var valueString = i * labelStepSize
                    var x = 26
                    let y = 0.5 * height - i * labelStepSize * pixelPerSpeed

                    ctx.fillText(valueString.toFixed(0), x, y)
                }
            }

            // Low airspeed marker line
            {
                ctx.moveTo(36, 0.5 * height + 0.5)
                ctx.lineTo(36, 0.5 * height - lowAirspeed * pixelPerSpeed)
                ctx.strokeStyle = "#ffffff"
                ctx.lineWidth = 1
                ctx.stroke()
            }
        }
    }

    CustomImage {
        id: bug
        x: 0
        y: 110
        width: 75
        source: "qrc:/Resources/Images/eadi/eadi_asi_bug.svg"
        sourceSize.width: 375
        sourceSize.height: 150
        transform: Translate {
            y: bugY
        }
    }

    CustomImage {
        id: frame
        x: 0
        y: 110
        width: 75
        source: "qrc:/Resources/Images/eadi/eadi_asi_frame.svg"
        sourceSize.height: 154
        sourceSize.width: 375
    }

    Text {
        x: 25
        y: 118
        width: 25
        height: 14
        text: airspeed.toFixed(0)
        font.family: "Courier Std"
        font.pixelSize: 12
        horizontalAlignment: Text.AlignRight
        color: "#ffffff"
        antialiasing: true
    }
}
