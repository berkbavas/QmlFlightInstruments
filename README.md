# QML Flight Instruments

A QML port of [Marek M. Cel](http://marekcel.pl/)'s [QFlightinstruments](https://github.com/marek-cel/QFlightinstruments), with additional miscellaneous gauges and improvements.

SVG files are from Marek's repository. See `Resources/Images/LICENSE` for copyright.

## Project Structure

- `Source/` — C++ source files
- `Qml/` — QML components and instrument UIs
- `Resources/Fonts/` — Font files
- `Resources/Images/` — SVG images for instruments

## Features

- **Electronic Flight Instrument System (EFIS)**
  - Electronic Attitude Direction Indicator (EADI)
  - Electronic Horizontal Situation Indicator (EHSI)
- **Basic Six**
  - Airspeed Indicator (ASI)
  - Attitude Indicator (AI)
  - Altimeter (ALT)
  - Turn Coordinator (TC)
  - Heading Indicator (HI)
  - Vertical Speed Indicator (VSI)
- **Additional Gauges**
  - Fuel Tank
  - Exhaust Gas Temperature (EGT) & Fuel Flow
  - Propeller
  - Battery
  - Temperature & Pressure

## Demo Videos

[EFIS Demo](https://github.com/user-attachments/assets/13cdcce1-c171-4f1a-831c-717e8199d89a)

[Basic Six Demo](https://github.com/user-attachments/assets/7cdaf409-05d2-4da4-9133-938577d28892) 

[Miscellaneous Gauges Demo](https://github.com/user-attachments/assets/648b4862-01e2-4189-a004-1b61f6f0a597)

## Credits & License

- Original code and SVGs by Marek M. Cel. See [QFlightinstruments](https://github.com/marek-cel/QFlightinstruments).
- Additional gauges and QML port by this project.

## Building

1. Install **Qt 5.15.2**.
2. Open `QmlFlightInstruments.pro` in **Qt Creator**.
3. Build and run the project.
