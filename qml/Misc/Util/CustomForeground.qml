import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    width: 2 * radius
    height: 2 * radius
    radius: 10

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#333333"
        }
        GradientStop {
            position: 1.0
            color: "#101010"
        }
    }

    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: 0.2 * root.radius
        verticalOffset: 0.2 * root.radius
        radius: 0.4 * root.radius
        spread: 0.25
        samples: 16
        color: "#000000"
        source: root
    }
}
