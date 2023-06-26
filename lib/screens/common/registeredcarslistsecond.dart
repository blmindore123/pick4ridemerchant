import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:pick4ridemerchant/controller/get_all_cars_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../classes/getallcars.dart';
import '../../classes/imageres.dart';
import '../bike/bike_details.dart';
import '../bike/edit_bike.dart';
import '../car/car_details.dart';
import '../car/edit_car.dart';
import '../login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../tuktuk/edit_tuktuk.dart';
import '../tuktuk/tuktuk_details.dart';
import '../van/edit_van.dart';
import '../van/van_details.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _result;

  GetAllCarsController getAllCarsController = Get.put(GetAllCarsController());
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   initSharedPref();
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) {
  //     getAllCarsController.fetchData();
  //     setState(() {});
  //   });
  // }

  // void initSharedPref() async{
  //   prefs = await SharedPreferences.getInstance();
  //   toke = prefs.getString('token');
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search'),
      flexibleSpace: GestureDetector(
          onTap: () async{
            var result = await showSearch<String>(
              context: context,
              delegate: CustomDelegate(),
            );
            setState(() => _result = result);
    },
      ),
      ),


      body: Center(
        child: Column(
          children: <Widget>[
            if(_result == null)
              Text("Please Search") else Text(_result ?? ''),

          ],
        ),
      ),
    );
  }
}











class CustomDelegate extends SearchDelegate<String> {

  List<String> data = ['Apple','Mango','Banana','Pine Apple'];

