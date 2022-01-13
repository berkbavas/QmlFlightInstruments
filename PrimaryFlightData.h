#ifndef PRIMARYFLIGHTDATA_H
#define PRIMARYFLIGHTDATA_H

#include <QObject>

class PrimaryFlightData : public QObject
{
    Q_OBJECT
public:
    explicit PrimaryFlightData(QObject *parent = nullptr);

    /** Flight mode enum. */
    enum class FlightMode {
        Off = 0, ///<
        FD,      ///<
        CMD      ///<
    };

    /** Speed mode enum. */
    enum class SpeedMode {
        Off = 0, ///<
        FMC_SPD  ///<
    };

    /** Lateral navigation mode enum. */
    enum class LNAV {
        Off = 0, ///<
        HDG,     ///<
        NAV,     ///<
        NAV_ARM, ///<
        APR,     ///<
        APR_ARM, ///<
        BC,      ///<
        BC_ARM   ///<
    };

    /** Vertical navigation mode enum. */
    enum class VNAV {
        Off = 0, ///<
        ALT,     ///<
        IAS,     ///<
        VS,      ///<
        ALT_SEL, ///<
        GS,      ///<
        GS_ARM   ///<
    };

    /** Altimeter pressure units. */
    enum class PressureMode {
        STD = 0, ///< standard (displays STD instead of numerical value)
        MB,      ///< milibars
        IN       ///< inches of mercury
    };

    /** Course Deviation Indicator (CDI). */
    enum class CDI {
        Off = 0, ///<
        TO,      ///<
        FROM     ///<
    };

    double angleOfAttack() const;
    void setAngleOfAttack(double newAngleOfAttack);

    double angleOfSideSlip() const;
    void setAngleOfSideSlip(double newAngleOfSideSlip);

    double roll() const;
    void setRoll(double newRoll);

    double pitch() const;
    void setPitch(double newPitch);

    double heading() const;
    void setHeading(double newHeading);

    double slipSkid() const;
    void setSlipSkid(double newSlipSkid);

    double turnRate() const;
    void setTurnRate(double newTurnRate);

    double airspeed() const;
    void setAirspeed(double newAirspeed);

    double machNumber() const;
    void setMachNumber(double newMachNumber);

    double altitude() const;
    void setAltitude(double newAltitude);

    double pressure() const;
    void setPressure(double newPressure);

    double climbRate() const;
    void setClimbRate(double newClimbRate);

    double ilsLOC() const;
    void setIlsLOC(double newIlsLOC);

    double ilsGS() const;
    void setIlsGS(double newIlsGS);

    double fdRoll() const;
    void setFdRoll(double newFdRoll);

    double fdPitch() const;
    void setFdPitch(double newFdPitch);

    double altitudeBug() const;
    void setAltitudeBug(double newAltitudeBug);

    double airspeedBug() const;
    void setAirspeedBug(double newAirspeedBug);

    double headingBug() const;
    void setHeadingBug(double newHeadingBug);

    double course() const;
    void setCourse(double newCourse);

    double vorDeviation() const;
    void setVorDeviation(double newVorDeviation);

    double bearing() const;
    void setBearing(double newBearing);

    double dmeDistance() const;
    void setDmeDistance(double newDmeDistance);

    int pressureMode() const;
    void setPressureMode(PrimaryFlightData::PressureMode newPressureMode);

    int flightMode() const;
    void setFlightMode(PrimaryFlightData::FlightMode newFlightMode);

    int speedMode() const;
    void setSpeedMode(PrimaryFlightData::SpeedMode newSpeedMode);

    int lateralNavigationMode() const;
    void setLateralNavigationMode(PrimaryFlightData::LNAV newLateralNavigationMode);

    int verticalNavigationMode() const;
    void setVerticalNavigationMode(PrimaryFlightData::VNAV newVerticalNavigationMode);

    int courseDeviationIndicatorMode() const;
    void setCourseDeviationIndicatorMode(PrimaryFlightData::CDI newCourseDeviationIndicatorMode);

