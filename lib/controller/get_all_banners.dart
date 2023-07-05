import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/banners/bannerslistmodel.dart';
import '../classes/drive_category.dart';
import '../constants/appconst.dart';

class BannersGetController extends GetxController {

  //VehicleCategory
  var isLoading = false.obs;
  BannersListModel? bannersListModel;
  late SharedPreferences prefs;
  String? token;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchBanners();
    initSharedPref();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  fetchBanners() async {
    try {
      isLoading(true);

      // String? valTok = prefs.getString('token');
      // print('drive cart token : $valTok');
      var valTok = await getToken();
      var url = Uri.parse(AppConstants.BASE_URL+'/banners');
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
        bannersListModel = BannersListModel.fromJson(result);
      }
      else {
        print('error fetching banners data');
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