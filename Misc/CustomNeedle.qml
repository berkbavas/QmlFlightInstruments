import QtQuick 2.0

Canvas {
    antialiasing: true
    onPaint: {
        var ctx = getContext('2d')

        var gradient = ctx.createLinearGradient(0, height / 2, width, height / 2)

        gradient.addColorStop(0, '#ffffff')
        gradient.addColorStop(1, '#a0a0a0')

        ctx.fillStyle = gradient

        ctx.beginPath()
        ctx.moveTo(0.35 * width, 0.1 * height)
        ctx.quadraticCurveTo(0.5 * width, 0.05 * height, 0.65 * width, 0.1 * height)
        ctx.lineTo(width, height)
        ctx.lineTo(0, height)
        ctx.closePath()
        ctx.fill()
    }
}
