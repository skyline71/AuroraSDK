const WebSocket = require('ws');
const wsServer = new WebSocket.Server({ port: 9000 });

wsServer.on('connection', onConnect);

function onConnect(wsClient) {
    console.log('Новый пользователь');
    wsClient.send('Привет, Новый пользователь');

    wsClient.on('close', function() {
        console.log('Пользователь отключился');
    });

    wsClient.on('message', function(message) {
        console.log(message.toString())
        try {
            const jsonMessage = JSON.parse(message);
            wsClient.send(jsonMessage.data);
        } catch (error) {
            console.log('Ошибка', error);
        }
    });
}

console.log('Сервер запущен на порту 9000');