    bool fdVisible() const;
    void setFdVisible(bool newFdVisible);

    bool ilsLOCVisible() const;
    void setIlsLOCVisible(bool newIlsLOCVisible);

    bool ilsGSVisible() const;
    void setIlsGSVisible(bool newIlsGSVisible);

    bool stall() const;
    void setStall(bool newStall);

    double leftTankFuel() const;
    void setLeftTankFuel(double newLeftTankFuel);

    double rightTankFuel() const;
    void setRightTankFuel(double newRightTankFuel);

    double egt() const;
    void setEgt(double newEgt);

    double fuelFlow() const;
    void setFuelFlow(double newFuelFlow);

    double engineTemperature() const;
    void setEngineTemperature(double newEngineTemperature);

    double enginePressure() const;
    void setEnginePressure(double newEnginePressure);

    double vac() const;
    void setVac(double newVac);

    double amp() const;
    void setAmp(double newAmp);

    double rpm() const;
    void setRpm(double newRpm);

signals:
    void angleOfAttackChanged();
    void angleOfSideSlipChanged();
    void rollChanged();
    void pitchChanged();
    void headingChanged();
    void slipSkidChanged();
    void turnRateChanged();
    void airspeedChanged();
    void machNumberChanged();
    void altitudeChanged();
    void pressureChanged();
    void climbRateChanged();

    void ilsLOCChanged();
    void ilsGSChanged();
    void fdRollChanged();
    void fdPitchChanged();
    void altitudeBugChanged();
    void airspeedBugChanged();
    void headingBugChanged();
    void courseChanged();
    void vorDeviationChanged();
    void bearingChanged();
    void dmeDistanceChanged();

    void flightModeChanged();
    void speedModeChanged();
    void lateralNavigationModeChanged();
    void verticalNavigationModeChanged();
    void courseDeviationIndicatorModeChanged();

    void stallChanged();
    void fdVisibleChanged();
    void pressureModeChanged();
    void ilsLOCVisibleChanged();
    void ilsGSVisibleChanged();

    void leftTankFuelChanged();

    void rightTankFuelChanged();

    void egtChanged();

    void fuelFlowChanged();

    void engineTemperatureChanged();

    void enginePressureChanged();

    void vacChanged();

    void ampChanged();

    void rpmChanged();

private:
    double mAngleOfAttack;
    double mAngleOfSideSlip;
    double mRoll;
    double mPitch;
    double mHeading;
    double mSlipSkid;
    double mTurnRate;
    double mAirspeed;
    double mMachNumber;
    double mAltitude;
    double mPressure;
    double mClimbRate;

    double mIlsLOC;
    double mIlsGS;
    double mFdRoll;
    double mFdPitch;
    double mAltitudeBug;
    double mAirspeedBug;
    double mHeadingBug;
    double mCourse;
    double mVorDeviation;
    double mBearing;
    double mDmeDistance;

    int mPressureMode;
    int mFlightMode;
    int mSpeedMode;
    int mLateralNavigationMode;
    int mVerticalNavigationMode;
    int mCourseDeviationIndicatorMode;

    bool mIlsLOCVisible;
    bool mIlsGSVisible;
    bool mFdVisible;
    bool mStall;

    // Misc
    double mLeftTankFuel;
    double mRightTankFuel;
    double mEgt;
    double mFuelFlow;
    double mEngineTemperature;
    double mEnginePressure;
    double mVac;
    double mAmp;
    double mRpm;

