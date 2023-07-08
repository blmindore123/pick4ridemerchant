import 'package:flutter/material.dart';

class AppConstants {
  static const String APP_NAME = "KK";
  static const int APP_Version = 1;

  static const String DEFAULT_IMAGE =
      "https://cdn.pixabay.com/photo/2017/11/10/05/24/add-2935429_1280.png";

  //static const String DEFAULT_IMAGE ="https://cdn.pixabay.com/photo/2017/11/10/05/24/add-2935429_1280.png";

  //  static const Image DEFAULT_IMAGE = Image(image: AssetImage("images/app_images/common_top.png"),fit: BoxFit.cover,);

  static const String BASE_URL = "http://pick4ride.com/api";
  static const String SEND_OTP = BASE_URL + "/send-otp";
  static const String VERIFY_OTP = BASE_URL + "/verify-otp";
  static const String RSEND_OTP = BASE_URL + "/resend-otp";
  static const String SIGNUP = BASE_URL + "/merchant/signup";
  static const String TOKEN = "Bearer ";
  static const String COUNTRY_CODE = "+91";
  static const String USER_ROLE = "merchant";
}
