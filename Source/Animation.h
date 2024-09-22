#ifndef ANIMATION_H
#define ANIMATION_H

#include "PrimaryFlightData.h"

#include <QObject>
#include <QTimer>

class Animation : public QObject
{
    Q_OBJECT
public:
    explicit Animation(QObject *parent = nullptr);

    void setPfd(PrimaryFlightData *newPfd);

public slots:
    void update();
    void init();

private:
    PrimaryFlightData *mPfd;
    QTimer mTimer;
    double mPlayTime;
    quint64 mPreviousTime;
};

#endif // ANIMATION_H
