import QtQuick 2.0

Item {
    width: 300
    height: 300

    property double airspeedBug: 0
    property double machNumber: 0
    property double altitudeBug: 0
    property double pressure: 0

    property int pressureMode: 0 // 0->STD, 1->MB, 2->IN
    property int flightMode: 0 // 0->OFF, 1->FD, 2->CMD
    property int speedMode: 0 // 0->OFF, 1->FMC SPD
    property int lnav: 0 // 0->OFF, 1->HDG, 2->NAV, 3->NAV ARM, 4->NAV APR, 5->NAV APR ARM, 6->BC, 7->BC ARM
    property int vnav: 0 // 0->OFF, 1->ALT, 2->IAS, 3->VS, 4->ALT SEL, 5->GS, 6-> GS ARM

    // Airspeed Bug
    Text {
        x: 8
        y: 19
        width: 51
        height: 20
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#ff00ff"
        antialiasing: true
        text: airspeedBug.toFixed(0)
    }

    // Mach Number
    Text {
        x: 4
        y: 211
        width: 54
        height: 20
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        antialiasing: true
        text: machNumber < 1 ? machNumber.toFixed(3).substring(1) : machNumber < 10 ? machNumber.toFixed(2) : machNumber.toFixed(1)
    }

    // Altitude bug
    Text {
        id: altitudeBugText
        x: 228
        y: 21
        width: 36
        height: 18
        font.family: "Courier Std"
        font.pixelSize: altitudeBug.toFixed(0).length < 4 ? 16 : altitudeBug.toFixed(0).length === 4 ? 14 : altitudeBug.toFixed(
                                                                                                           0).length === 5 ? 12 : 11
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#ff00ff"

        antialiasing: true
        text: altitudeBug.toFixed(0)
    }

    // Pressure Mode
    Text {
        y: 213
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: altitudeBugText.horizontalCenter
        color: "#00ff00"
        antialiasing: true
        text: pressureMode === 0 ? "STD" : pressureMode === 1 ? pressure.toFixed(0) + " MB" : pressureMode === 2 ? pressure.toFixed(2) + " IN" : ""
    }

    // Flight Mode
    Text {
        y: 33
        width: 128
        height: 18
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#00ff00"
        antialiasing: true
        text: flightMode === 1 ? "FD" : flightMode === 2 ? "CMD" : ""
    }

    // Speed Mode
    Text {
        x: 80
        y: 5
        font.family: "Courier Std"
        font.pixelSize: 9
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#00ff00"
        antialiasing: true
        text: speedMode === 1 ? "FMC SPD" : ""
    }

    // LNAV TOP
    Text {
        x: 132
        y: 5
        width: 38
        height: 10
        color: "#00ff00"
        font.pixelSize: 9
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Courier Std"
        antialiasing: true
        text: lnav === 1 ? "HDG SEL" : lnav === 2 ? "VOR/LOC" : lnav === 3 ? "HDG SEL" : lnav
                                                                             === 4 ? "APR" : lnav === 5 ? "APR" : lnav === 6 ? "BC" : lnav === 7 ? "BC" : ""
    }

    // LNAV BOTTOM
    Text {
        x: 132
        y: 15
        width: 38
        color: "#ffffff"
        font.pixelSize: 9
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Courier Std"
        antialiasing: true
        text: lnav === 3 ? "VOR LOC" : lnav === 5 ? "APR" : lnav === 7 ? "BC" : ""
    }

    // VNAV TOP
    Text {
        x: 182
        y: 5
        width: 38
        color: "#00ff00"
        font.pixelSize: 9
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Courier Std"
        antialiasing: true
        text: vnav === 1 ? "ALT" : vnav === 2 ? "IAS" : vnav === 3 ? "VS" : vnav === 4 ? "ALT SEL" : vnav === 5 ? "GS PATH" : vnav === 6 ? "GS PATH" : ""
    }

    // VNAV BOTTOM
    Text {
        x: 182
        y: 15
        width: 38
        color: "#ffffff"
        font.pixelSize: 9
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Courier Std"
        antialiasing: true
        text: vnav === 6 ? "GS PATH" : ""
    }
}
