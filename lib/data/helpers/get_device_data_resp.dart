class DeviceDataResponse {
  final bool success;
  final List<DeviceData> dataList;

  DeviceDataResponse({required this.success, required this.dataList});

  factory DeviceDataResponse.fromMap(Map<String, dynamic> map) {
    List<DeviceData> mDataList = [];
    map['data'].forEach((v) {
      mDataList.add(DeviceData.fromMap(v));
    });
    return DeviceDataResponse(success: map['success'], dataList: mDataList);
  }
}

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

  Geometry({required this.lat, required this.lng});
  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(lat: map['coordinates'][1], lng: map['coordinates'][0]);
  }
}




// {
//     "success": true,
//     "data": [
//         {
//             "_id": "61b0c3135ed0151c7cc65437",
//             "qualityIndex": 100,
//             "deviceId": "1234",
//             "geometry": {
//                 "type": "Point",
//                 "_id": "61b0c3135ed0151c7cc65438",
//                 "coordinates": [
//                     76.18627993137942,
//                     10.148946589327252
//                 ]
//             },
//             "timestamp": "2021-12-08T14:34:52.670Z",
//             "safety": "Moderate",
//             "colorCode": "Yellow",
//             "__v": 0
//         }
//     ]
// }