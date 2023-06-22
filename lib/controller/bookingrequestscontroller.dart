import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/bookingsrequestymodel.dart';
import '../classes/drive_category.dart';
import '../constants/appconst.dart';

class BookingListController extends GetxController {

  var isLoading = false.obs;
  BookingListModel? bookingListModel;
  late SharedPreferences prefs;
  String? token;

//  BookingListController? bookcars;


  @override
  Future<void> onInit() async {
    super.onInit();

    var booktype = await getBooktype();
    print("day1 saved id: $booktype");

    // var bookingcount = await getBookingcount();
    // print("book count: $bookingcount");



    fetchCarsBookingList(booktype ?? '',
    //    bookingcount ?? ''
    );

    initSharedPref();


  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }


  fetchCarsBookingList(String booktype,
      //String bookingcount
      ) async {
    try {
      isLoading(true);

      var valTok = await getToken();
      // var url = Uri.parse(AppConstants.BASE_URL+'/customer/booking/list');

      //status==all

//      var url = Uri.parse(AppConstants.BASE_URL+'/merchant/booking/list?limit=$bookingcount&booking_status=$booktype');
      var url = Uri.parse(AppConstants.BASE_URL+'/merchant/booking/list?limit=50&booking_status=$booktype');
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
        bookingListModel = BookingListModel.fromJson(result);

        print("ressssssssssssssssssssult $result");



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


  Future<String?> getBooktype() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('bookingname');
  }





  Future<String?> getBookingcount() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('bookingcount');
  }


}