#include "PrimaryFlightData.h"

#include <cmath>

PrimaryFlightData::PrimaryFlightData(QObject *parent)
    : QObject(parent)
    , mAngleOfAttack(0)
    , mAngleOfSideSlip(0)
    , mRoll(0)
    , mPitch(0)
    , mHeading(0)
    , mSlipSkid(0)
    , mTurnRate(0)
    , mAirspeed(0)
    , mMachNumber(0)
    , mAltitude(0)
    , mPressure(28)
    , mClimbRate(0)
    , mIlsLOC(0)
    , mIlsGS(0)
    , mFdRoll(0)
    , mFdPitch(0)
    , mAltitudeBug(0)
    , mAirspeedBug(0)
    , mHeadingBug(0)
    , mCourse(0)
    , mVorDeviation(0)
    , mBearing(0)
    , mDmeDistance(0)
    , mPressureMode(0)
    , mFlightMode(0)
    , mSpeedMode(0)
    , mLateralNavigationMode(0)
    , mVerticalNavigationMode(0)
    , mCourseDeviationIndicatorMode(0)
    , mIlsLOCVisible(false)
    , mIlsGSVisible(false)
    , mFdVisible(false)
    , mStall(false)
{}

double PrimaryFlightData::angleOfAttack() const
{
    return mAngleOfAttack;
}

void PrimaryFlightData::setAngleOfAttack(double newAngleOfAttack)
{
    if (std::isnan(newAngleOfAttack) || qFuzzyCompare(mAngleOfAttack, newAngleOfAttack))
        return;

    if (newAngleOfAttack < -20)
        newAngleOfAttack = -20;
    else if (newAngleOfAttack > 20)
        newAngleOfAttack = 20;

    mAngleOfAttack = newAngleOfAttack;
    emit angleOfAttackChanged();
}

double PrimaryFlightData::angleOfSideSlip() const
{
    return mAngleOfSideSlip;
}

void PrimaryFlightData::setAngleOfSideSlip(double newAngleOfSideSlip)
{
    if (std::isnan(newAngleOfSideSlip) || qFuzzyCompare(mAngleOfSideSlip, newAngleOfSideSlip))
        return;

    if (newAngleOfSideSlip < -15)
        newAngleOfSideSlip = -15;
    else if (newAngleOfSideSlip > 15)
        newAngleOfSideSlip = 15;

    mAngleOfSideSlip = newAngleOfSideSlip;
    emit angleOfSideSlipChanged();
}

double PrimaryFlightData::roll() const
{
    return mRoll;
}

void PrimaryFlightData::setRoll(double newRoll)
{
    if (std::isnan(newRoll) || qFuzzyCompare(mRoll, newRoll))
        return;

    if (newRoll < -180)
        newRoll = -180;
    else if (newRoll > 180)
        newRoll = 180;

    mRoll = newRoll;
    emit rollChanged();
}

double PrimaryFlightData::pitch() const
{
    return mPitch;
}

void PrimaryFlightData::setPitch(double newPitch)
{
    if (std::isnan(newPitch) || qFuzzyCompare(mPitch, newPitch))
        return;

    if (newPitch < -90)
        newPitch = -90;
    else if (newPitch > 90)
        newPitch = 90;

    mPitch = newPitch;
    emit pitchChanged();
}

double PrimaryFlightData::heading() const
{
    return mHeading;
}

void PrimaryFlightData::setHeading(double newHeading)
{
    if (std::isnan(newHeading) || qFuzzyCompare(mHeading, newHeading))
        return;

    while (newHeading < 0.0)
        newHeading += 360.0;
    while (newHeading > 360.0)
        newHeading -= 360.0;

    mHeading = newHeading;
    emit headingChanged();
}

double PrimaryFlightData::slipSkid() const
{
    return mSlipSkid;
}

void PrimaryFlightData::setSlipSkid(double newSlipSkid)
{
    if (std::isnan(newSlipSkid) || qFuzzyCompare(mSlipSkid, newSlipSkid))
        return;

    if (newSlipSkid < -1)
        newSlipSkid = -1;
    else if (newSlipSkid > 1)
        newSlipSkid = 1;

    mSlipSkid = newSlipSkid;
    emit slipSkidChanged();
}

double PrimaryFlightData::turnRate() const
{
    return mTurnRate;
}

void PrimaryFlightData::setTurnRate(double newTurnRate)
{
    if (std::isnan(newTurnRate) || qFuzzyCompare(mTurnRate, newTurnRate))
        return;

    if (newTurnRate < -1)
        newTurnRate = -1;
    else if (newTurnRate > 1)
        newTurnRate = 1;

    mTurnRate = newTurnRate;
    emit turnRateChanged();
}

double PrimaryFlightData::airspeed() const
{
    return mAirspeed;
}

