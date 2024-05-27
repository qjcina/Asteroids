#include <FelgoApplication>
#include <QApplication>

#include <QQmlApplicationEngine>

#ifdef LIVE_BUILD
#include <FelgoLiveClient>
#endif

int main(int argc, char* argv[])
{

    QApplication app(argc, argv);

    FelgoApplication felgo;
    felgo.setPreservePlatformFonts(false);

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

#ifdef LIVE_BUILD
    FelgoLiveClient client(&engine);
#else
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
#endif
    return app.exec();
}
