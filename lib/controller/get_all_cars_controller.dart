import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/drive_category.dart';
import '../classes/getallcars.dart';

class GetAllCarsController extends GetxController {

  var isLoading = false.obs;
  GetAllCars? getAllCars;
  late SharedPreferences prefs;
  String? token;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
    initSharedPref();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  fetchData() async {
    try {
      isLoading(true);
      var valTok = await getToken();
      var url = Uri.parse(AppConstants.BASE_URL+'/merchant/vehicles');
      print('token h yr: $valTok');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $valTok',
      });
      print(response);
      print(response.body);
      print('Token in cat page : $valTok');

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        getAllCars = GetAllCars.fromJson(result);
      }
      else {
        print('error fetching data');
      }
    }
    catch (e) {
      print('Error while getting data is $e');
    }
    finally {
      isLoading(false);
    }
  }

  Future<String?> getToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }
}