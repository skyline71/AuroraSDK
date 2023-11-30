import QtPositioning 5.3

PositionSource {
    updateInterval: 30000
    nmeaSource: "../../nmea/path.nmea"
    active: true
}
