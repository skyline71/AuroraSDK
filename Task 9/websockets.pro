TARGET = websockets

QT += websockets

CONFIG += sailfishapp

SOURCES += \
    src/websockets.cpp \
    src/Base64.cpp \
    websocket-server-node/node_modules/utf-8-validate/deps/is_utf8/src/is_utf8.cpp \
    websocket-server-node/node_modules/utf-8-validate/src/validation.cc

HEADERS += \
    src/Base64.h \
    websocket-server-node/node_modules/utf-8-validate/deps/is_utf8/include/is_utf8.h

DISTFILES += \
    cover/DefaultCoverPage.qml \
    qml/* \
    qml/pages/Task1.qml \
    qml/pages/Task2.qml \
    qml/pages/Task3.qml \
    qml/pages/TestPage.qml \
    rpm/websockets.yaml \
    translations/*.ts \
    websocket-server-node/client.js \
    websocket-server-node/node_modules/.bin/node-gyp-build \
    websocket-server-node/node_modules/.bin/node-gyp-build-optional \
    websocket-server-node/node_modules/.bin/node-gyp-build-optional.cmd \
    websocket-server-node/node_modules/.bin/node-gyp-build-optional.ps1 \
    websocket-server-node/node_modules/.bin/node-gyp-build-test \
    websocket-server-node/node_modules/.bin/node-gyp-build-test.cmd \
    websocket-server-node/node_modules/.bin/node-gyp-build-test.ps1 \
    websocket-server-node/node_modules/.bin/node-gyp-build.cmd \
    websocket-server-node/node_modules/.bin/node-gyp-build.ps1 \
    websocket-server-node/node_modules/.package-lock.json \
    websocket-server-node/node_modules/node-gyp-build/LICENSE \
    websocket-server-node/node_modules/node-gyp-build/README.md \
    websocket-server-node/node_modules/node-gyp-build/bin.js \
    websocket-server-node/node_modules/node-gyp-build/build-test.js \
    websocket-server-node/node_modules/node-gyp-build/index.js \
    websocket-server-node/node_modules/node-gyp-build/node-gyp-build.js \
    websocket-server-node/node_modules/node-gyp-build/optional.js \
    websocket-server-node/node_modules/node-gyp-build/package.json \
    websocket-server-node/node_modules/utf-8-validate/LICENSE \
    websocket-server-node/node_modules/utf-8-validate/README.md \
    websocket-server-node/node_modules/utf-8-validate/binding.gyp \
    websocket-server-node/node_modules/utf-8-validate/deps/is_utf8/LICENSE-MIT \
    websocket-server-node/node_modules/utf-8-validate/deps/is_utf8/README.md \
    websocket-server-node/node_modules/utf-8-validate/fallback.js \
    websocket-server-node/node_modules/utf-8-validate/index.js \
    websocket-server-node/node_modules/utf-8-validate/package.json \
    websocket-server-node/node_modules/utf-8-validate/prebuilds/darwin-x64+arm64/node.napi.node \
    websocket-server-node/node_modules/utf-8-validate/prebuilds/linux-x64/node.napi.musl.node \
    websocket-server-node/node_modules/utf-8-validate/prebuilds/linux-x64/node.napi.node \
    websocket-server-node/node_modules/utf-8-validate/prebuilds/win32-ia32/node.napi.node \
    websocket-server-node/node_modules/utf-8-validate/prebuilds/win32-x64/node.napi.node \
    websocket-server-node/node_modules/ws/LICENSE \
    websocket-server-node/node_modules/ws/README.md \
    websocket-server-node/node_modules/ws/browser.js \
    websocket-server-node/node_modules/ws/index.js \
    websocket-server-node/node_modules/ws/lib/buffer-util.js \
    websocket-server-node/node_modules/ws/lib/constants.js \
    websocket-server-node/node_modules/ws/lib/event-target.js \
    websocket-server-node/node_modules/ws/lib/extension.js \
    websocket-server-node/node_modules/ws/lib/limiter.js \
    websocket-server-node/node_modules/ws/lib/permessage-deflate.js \
    websocket-server-node/node_modules/ws/lib/receiver.js \
    websocket-server-node/node_modules/ws/lib/sender.js \
    websocket-server-node/node_modules/ws/lib/stream.js \
    websocket-server-node/node_modules/ws/lib/subprotocol.js \
    websocket-server-node/node_modules/ws/lib/validation.js \
    websocket-server-node/node_modules/ws/lib/websocket-server.js \
    websocket-server-node/node_modules/ws/lib/websocket.js \
    websocket-server-node/node_modules/ws/package.json \
    websocket-server-node/node_modules/ws/wrapper.mjs \
    websocket-server-node/package-lock.json \
    websocket-server-node/package.json \
    websocket-server-node/server.js \
    websockets.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/websockets-ru.ts
