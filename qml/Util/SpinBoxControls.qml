import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    id: window
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized

    GridLayout {
        id: leftGrid
        columns: 2

        anchors {
            left: parent.left
            top: parent.top
            margins: 16
        }

        CustomText {
            text: "Angle of Attack [deg]:"
        }

        CustomSpinBox {
            id: angleOfAttack
            from: -20
            to: 20
        }

        CustomText {
            text: "Angle of Sideslip [deg]:"
        }

        CustomSpinBox {
            id: angleOfSideslip
            from: -15
            to: 15
        }

        CustomText {
            text: "Roll [deg]:"
        }

        CustomSpinBox {
            id: roll
            from: -180
            to: 180
        }

        CustomText {
            text: "Pitch [deg]:"
        }

        CustomSpinBox {
            id: pitch
            from: -90
            to: 90
        }

        CustomText {
            text: "Heading [deg]:"
        }

        CustomSpinBox {
            id: heading
            from: 0
            to: 360
        }

        CustomText {
            text: "Sideslip [-]:"
        }

        CustomSpinBox {
            id: sideSlip
            from: -10
            to: 10
        }

        CustomText {
            text: "Turn Rate [x0.1 deg/s]:"
        }

        CustomSpinBox {
            id: turnRate
            from: -10
            to: 10
        }

        CustomText {
            text: "Airspeed [kts]:"
        }

        CustomSpinBox {
            id: airspeed
            from: 0
            to: 1000
        }

        CustomText {
            text: "Mach Number [-]:"
        }

        CustomSpinBox {
            id: machNumber
            from: 0
            to: 20
        }

        CustomText {
            text: "Altitude [x100 ft]:"
        }

        CustomSpinBox {
            id: altitude
            from: 0
            to: 500
        }

        CustomText {
            text: "Climb Rate [x0.1 ft/min]:"
        }

        CustomSpinBox {
            id: climbRate
            from: -60
            to: 60
        }

        CustomText {
            text: "Pressure [inHg]:"
        }

        CustomSpinBox {
            id: pressure
            from: 28
            to: 32
        }

        CustomText {
            text: "Pressure Mode:"
        }

        CustomComboBox {
            id: pressureMode
            model: ["STD", "MB", "IN"]
        }

        CustomText {
            text: "Stall:"
        }

        CustomComboBox {
            id: stall
            model: ["OFF", "ON"]
        }
    }

    GridLayout {
        id: rightGrid
        columns: 2

        anchors {
            left: leftGrid.right
            top: parent.top
            margins: 16
        }

        CustomText {
            text: "ILS LOC [-]:"
        }

        CustomSpinBox {
            id: ilsLoc
            from: -10
            to: 10
        }

        CustomText {
            text: "ILS GS [-]:"
        }

        CustomSpinBox {
            id: ilsGs
            from: -10
            to: 10
        }

        CustomText {
            text: "FD Roll [deg]:"
        }

        CustomSpinBox {
            id: fdRoll
            from: -180
            to: 180
        }

        CustomText {
            text: "FD Pitch [deg]:"
        }

        CustomSpinBox {
            id: fdPitch
            from: -90
            to: 90
        }

        CustomText {
            text: "Altitude Select [x100 ft]:"
        }

        CustomSpinBox {
            id: altitudeBug
            from: 0
            to: 500
        }

        CustomText {
            text: "Airspeed Select [kts]:"
        }

        CustomSpinBox {
            id: airspeedBug
            from: 0
            to: 1000
        }

        CustomText {
            text: "CRS [deg]:"
        }

        CustomSpinBox {
            id: crs
            from: 0
            to: 360
        }

        CustomText {
            text: "HDG [deg]:"
        }

        CustomSpinBox {
            id: hdgBug
            from: 0
            to: 360
        }

        CustomText {
            text: "VOR Deviation [-]:"
        }

        CustomSpinBox {
            id: vorDeviation
            from: -10
            to: 10
        }

        CustomText {
            text: "ADF Bearing [deg]:"
        }

        CustomSpinBox {
            id: adfBearing
            from: 0
            to: 360
        }

        CustomText {
            text: "DME Distance [nm]:"
        }

        CustomSpinBox {
            id: dmeDistance
            from: 0
            to: 9999
        }

        CustomText {
            text: "Flight Mode:"
        }

        CustomComboBox {
            id: flightMode
            model: ["OFF", "FD", "CMD"]
        }

        CustomText {
            text: "Speed Mode:"
        }

        CustomComboBox {
            id: speedMode
            model: ["OFF", "FMC SPD"]
        }

        CustomText {
            text: "LNAV:"
        }

        CustomComboBox {
            id: lnav
            model: ["OFF", "HDG", "NAV", "NAV ARM", "NAV APR", "NAV APR ARM", "NAV BC", "NAV BC ARM"]
        }

        CustomText {
            text: "VNAV:"
        }

        CustomComboBox {
            id: vnav
            model: ["OFF", "ALT", "IAS", "VS", "ALT SEL", "GS", "GS ARM"]
        }

        CustomText {
            text: "CDI:"
        }

        CustomComboBox {
            id: cdi
            model: ["OFF", "TO", "FROM"]
        }
    }
}
