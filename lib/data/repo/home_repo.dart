import 'dart:convert';

import 'package:airq_jyv/data/helpers/get_device_data_resp.dart';
import 'package:airq_jyv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepo {
  Future<DeviceDataResponse> getDeviceData(String deviceId) async {
    final response = await http.get(
      Uri.parse(
          '$BASE_URL/api/getDeviceData?apiKey=${dotenv.env['API_KEY']}&deviceId=$deviceId'),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //debugPrint(response.body);
      debugPrint(response.body);
      return DeviceDataResponse.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      debugPrint(response.body);
      throw Exception('Failed to fetch');
    }
  }
}