  @override
  List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    if (query.isNotEmpty)
      listToShow = data.where((e) => e.contains(query) && e.startsWith(query)).toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onTap: () => close(context, noun),
        );
      },
    );
  }
}
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/src/response.dart';
// import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:pick4ridemerchant/constants/appconst.dart';
// import 'package:pick4ridemerchant/controller/get_all_cars_controller.dart';
// import 'package:pick4ridemerchant/screens/common/userdetails.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../classes/getallcars.dart';
// import '../../classes/imageres.dart';
// import '../bike/bike_details.dart';
// import '../bike/edit_bike.dart';
// import '../car/car_details.dart';
// import '../car/edit_car.dart';
// import '../login_otp.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:get/get_core/src/get_main.dart';
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../tuktuk/edit_tuktuk.dart';
// import '../tuktuk/tuktuk_details.dart';
// import '../van/edit_van.dart';
// import '../van/van_details.dart';
//
// class RegisteredCarsListSecond extends StatefulWidget {
//
//   final String? token;
//   const RegisteredCarsListSecond({
//     @required this.token,
//     Key? key,
//   }) : super(key: key);
//   @override
//   _RegisteredCarsListSecondState createState() => _RegisteredCarsListSecondState();
// }
//
// class _RegisteredCarsListSecondState extends State<RegisteredCarsListSecond> {
//
//
//   List<UserDetails> _searchResult = [];
//   List<UserDetails> _userDetails = [];
//   TextEditingController controller = new TextEditingController();
//
//   // Get json result and convert it to model. Then add
//   Future<Null> getUserDetails() async {
//
//     var url = Uri.parse(AppConstants.BASE_URL+'/merchant/vehicles');
//     var valTok = await getToken();
//     final response = await http.get(url, headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $valTok',
//     });
//    // final responseJson = json.decode(response.body);
//
//     var result = jsonDecode(response.body);
//     _userDetails.add(UserDetails.fromJson(result));
//
//     setState(() {
//       // for (Map user in responseJson) {
//       // //  _userDetails.add(UserDetails.fromJson(user));
//       //
//       // }
//     });
//
//   }
//
//
//
//
//   final _formKey = GlobalKey<FormState>();
//   late SharedPreferences prefs;
//   String? multi;
//   String? token;
//   GetAllCars? getAllCars;
//
//
//   TextEditingController textcontroller = new TextEditingController();
//
//   // List<Map<String,dynamic>> _allUsers = [];
//   //
//   //
//   // List<Map<String,dynamic>> _foundUsers = [];
//
//   String? toke;
//
//   @override
//   void initState() {
//     super.initState();
//
//     initSharedPref();
//
//     checkToken();
//
//     getUserDetails();
//
//     WidgetsBinding.instance
//         .addPostFrameCallback((_) {
//       getAllCarsController.fetchData();
//
//
//       setState(() {
//       });
//     });
//
//
//
//
//
//
//
//   }
//
//
//
//
//
//   void initSharedPref() async{
//     prefs = await SharedPreferences.getInstance();
//
//     toke = prefs.getString('token');
//   }
//
//   // void _runFilter(String enteredKeyword){
//   //   List<Map<String,dynamic>> results = [];
//   //   if(enteredKeyword.isEmpty){
//   //     results = _allUsers;
//   //   }else{
//   //     results = _allUsers.where((user) => user["name"].toLowerCase().contains(enteredKeyword).toLowerCase()).toList();
//   //   }
//   //   setState(() {
//   //     _foundUsers = results;
//   //   });
//   // }
//
//
//
//   GetAllCarsController getAllCarsController = Get.put(GetAllCarsController());
//
//   String radioButtonItem = 'Self Driverrr';
//   int id = 11;
//   bool isSwitched = false;
//   int idvehicletype = 21;
//   int idac = 31;
//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile> imageFileList = [];
//   List<String> imagesgroup = [];
//   XFile? image1;
//   XFile? image2;
//   XFile? image3;
//   XFile? image4;
//   bool agree = false;
//   String? respo;
//   String? respo2;
//   String? respo3;
//   String? respo4;
//   Imageresp? imageresp;
//   String? firstimage;
//   String? secondimage;
//   String? thirdimage;
//   String? fourthimage;
//   List<File> selectedImagesnew = [];
//   List<String> imagesarr = [];
//   String? xval;
//   String? one;
//   String? two;
//   String? three;
//   String? four;
//   String? five;
//   List<String> suggestons = [];
//   String? _result;
//
//   String? checktoken;
//
//   //
//
//
//   Widget _buildUsersList() {
//     return new ListView.builder(
//       itemCount: _userDetails.length,
//       itemBuilder: (context, index) {
//         return new Card(
//           child: new ListTile(
//         //     leading: new CircleAvatar(
//         //       backgroundImage: new NetworkImage(
//         // //        _userDetails[index].profileUr,
//         //
//         //       ),
//         //     ),
//             title: new Text(
//                 // _userDetails[index].firstName + ' ' +
//                 // _userDetails[index].lastName
//             _userDetails[index].data[index].brandModel
//
//             ),
//           ),
//           margin: const EdgeInsets.all(0.0),
//         );
//       },
//     );
//   }
//
//   Widget _buildSearchResults() {
//     return new ListView.builder(
//       itemCount: _searchResult.length,
//       itemBuilder: (context, i) {
//         return new Card(
//           child: new ListTile(
//             // leading: new CircleAvatar(
//             //   backgroundImage: new NetworkImage(
//             //     _searchResult[i].toString(),
//             //   ),
//             // ),
//             title: new Text(
//            //     _searchResult[i].firstName + ' ' +_searchResult[i].lastName),
//             _searchResult[i].data[i].brandModel
//             ),
//             ),
//           margin: const EdgeInsets.all(0.0),
//         );
//       },
//     );
//   }
//
//   Widget _buildSearchBox() {
//     return new Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: new Card(
//         child: new ListTile(
//           leading: new Icon(Icons.search),
//           title: new TextField(
//             controller: controller,
//             decoration: new InputDecoration(
//                 hintText: 'Search', border: InputBorder.none),
//             onChanged: onSearchTextChanged,
//           ),
//           trailing: new IconButton(
//             icon: new Icon(Icons.cancel),
//             onPressed: () {
//               controller.clear();
//               onSearchTextChanged('');
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBody() {
//     return new Column(
//       children: <Widget>[
//         new Container(
//             color: Theme.of(context).primaryColor, child: _buildSearchBox()),
//         new Expanded(
//             child: _searchResult.length != 0 || controller.text.isNotEmpty
//                 ? _buildSearchResults()
//                 : _buildUsersList()),
//       ],
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Home'),
//         elevation: 0.0,
//       ),
//       body: _buildBody(),
//      // resizeToAvoidBottomPadding: true,
//     );
//   }
//
//
//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }
//
//     for (var i = 1; i <  _userDetails.length ; i++) {
//       _userDetails.forEach((userDetail) {
//         if (userDetail.data[i].brandModel.contains(text)
//         ) _searchResult.add(userDetail);
//       });
//       break;
//     }
//
//     setState(() {});
//   }
//
//
//
//
//
//
//
//
//
//
//   void logOut(
//       String valToken
//       ) async {
//     try{
//       Response response = await post(
//           Uri.parse('http://pick4ride.com/api/logout'),
//           headers: {
//             'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
//           }
//       );
//       if(response.statusCode == 200){
//         //    Map<String,dynamic> veri = json.decode(response.body);
//         print(response.body.toString());
//         print(response.toString());
//         prefs.remove('token');
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
//       }
//       else {
//         print('failed');
//         print(response.body.toString());
//         print(response.toString());
//         print(valToken);
//       }
//     }
//     catch(e){
//       print(e.toString());
//     }
//   }
//
//
//   Widget _buildPopupDialog(BuildContext context) {
//     return new AlertDialog(
//       title: const Text('Are you sure you want to sign out?'),
//       content: new Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//
//         ],
//       ),
//       actions: <Widget>[
//         new ElevatedButton(
//           onPressed: () {
//             String? valTok = prefs.getString('token');
//             print("signout: $valTok");
//             logOut(valTok!);
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
//           },
//           child: const Text('Yes'),
//         ),
//         new ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('No'),
//         ),
//
//       ],
//     );
//   }
//
//
//   Future<String?> getToken() async{
//     final SharedPreferences preferences = await SharedPreferences.getInstance();
//     return preferences.getString('token');
//   }
//
//
//
//   checkToken() async{
//     final SharedPreferences preferences = await SharedPreferences.getInstance();
//     checktoken = preferences.getString('token');
//
//     if(checktoken == null){
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
//     }
//     else{
//       print("kjkln");
//     }
//
//   }
//
//
//
//
//
//
// }
//
// class CustomDelegate extends SearchDelegate<String> {
//
//
//   List<String> data = ['apple','mango','pineapple','apple'];
//
//   @override
//   List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
//
//   @override
//   Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));
//
//   @override
//   Widget buildResults(BuildContext context) => Container();
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     var listToShow;
//     if (query.isNotEmpty)
//       listToShow = data.where((e) => e.contains(query) && e.startsWith(query)).toList();
//     else
//       listToShow = data;
//
//     return ListView.builder(
//       itemCount: listToShow.length,
//       itemBuilder: (_, i) {
//         var noun = listToShow[i];
//         return ListTile(
//           title: Text(noun),
//           onTap: () => close(context, noun),
//         );
//       },
//     );
//   }
// }