#include <QtQuick>
#include <sailfishapp.h>
#include "NoGravityAccelerometer.h"


int main(int argc, char *argv[])
{
    // ToDo: register NoGravityAccelerometer class
    qmlRegisterType<NoGravityAccelerometer>("Sensors", 1, 0, "NoGravityAccelerometer");
    return SailfishApp::main(argc, argv);
}
