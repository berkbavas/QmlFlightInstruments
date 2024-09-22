import QtQuick 2.0

Item {
    width: 300
    height: 300

    property double scaleRatio: 1
    property double climbRate: 0 // [-6, 6]

    property double pixelPerSpeed1: 30
    property double pixelPerSpeed2: 20
    property double pixelPerSpeed4: 5

    property double lineY: 75

    onClimbRateChanged: update()

    function update() {
        let lineDeltaY = 0
        let climbRateAbs = Math.abs(climbRate)

        if (Math.abs(climbRate) <= 1.0) {
            lineDeltaY = pixelPerSpeed1 * climbRateAbs
        } else if (Math.abs(climbRate) <= 2.0) {
            lineDeltaY = pixelPerSpeed1 + pixelPerSpeed2 * (climbRateAbs - 1.0)
        } else {
            lineDeltaY = pixelPerSpeed1 + pixelPerSpeed2 + pixelPerSpeed4 * (climbRateAbs - 2.0)
        }

        if (climbRate < 0)
            lineY = 75 + lineDeltaY
        else if (climbRate > 0)
            lineY = 75 - lineDeltaY
        else
            lineY = 75

        canvas.requestPaint()
    }

    CustomImage {
        x: 275
        y: 50
        width: 19
        source: "qrc:/Resources/Images/eadi/eadi_vsi_scale.svg"
        sourceSize.height: 750
        sourceSize.width: 95
    }

    Canvas {
        id: canvas
        x: 275
        y: 50
        width: 19 * scaleRatio
        height: 150 * scaleRatio
        antialiasing: true
        scale: 1 / scaleRatio
        transformOrigin: Item.TopLeft

        onPaint: {
            var ctx = getContext('2d')
            ctx.reset()

            ctx.scale(scaleRatio, scaleRatio)

            ctx.strokeStyle = "#ffffff"
            ctx.lineWidth = 4
            ctx.beginPath()
            ctx.moveTo(14.25, 75)

            ctx.lineTo(14.25, lineY)
            ctx.stroke()
        }
    }
}
