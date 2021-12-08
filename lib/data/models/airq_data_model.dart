class DeviceData {
  final String id;
  final int aqi;
  final Geometry geo;
  final String timeStamp;
  final String safety;
  final String colorCode;
  factory DeviceData.fromMap(Map<String, dynamic> map) {
    return DeviceData(
        id: map['_id'],
        aqi: map['qualityIndex'],
        geo: Geometry.fromMap(map['geometry']),
        timeStamp: map['timestamp'],
        safety: map['safety'],
        colorCode: map['colorCode']);
  }

  DeviceData(
      {required this.id,
      required this.aqi,
      required this.geo,
      required this.timeStamp,
      required this.safety,
      required this.colorCode});
}

class Geometry {
  final double lat;
  final double lng;
  final String id;

  Geometry({required this.id,required this.lat, required this.lng});
  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(id:map['_id'],lat: map['coordinates'][1], lng: map['coordinates'][0]);
  }
}
