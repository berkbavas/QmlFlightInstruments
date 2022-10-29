import "BasicSix"

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized
    title: "Basic Six Example"
    color: "#000000"

    Grid {
        columns: 3

        anchors {
            centerIn: parent
            margins: 16
        }

        AirspeedIndicator {
            radius: 250
            airspeed: pfd.airspeed
        }

        AttitudeIndicator {
            radius: 250
            roll: pfd.roll
            pitch: pfd.pitch
        }


        Altimeter {
            radius: 250
            altitude: pfd.altitude
            pressure: pfd.pressure
        }

        TurnCoordinator {
            radius: 250
            turnRate: pfd.turnRate
            slipSkid: pfd.slipSkid
        }


        HeadingIndicator {
            radius: 250
            heading: pfd.heading
        }


        VerticalSpeedIndicator {
            radius: 250
            climbRate: pfd.climbRate
        }

    }
}
