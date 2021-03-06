import 'package:airq_jyv/data/models/airq_data_model.dart';

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