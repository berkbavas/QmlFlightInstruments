#include "Animation.h"

#include <QDateTime>

Animation::Animation(QObject *parent)
    : QObject(parent)
    , mPlayTime(0.0)
{
    connect(&mTimer, &QTimer::timeout, this, &Animation::update);
}

void Animation::update()
{
    quint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    mPlayTime += (currentTime - mPreviousTime) / 1000.0;
    mPreviousTime = currentTime;

    mPfd->setAngleOfAttack(21.0 * sin(mPlayTime / 10.0));
    mPfd->setAngleOfSideSlip(16.0 * sin(mPlayTime / 10.0));
    mPfd->setRoll(180.0 * sin(mPlayTime / 10.0));
    mPfd->setPitch(90.0 * sin(mPlayTime / 20.0));
    mPfd->setHeading(360.0 * sin(mPlayTime / 40.0));
    mPfd->setSlipSkid(1.0 * sin(mPlayTime / 10.0));
    mPfd->setTurnRate(1.0 * sin(mPlayTime / 10.0));
    mPfd->setIlsLOC(1.0 * sin(mPlayTime / 20.0));
    mPfd->setIlsGS(1.0 * sin(mPlayTime / 20.0));
    mPfd->setFdRoll(30.0 * sin(mPlayTime / 20.0));
    mPfd->setFdPitch(10.0 * sin(mPlayTime / 20.0));
    mPfd->setAirspeed(-100.0 * cos(mPlayTime / 10.0) + 100.0);
    mPfd->setAltitude(-5000.0 * cos(mPlayTime / 40.0) + 5000.0);
    mPfd->setPressure(2.0 * sin(mPlayTime / 20.0) + 30.0);
    mPfd->setClimbRate(6 * sin(mPlayTime / 20.0));
    mPfd->setMachNumber(mPfd->airspeed() / 650.0);
    mPfd->setHeadingBug(-360.0 * sin(mPlayTime / 40.0));
    mPfd->setCourse(360.0 * sin(mPlayTime / 20.0));
    mPfd->setVorDeviation(1.0 * sin(mPlayTime / 20.0));
    mPfd->setBearing(-360.0 * sin(mPlayTime / 50.0));
    mPfd->setDmeDistance(99.0 * sin(mPlayTime / 100.0));
    mPfd->setAirspeedBug(-50.0 * cos(mPlayTime / 10.0) + 50.0);
    mPfd->setAltitudeBug(-1000.0 * cos(mPlayTime / 40.0) + 1000.0);

    mPfd->setLeftTankFuel(15 - 15 * cos(mPlayTime / 10.0));
    mPfd->setRightTankFuel(15 - 15 * cos(mPlayTime / 20.0));
    mPfd->setEgt(1300 - 600 * cos(mPlayTime / 10.0));
    mPfd->setFuelFlow(10 - 10 * cos(mPlayTime / 10.0));
    mPfd->setEngineTemperature(160 - 85 * cos(mPlayTime / 10.0));
    mPfd->setEnginePressure(57.5 - 57.5 * cos(mPlayTime / 10.0));
    mPfd->setVac(5 - 2 * cos(mPlayTime / 5.0));
    mPfd->setAmp(60 * sin(mPlayTime / 10.0));
    mPfd->setRpm(1750 - 1750 * cos(mPlayTime / 10.0));
}

void Animation::init()
{
    mPfd->setPressureMode(PrimaryFlightData::PressureMode::IN);
    mPfd->setFlightMode(PrimaryFlightData::FlightMode::FD);
    mPfd->setSpeedMode(PrimaryFlightData::SpeedMode::Off);
    mPfd->setLateralNavigationMode(PrimaryFlightData::LNAV::Off);
    mPfd->setVerticalNavigationMode(PrimaryFlightData::VNAV::Off);
    mPfd->setCourseDeviationIndicatorMode(PrimaryFlightData::CDI::Off);

    mPfd->setStall(false);
    mPfd->setFdVisible(false);
    mPfd->setIlsGSVisible(false);
    mPfd->setIlsGSVisible(false);

    mPreviousTime = QDateTime::currentMSecsSinceEpoch();
    mTimer.start(10);
}

void Animation::setPfd(PrimaryFlightData *newPfd)
{
    mPfd = newPfd;
}