void PrimaryFlightData::setAirspeed(double newAirspeed)
{
    if (std::isnan(newAirspeed) || qFuzzyCompare(mAirspeed, newAirspeed))
        return;

    if (newAirspeed < 0)
        newAirspeed = 0;
    else if (newAirspeed > 9999)
        newAirspeed = 9999;

    mAirspeed = newAirspeed;
    emit airspeedChanged();
}

double PrimaryFlightData::machNumber() const
{
    return mMachNumber;
}

void PrimaryFlightData::setMachNumber(double newMachNumber)
{
    if (std::isnan(newMachNumber) || qFuzzyCompare(mMachNumber, newMachNumber))
        return;

    if (newMachNumber < 0)
        newMachNumber = 0;
    else if (newMachNumber > 99)
        newMachNumber = 99;

    mMachNumber = newMachNumber;
    emit machNumberChanged();
}

double PrimaryFlightData::altitude() const
{
    return mAltitude;
}

void PrimaryFlightData::setAltitude(double newAltitude)
{
    if (std::isnan(newAltitude) || qFuzzyCompare(mAltitude, newAltitude))
        return;

    if (newAltitude < 0)
        newAltitude = 0;
    else if (newAltitude > 99999)
        newAltitude = 99999;

    mAltitude = newAltitude;
    emit altitudeChanged();
}

double PrimaryFlightData::pressure() const
{
    return mPressure;
}

void PrimaryFlightData::setPressure(double newPressure)
{
    if (std::isnan(newPressure) || qFuzzyCompare(mPressure, newPressure))
        return;

    if (newPressure < 0)
        newPressure = 0;
    else if (newPressure > 2000)
        newPressure = 2000;

    mPressure = newPressure;
    emit pressureChanged();
}

double PrimaryFlightData::climbRate() const
{
    return mClimbRate;
}

void PrimaryFlightData::setClimbRate(double newClimbRate)
{
    if (std::isnan(newClimbRate) || qFuzzyCompare(mClimbRate, newClimbRate))
        return;

    if (newClimbRate > 6.8)
        newClimbRate = 6.8;
    else if (newClimbRate < -6.8)
        newClimbRate = -6.8;

    mClimbRate = newClimbRate;
    emit climbRateChanged();
}

double PrimaryFlightData::ilsLOC() const
{
    return mIlsLOC;
}

void PrimaryFlightData::setIlsLOC(double newIlsLOC)
{
    if (std::isnan(newIlsLOC) || qFuzzyCompare(mIlsLOC, newIlsLOC))
        return;

    if (newIlsLOC < -1)
        newIlsLOC = -1;
    else if (newIlsLOC > 1)
        newIlsLOC = 1;

    mIlsLOC = newIlsLOC;
    emit ilsLOCChanged();
}

double PrimaryFlightData::ilsGS() const
{
    return mIlsGS;
}

void PrimaryFlightData::setIlsGS(double newIlsGS)
{
    if (std::isnan(newIlsGS) || qFuzzyCompare(mIlsGS, newIlsGS))
        return;

    if (newIlsGS < -1)
        newIlsGS = -1;
    else if (newIlsGS > 1)
        newIlsGS = 1;

    mIlsGS = newIlsGS;
    emit ilsGSChanged();
}

double PrimaryFlightData::fdRoll() const
{
    return mFdRoll;
}

void PrimaryFlightData::setFdRoll(double newFdRoll)
{
    if (std::isnan(newFdRoll) || qFuzzyCompare(mFdRoll, newFdRoll))
        return;

    if (newFdRoll < -180)
        newFdRoll = -180;
    else if (newFdRoll > 180)
        newFdRoll = 180;

    mFdRoll = newFdRoll;
    emit fdRollChanged();
}

double PrimaryFlightData::fdPitch() const
{
    return mFdPitch;
}

void PrimaryFlightData::setFdPitch(double newFdPitch)
{
    if (std::isnan(newFdPitch) || qFuzzyCompare(mFdPitch, newFdPitch))
        return;

    if (newFdPitch < -90)
        newFdPitch = -90;
    else if (newFdPitch > 90)
        newFdPitch = 90;

    mFdPitch = newFdPitch;
    emit fdPitchChanged();
}

double PrimaryFlightData::altitudeBug() const
{
    return mAltitudeBug;
}

void PrimaryFlightData::setAltitudeBug(double newAltitudeBug)
{
    if (std::isnan(newAltitudeBug) || qFuzzyCompare(mAltitudeBug, newAltitudeBug))
        return;

    if (newAltitudeBug < 0)
        newAltitudeBug = 0;
    else if (newAltitudeBug > 99999)
        newAltitudeBug = 99999;

    mAltitudeBug = newAltitudeBug;
    emit altitudeBugChanged();
}

double PrimaryFlightData::airspeedBug() const
{
    return mAirspeedBug;
}

