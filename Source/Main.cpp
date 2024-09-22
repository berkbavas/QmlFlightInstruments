#include "Animation.h"
#include "PrimaryFlightData.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url1(QStringLiteral("qrc:/Qml/BasicSix.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url1](QObject *obj, const QUrl &objUrl) {
            if (!obj && url1 == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    const QUrl url2(QStringLiteral("qrc:/Qml/EFIS.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url2](QObject *obj, const QUrl &objUrl) {
            if (!obj && url2 == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    const QUrl url3(QStringLiteral("qrc:/Qml/Misc.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url3](QObject *obj, const QUrl &objUrl) {
            if (!obj && url3 == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    PrimaryFlightData *pfd = new PrimaryFlightData;
    Animation *animation = new Animation;
    animation->setPfd(pfd);

    engine.rootContext()->setContextProperty("pfd", pfd);
    engine.load(url1);
    engine.load(url2);
    engine.load(url3);

    animation->init();

    return app.exec();
}
