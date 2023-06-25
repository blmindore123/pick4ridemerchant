import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class ApiCall{
  static Future<UserModel> verifyOtpApi(String countryCode, phoneNumber, role, deviceId, otp) async {
    Map params = {
      "country_code": countryCode,
      "phone_number": phoneNumber,
      "otp": otp,
      "role": role,
      "device_id": deviceId,
      "device_type": "android",
      "certification_type": "development"
    };
    var body = jsonEncode(params);
    http.Response response = await http.post(Uri.parse(AppConstants.VERIFY_OTP),
        headers: {"Content-Type": "application/json"}, body: body);
    if (kDebugMode) {
      print('verify otp >>>>>>$body');
      print('verify otp >>>>>${response.body}');
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      return user;
    }
  }
}