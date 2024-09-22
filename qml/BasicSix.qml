import "BasicSix"

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    id: window
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized
    title: "Basic Six Example"
    color: "#ffffff"

    property double scaleRatio: Math.min(height / 1080, width / 1920)
    property double radius: 250 * scaleRatio

    Grid {
        columns: 3
        columnSpacing: 32
        rowSpacing: 16

        anchors {
            centerIn: parent
            margins: 16
        }

        AirspeedIndicator {
            radius: window.radius
            airspeed: pfd.airspeed
        }

        AttitudeIndicator {
            radius: window.radius
            roll: pfd.roll
            pitch: pfd.pitch
        }

        Altimeter {
            radius: window.radius
            altitude: pfd.altitude
            pressure: pfd.pressure
        }

        TurnCoordinator {
            radius: window.radius
            turnRate: pfd.turnRate
            slipSkid: pfd.slipSkid
        }

        HeadingIndicator {
            radius: window.radius
            heading: pfd.heading
        }

        VerticalSpeedIndicator {
            radius: window.radius
            climbRate: pfd.climbRate
        }
    }
}
