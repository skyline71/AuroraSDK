#include <QtQuick>
#include <sailfishapp.h>
#include "Base64.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<Base64>("Base64", 1, 0, "Base64");
    return SailfishApp::main(argc, argv);
}