    Q_PROPERTY(double angleOfAttack READ angleOfAttack NOTIFY angleOfAttackChanged)
    Q_PROPERTY(double angleOfSideSlip READ angleOfSideSlip NOTIFY angleOfSideSlipChanged)
    Q_PROPERTY(double roll READ roll NOTIFY rollChanged)
    Q_PROPERTY(double pitch READ pitch NOTIFY pitchChanged)
    Q_PROPERTY(double heading READ heading NOTIFY headingChanged)
    Q_PROPERTY(double slipSkid READ slipSkid NOTIFY slipSkidChanged)
    Q_PROPERTY(double turnRate READ turnRate NOTIFY turnRateChanged)
    Q_PROPERTY(double airspeed READ airspeed NOTIFY airspeedChanged)
    Q_PROPERTY(double machNumber READ machNumber NOTIFY machNumberChanged)
    Q_PROPERTY(double altitude READ altitude NOTIFY altitudeChanged)
    Q_PROPERTY(double pressure READ pressure NOTIFY pressureChanged)
    Q_PROPERTY(double climbRate READ climbRate NOTIFY climbRateChanged)

    Q_PROPERTY(double ilsLOC READ ilsLOC NOTIFY ilsLOCChanged)
    Q_PROPERTY(double ilsGS READ ilsGS NOTIFY ilsGSChanged)
    Q_PROPERTY(double fdRoll READ fdRoll NOTIFY fdRollChanged)
    Q_PROPERTY(double fdPitch READ fdPitch NOTIFY fdPitchChanged)
    Q_PROPERTY(double altitudeBug READ altitudeBug NOTIFY altitudeBugChanged)
    Q_PROPERTY(double airspeedBug READ airspeedBug NOTIFY airspeedBugChanged)
    Q_PROPERTY(double headingBug READ headingBug NOTIFY headingBugChanged)
    Q_PROPERTY(double course READ course NOTIFY courseChanged)
    Q_PROPERTY(double vorDeviation READ vorDeviation NOTIFY vorDeviationChanged)
    Q_PROPERTY(double bearing READ bearing NOTIFY bearingChanged)
    Q_PROPERTY(double dmeDistance READ dmeDistance NOTIFY dmeDistanceChanged)

    Q_PROPERTY(int pressureMode READ pressureMode NOTIFY pressureModeChanged)
    Q_PROPERTY(int flightMode READ flightMode NOTIFY flightModeChanged)
    Q_PROPERTY(int speedMode READ speedMode NOTIFY speedModeChanged)
    Q_PROPERTY(int lateralNavigationMode READ lateralNavigationMode NOTIFY lateralNavigationModeChanged)
    Q_PROPERTY(int verticalNavigationMode READ verticalNavigationMode NOTIFY verticalNavigationModeChanged)
    Q_PROPERTY(int courseDeviationIndicatorMode READ courseDeviationIndicatorMode NOTIFY courseDeviationIndicatorModeChanged)

    Q_PROPERTY(bool ilsLOCVisible READ ilsLOCVisible NOTIFY ilsLOCVisibleChanged)
    Q_PROPERTY(bool ilsGSVisible READ ilsGSVisible NOTIFY ilsGSVisibleChanged)
    Q_PROPERTY(bool stall READ stall NOTIFY stallChanged)
    Q_PROPERTY(bool fdVisible READ fdVisible NOTIFY fdVisibleChanged)

    Q_PROPERTY(double leftTankFuel READ leftTankFuel WRITE setLeftTankFuel NOTIFY leftTankFuelChanged)
    Q_PROPERTY(double rightTankFuel READ rightTankFuel WRITE setRightTankFuel NOTIFY rightTankFuelChanged)
    Q_PROPERTY(double egt READ egt WRITE setEgt NOTIFY egtChanged)
    Q_PROPERTY(double fuelFlow READ fuelFlow WRITE setFuelFlow NOTIFY fuelFlowChanged)
    Q_PROPERTY(double engineTemperature READ engineTemperature WRITE setEngineTemperature NOTIFY engineTemperatureChanged)
    Q_PROPERTY(double enginePressure READ enginePressure WRITE setEnginePressure NOTIFY enginePressureChanged)
    Q_PROPERTY(double vac READ vac WRITE setVac NOTIFY vacChanged)
    Q_PROPERTY(double amp READ amp WRITE setAmp NOTIFY ampChanged)
    Q_PROPERTY(double rpm READ rpm WRITE setRpm NOTIFY rpmChanged)
};

#endif // PRIMARYFLIGHTDATA_H