void PrimaryFlightData::setAirspeedBug(double newAirspeedBug)
{
    if (std::isnan(newAirspeedBug) || qFuzzyCompare(mAirspeedBug, newAirspeedBug))
        return;

    if (newAirspeedBug < 0)
        newAirspeedBug = 0;
    else if (newAirspeedBug > 9999)
        newAirspeedBug = 9999;

    mAirspeedBug = newAirspeedBug;
    emit airspeedBugChanged();
}

double PrimaryFlightData::headingBug() const
{
    return mHeadingBug;
}

void PrimaryFlightData::setHeadingBug(double newHeadingBug)
{
    if (std::isnan(newHeadingBug) || qFuzzyCompare(mHeadingBug, newHeadingBug))
        return;

    while (newHeadingBug < 0.0)
        newHeadingBug += 360.0;
    while (newHeadingBug > 360.0)
        newHeadingBug -= 360.0;

    mHeadingBug = newHeadingBug;
    emit headingBugChanged();
}

double PrimaryFlightData::course() const
{
    return mCourse;
}

void PrimaryFlightData::setCourse(double newCourse)
{
    if (std::isnan(newCourse) || qFuzzyCompare(mCourse, newCourse))
        return;

    while (newCourse < 0.0)
        newCourse += 360.0;
    while (newCourse > 360.0)
        newCourse -= 360.0;

    mCourse = newCourse;
    emit courseChanged();
}

double PrimaryFlightData::vorDeviation() const
{
    return mVorDeviation;
}

void PrimaryFlightData::setVorDeviation(double newVorDeviation)
{
    if (std::isnan(newVorDeviation) || qFuzzyCompare(mVorDeviation, newVorDeviation))
        return;

    if (newVorDeviation < -1.0)
        newVorDeviation = -1.0;
    if (newVorDeviation > 1.0)
        newVorDeviation = 1.0;

    mVorDeviation = newVorDeviation;
    emit vorDeviationChanged();
}

double PrimaryFlightData::bearing() const
{
    return mBearing;
}

void PrimaryFlightData::setBearing(double newBearing)
{
    if (std::isnan(newBearing) || qFuzzyCompare(mBearing, newBearing))
        return;

    while (newBearing < 0.0)
        newBearing += 360.0;
    while (newBearing > 360.0)
        newBearing -= 360.0;

    mBearing = newBearing;
    emit bearingChanged();
}

double PrimaryFlightData::dmeDistance() const
{
    return mDmeDistance;
}

void PrimaryFlightData::setDmeDistance(double newDmeDistance)
{
    if (std::isnan(newDmeDistance) || qFuzzyCompare(mDmeDistance, newDmeDistance))
        return;

    mDmeDistance = abs(newDmeDistance);
    emit dmeDistanceChanged();
}

int PrimaryFlightData::pressureMode() const
{
    return mPressureMode;
}

void PrimaryFlightData::setPressureMode(PrimaryFlightData::PressureMode newPressureMode)
{
    if (mPressureMode == (int) newPressureMode)
        return;
    mPressureMode = (int) newPressureMode;
    emit pressureModeChanged();
}

int PrimaryFlightData::flightMode() const
{
    return mFlightMode;
}

void PrimaryFlightData::setFlightMode(PrimaryFlightData::FlightMode newFlightMode)
{
    if (mFlightMode == (int) newFlightMode)
        return;
    mFlightMode = (int) newFlightMode;
    emit flightModeChanged();
}

int PrimaryFlightData::speedMode() const
{
    return mSpeedMode;
}

void PrimaryFlightData::setSpeedMode(PrimaryFlightData::SpeedMode newSpeedMode)
{
    if (mSpeedMode == (int) newSpeedMode)
        return;
    mSpeedMode = (int) newSpeedMode;
    emit speedModeChanged();
}

int PrimaryFlightData::lateralNavigationMode() const
{
    return mLateralNavigationMode;
}

void PrimaryFlightData::setLateralNavigationMode(PrimaryFlightData::LNAV newLateralNavigationMode)
{
    if (mLateralNavigationMode == (int) newLateralNavigationMode)
        return;
    mLateralNavigationMode = (int) newLateralNavigationMode;
    emit lateralNavigationModeChanged();
}

int PrimaryFlightData::verticalNavigationMode() const
{
    return mVerticalNavigationMode;
}

void PrimaryFlightData::setVerticalNavigationMode(PrimaryFlightData::VNAV newVerticalNavigationMode)
{
    if (mVerticalNavigationMode == (int) newVerticalNavigationMode)
        return;
    mVerticalNavigationMode = (int) newVerticalNavigationMode;
    emit verticalNavigationModeChanged();
}

int PrimaryFlightData::courseDeviationIndicatorMode() const
{
    return mCourseDeviationIndicatorMode;
}

