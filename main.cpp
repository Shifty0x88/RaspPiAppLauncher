#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QDebug>
//#include "qdeclarative.h"
#include <QDeclarativeView>
#include <QDeclarativeContext>

#include "procExec.h"




int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //QmlApplicationViewer viewer;
    //viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    //viewer.setMainQmlFile(QLatin1String("qml/untitled2/main.qml"));
    //viewer.showExpanded();
    QDeclarativeView viewer;
    ProcExec processExecuter;
    viewer.rootContext()->setContextProperty("processExecute", &processExecuter);
    viewer.setSource(QUrl::fromLocalFile("qml/RaspPiApp/main.qml"));


    viewer.show();


    return app.exec();
}
