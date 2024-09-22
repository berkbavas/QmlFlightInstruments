import QtQuick 2.0

CustomCanvas {
    anchors.fill: parent
    onPaint: {
        if (context) {
            context.reset()
            context.beginPath()
            context.arc(parent.radius, parent.radius, parent.radius, -45 * Math.PI / 180.0, 45 * Math.PI / 180.0)
            context.closePath()
            context.fillStyle = "#101010"
            context.fill()

            context.beginPath()
            context.arc(parent.radius, parent.radius, parent.radius, -135 * Math.PI / 180.0, 135 * Math.PI / 180.0, true)
            context.closePath()
            context.fillStyle = "#101010"
            context.fill()
        }
    }
}