void PrimaryFlightData::setCourseDeviationIndicatorMode(PrimaryFlightData::CDI newCourseDeviationIndicatorMode)
{
    if (mCourseDeviationIndicatorMode == (int) newCourseDeviationIndicatorMode)
        return;
    mCourseDeviationIndicatorMode = (int) newCourseDeviationIndicatorMode;
    emit courseDeviationIndicatorModeChanged();
}

bool PrimaryFlightData::ilsLOCVisible() const
{
    return mIlsLOCVisible;
}

void PrimaryFlightData::setIlsLOCVisible(bool newIlsLOCVisible)
{
    if (mIlsLOCVisible == newIlsLOCVisible)
        return;
    mIlsLOCVisible = newIlsLOCVisible;
    emit ilsLOCVisibleChanged();
}

bool PrimaryFlightData::ilsGSVisible() const
{
    return mIlsGSVisible;
}

void PrimaryFlightData::setIlsGSVisible(bool newIlsGSVisible)
{
    if (mIlsGSVisible == newIlsGSVisible)
        return;
    mIlsGSVisible = newIlsGSVisible;
    emit ilsGSVisibleChanged();
}

bool PrimaryFlightData::fdVisible() const
{
    return mFdVisible;
}

void PrimaryFlightData::setFdVisible(bool newFdVisible)
{
    if (mFdVisible == newFdVisible)
        return;
    mFdVisible = newFdVisible;
    emit fdVisibleChanged();
}

bool PrimaryFlightData::stall() const
{
    return mStall;
}

void PrimaryFlightData::setStall(bool newStall)
{
    if (mStall == newStall)
        return;
    mStall = newStall;
    emit stallChanged();
}

double PrimaryFlightData::leftTankFuel() const
{
    return mLeftTankFuel;
}

void PrimaryFlightData::setLeftTankFuel(double newLeftTankFuel)
{
    if (std::isnan(newLeftTankFuel) || qFuzzyCompare(mLeftTankFuel, newLeftTankFuel))
        return;
    mLeftTankFuel = newLeftTankFuel;
    emit leftTankFuelChanged();
}

double PrimaryFlightData::rightTankFuel() const
{
    return mRightTankFuel;
}

void PrimaryFlightData::setRightTankFuel(double newRightTankFuel)
{
    if (std::isnan(newRightTankFuel) || qFuzzyCompare(mRightTankFuel, newRightTankFuel))
        return;
    mRightTankFuel = newRightTankFuel;
    emit rightTankFuelChanged();
}

double PrimaryFlightData::egt() const
{
    return mEgt;
}

void PrimaryFlightData::setEgt(double newEgt)
{
    if (std::isnan(newEgt) || qFuzzyCompare(mEgt, newEgt))
        return;
    mEgt = newEgt;
    emit egtChanged();
}

double PrimaryFlightData::fuelFlow() const
{
    return mFuelFlow;
}

void PrimaryFlightData::setFuelFlow(double newFuelFlow)
{
    if (std::isnan(newFuelFlow) || qFuzzyCompare(mFuelFlow, newFuelFlow))
        return;
    mFuelFlow = newFuelFlow;
    emit fuelFlowChanged();
}

double PrimaryFlightData::engineTemperature() const
{
    return mEngineTemperature;
}

void PrimaryFlightData::setEngineTemperature(double newEngineTemperature)
{
    if (std::isnan(newEngineTemperature) || qFuzzyCompare(mEngineTemperature, newEngineTemperature))
        return;
    mEngineTemperature = newEngineTemperature;
    emit engineTemperatureChanged();
}

double PrimaryFlightData::enginePressure() const
{
    return mEnginePressure;
}

void PrimaryFlightData::setEnginePressure(double newEnginePressure)
{
    if (std::isnan(newEnginePressure) || qFuzzyCompare(mEnginePressure, newEnginePressure))
        return;
    mEnginePressure = newEnginePressure;
    emit enginePressureChanged();
}

double PrimaryFlightData::vac() const
{
    return mVac;
}

void PrimaryFlightData::setVac(double newVac)
{
    if (std::isnan(newVac) || qFuzzyCompare(mVac, newVac))
        return;
    mVac = newVac;
    emit vacChanged();
}

double PrimaryFlightData::amp() const
{
    return mAmp;
}

void PrimaryFlightData::setAmp(double newAmp)
{
    if (std::isnan(newAmp) || qFuzzyCompare(mAmp, newAmp))
        return;
    mAmp = newAmp;
    emit ampChanged();
}

double PrimaryFlightData::rpm() const
{
    return mRpm;
}

void PrimaryFlightData::setRpm(double newRpm)
{
    if (std::isnan(newRpm) || qFuzzyCompare(mRpm, newRpm))
        return;
    mRpm = newRpm;
    emit rpmChanged();
}
