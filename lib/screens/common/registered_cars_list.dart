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
import 'package:pick4ridemerchant/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../classes/getallvehicles.dart';
import '../../classes/imageres.dart';
import '../../controller/get_all_vehicles_controller.dart';
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

class RegisteredCarsList extends StatefulWidget {

  final String? token;
  const RegisteredCarsList({
    @required this.token,
    Key? key,
  }) : super(key: key);
  @override
  _RegisteredCarsListState createState() => _RegisteredCarsListState();
}

class _RegisteredCarsListState extends State<RegisteredCarsList> {


  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;
  String? multi;
  String? token;
  GetAllVehicles? getAllVehicles;


  TextEditingController controller = new TextEditingController();

  // List<Map<String,dynamic>> _allUsers = [];
  //
  //
  // List<Map<String,dynamic>> _foundUsers = [];

  String? toke;


  List<String> matches = <String>[];

  String? xvalue;
  String? zint;
  String? mint;

  String? selection;

  @override
  void initState() {
    super.initState();


    zint == '';

    initSharedPref();

    checkToken();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      getAllCarsController.fetchData();
      setState(() {
      });
    });

    // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
    // _firebaseMessaging.getToken().then((token){
    //   print("token is $token");
    // });

  }





  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();

    toke = prefs.getString('token');
  }

  // void _runFilter(String enteredKeyword){
  //   List<Map<String,dynamic>> results = [];
  //   if(enteredKeyword.isEmpty){
  //     results = _allUsers;
  //   }else{
  //     results = _allUsers.where((user) => user["name"].toLowerCase().contains(enteredKeyword).toLowerCase()).toList();
  //   }
  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }



  GetAllVehiclesController getAllCarsController = Get.put(GetAllVehiclesController());

  String radioButtonItem = 'Self Driverrr';
  int id = 11;
  bool isSwitched = false;
  int idvehicletype = 21;
  int idac = 31;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> imagesgroup = [];
  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;
  bool agree = false;
  String? respo;
  String? respo2;
  String? respo3;
  String? respo4;
  Imageresp? imageresp;
  String? firstimage;
  String? secondimage;
  String? thirdimage;
  String? fourthimage;
  List<File> selectedImagesnew = [];
  List<String> imagesarr = [];
  String? xval;
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  List<String> suggestons = [];
  String? _result;

  String? checktoken;

  //



  @override
  Widget build(BuildContext context) {


    List<String> suggestons = [];




    TextEditingController controller = TextEditingController();
    List suggestionList = [];
    String hint = "";

    List<String> nameList = <String>[
      'aardvark',
      'bobcat',
      'chameleon',
      'Nathaniel Bond',
      'Taylor Story',
      'Lamont Padilla',
      'Jamia Sun',
      'Nikki Reichert',
      'Tea Holguin',
      'Rafael Meade',
      'Mercedez Goad',
      'Aileen Foltz',
      'Bryant Burt',
    ];

    void typeAheadFilter(String value) {
      suggestionList.clear();

      if (value.isEmpty) {
        setState(() {});
        return;
      }

      for (String name in nameList) {
        if (name.toLowerCase().contains(value)) {
          suggestionList.add(name);
        }
      }

      if (suggestionList.isNotEmpty) {
        var firstSuggestion = suggestionList[0];

        setState(() => hint = firstSuggestion);
      }

      setState(() {});
    }




    // String? valTok = prefs.getString('token');
    // if(valTok == null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    // }

    return Scaffold(
      //  resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text("Registered Vehicles",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),


      // appBar: AppBar(title: Text('Search here'),
      //   flexibleSpace: GestureDetector(
      //     onTap: () async{
      //       var result = await showSearch<String>(
      //         context: context,
      //         delegate: CustomDelegate(),
      //       );
      //       setState(() => _result = result);
      //     },
      //   ),
      // ),


      endDrawer: MyDrawer(),
      backgroundColor: Colors.white,

      body:
      //  SingleChildScrollView(
      // physics: AlwaysScrollableScrollPhysics(),
      // child: RefreshIndicator(
      //   onRefresh: () async {
      //     setState(()
      //     {
      //
      //     }
      //     );
      //
      //   },
      //  child:
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Stack(
          children: [

            // child:
            Column(
              //    crossAxisAlignment: CrossAxisAlignment.center,
              //      mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                // SizedBox(
                //   height: 21,
                // ),

                // TextField(
                //   onChanged: (value) => _runFilter(value),
                //   decoration: InputDecoration(
                //     labelText: 'search',suffixIcon: Icon(Icons.search)),
                // ),


                // Padding(
                //   padding: EdgeInsets.all(15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //
                //       Text('Location',style: TextStyle(fontWeight: FontWeight.bold),),
                //       Text('change',style: TextStyle(color: Colors.blue),),
                //
                //     ],
                //   ),
                // ),

                Divider(color: Colors.black,),



                // Container(
                //   width: MediaQuery.of(context).size.width/2,
                //   height: 100,
                //   child: TextFormField(
                //     controller: controller,
                //     onFieldSubmitted: (value) {},
                //     onChanged: (value) => typeAheadFilter(value),
                //     decoration: InputDecoration(
                //         hintText: hint,
                //         labelText: hint.isEmpty ? "Search" : hint,
                //         alignLabelWithHint: true,
                //         hintTextDirection: TextDirection.rtl),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // if (suggestionList.isNotEmpty || controller.text.isNotEmpty) ...[
                //   Expanded(
                //     child: ListView.separated(
                //       padding: const EdgeInsets.all(10),
                //       shrinkWrap: true,
                //       itemCount: suggestionList.length,
                //       separatorBuilder: (context, index) => const Divider(),
                //       itemBuilder: (context, index) {
                //         return Text((suggestionList[index]));
                //       },
                //     ),
                //   )
                // ] else ...[
                //   Expanded(
                //     child: ListView.separated(
                //       padding: const EdgeInsets.all(10),
                //       shrinkWrap: true,
                //       itemCount: nameList.length,
                //       separatorBuilder: (context, index) => const Divider(),
                //       itemBuilder: (context, index) {
                //         return Text((nameList[index]));
                //       },
                //     ),
                //   )
                // ],






                //




                //

                Padding(
                  padding: EdgeInsets.all(15),
                  // child: Autocomplete<GetAllCars>(
                  //   optionsBuilder: (TextEditingValue textvalue){
                  //     int index = 1;
                  //
                  //     return getAllCars!.data!.where((element) => element.data.brandModel!.toLowerCase().contains(textvalue.text.toLowerCase())).toList();
                  //   },
                  // )

                  child: Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        xvalue = '';
                        print(xvalue);
                        return const Iterable<String>.empty();
                      }
                      else {
                        // List<String> matches = <String>[];
                        xvalue = 'hi';
                        matches.addAll(suggestons);
                        matches.retainWhere((s){
                          return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                        return matches;
                      }
                    },
                    onSelected: (selection) {
                      // print('You just selected $selection');
                      // //print(matches);
                      // print(suggestons);
                      if(selection != null){
                        zint = selection;
                        print("zint $selection");
                      }
                    },
                  ),
                ),


                SizedBox(
                  height: 11,
                ),

                Padding(
                    padding: EdgeInsets.only(left: 23,bottom: 11),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Obx(
                              () =>  getAllCarsController.isLoading.value
                              ? Center(
                            child: Text(""),
                          )
                              :       Text("${getAllCarsController.getAllVehicles?.data?.length.toString() ?? '0'} Vehicles",style: TextStyle(fontWeight: FontWeight.w300),)),


                    )

                ),



                //       if(getAllCarsController.getAllCars?.data?.length != null)







                Container(
                  child: Obx(
                        () =>
                    getAllCarsController.isLoading.value
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        :
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getAllCarsController.getAllVehicles?.data?.length ??  0,

                        //     itemCount: _foundUsers.length,
                        itemBuilder: (context,index){
                          //     _allUsers.add();

                          // suggestons.add(
                          //     getAllCarsController.getAllCars!.data[index].brandModel



                          Widget _dialogdeletevehicle(BuildContext context) {

                            return Stack(
                              children: [



                                Positioned(
                                  right: 30,
                                  left: 30,
                                  top: 220,
                                  // child: Padding(
                                  // padding: EdgeInsets.all(42),
                                  child: Card(
                                    elevation: 8,


                                    //    color: Colors.blue.shade500,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width, height: 200,

                                      child: Column(

                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Padding(
                                              padding: EdgeInsets.only(top: 31),
                                              child: Text("Are you sure you want to delete this vehicle?",softWrap: true,)),

                                          Material(
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(15),
                                                    child: Container(
                                                      height: 60,
                                                      width:  MediaQuery.of(context).size.width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape.circle
                                                      ),

                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),




                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () async{


                                                  // String? valTok = prefs.getString('token');
                                                  // print("signout: $valTok");


                                                  try{

                                                    int? vehicleId = getAllCarsController.getAllVehicles!.data[index].id;

                                                    var valToken = await getToken();
                                                    print("delete car $valToken");

                                                    Response response = await delete(
                                                        Uri.parse(AppConstants.BASE_URL+'/merchant/vehicles/$vehicleId'),
                                                        headers: {
                                                          'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
                                                        }
                                                    );
                                                    if(response.statusCode == 200){
                                                      print(response.body.toString());

                                                      var result = jsonDecode(response.body);

                                                      setState(() {
                                                        getAllCarsController.getAllVehicles!.data.removeAt(index);
                                                      });

                                                      getAllVehicles = GetAllVehicles.fromJson(result);


                                                    }
                                                    else {
                                                      print('failed');
                                                      print(response.body.toString());
                                                      print(response.toString());
                                                      print(valToken);
                                                    }
                                                  }
                                                  catch(e){
                                                    print(e.toString());
                                                  }


                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisteredCarsList(token: token)));

                                                },
                                                style: ButtonStyle(

                                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(31),
                                                            side: BorderSide(color: Colors.redAccent)
                                                        )
                                                    )
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.all(4),
                                                    child: Text('YES',style: TextStyle(fontWeight: FontWeight.bold),)

                                                ),
                                              ),




                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ButtonStyle(

                                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(31),
                                                            side: BorderSide(color: Colors.blue)
                                                        )
                                                    )
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.all(4),
                                                    child: Text('NO',style: TextStyle(fontWeight: FontWeight.bold),)

                                                ),
                                              ),
                                            ],
                                          )


                                        ],
                                      ),



                                    ),
                                  ),
                                  // ),
                                ),


                                Positioned(
                                  right: 0,
                                  left: 310,
                                  top: 220,


                                  child: Align(
                                    //  alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            width: 55,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              // shape: BoxShape.circle
                                            ),
                                            child: Icon(Icons.close,color: Colors.red,)
                                        ),
                                      )
                                  ),

                                ),

                              ],
                            );

                          }








                          for(int i=0; i < getAllCarsController.getAllVehicles!.data.length; i++){
                            suggestons.add(getAllCarsController.getAllVehicles!.data[i].brandModel);
                          }


                          // List<String> modelname = [];
                          // modelname.add(getAllCarsController.getAllCars!.data[index].brandModel);
                          // print(modelname);



                          // void list(){
                          //   List<String> modelname = [];
                          //   modelname.add(getAllCarsController.getAllCars!.data[index].brandModel);
                          //   print(modelname);
                          // }

                          // print(list);




                          List<Widget> mywidget = [];

                          //one insur
                          var imageinsurone = AppConstants.DEFAULT_IMAGE;
                          for (var i = 0; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageinsurone = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //two insur

                          var imageinsurtwo = AppConstants.DEFAULT_IMAGE;
                          print(imageinsurtwo);

                          for (var i = 1; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageinsurtwo = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }



                          //one rc
                          var imagercone = AppConstants.DEFAULT_IMAGE;
                          print(imagercone);

                          for (var i = 2; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagercone = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //two rc
                          var imagerctwo = AppConstants.DEFAULT_IMAGE;
                          print(imagerctwo);
                          for (var i = 3; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagerctwo = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //one veh
                          var imagevehone = AppConstants.DEFAULT_IMAGE;

                          print(imagevehone);

                          for (var i = 4; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagevehone = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //two veh
                          var imagevehtwo = AppConstants.DEFAULT_IMAGE;

                          print(imagevehtwo);

                          for (var i = 5; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagevehtwo = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //three veh
                          var imagevehthree = AppConstants.DEFAULT_IMAGE;

                          print(imagevehthree);

                          for (var i = 6; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagevehthree = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //four veh
                          var imagevehfour = AppConstants.DEFAULT_IMAGE;

                          print(imagevehfour);

                          for (var i = 7; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagevehfour = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }


                          //five veh
                          var imagevehfive = AppConstants.DEFAULT_IMAGE;

                          print(imagevehfive);

                          for (var i = 8; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagevehfive = getAllCarsController.getAllVehicles!.data[index]
                                .images[i].imageUrl;
                            break;
                          }




                          imagesgroup.add(imagevehone ?? '');
                          imagesgroup.add(imagevehtwo ?? '');
                          imagesgroup.add(imagevehthree ?? '');
                          imagesgroup.add(imagevehfour ?? '');
                          imagesgroup.add(imagevehfive ?? '');




                          //////////////////////
                          var imageinsuroneedit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 0; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageinsuroneedit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageinsurtwoedit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 1; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageinsurtwoedit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imagerconeedit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 2; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagerconeedit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imagerctwoedit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 3; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imagerctwoedit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageveh1edit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 4; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageveh1edit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageveh2edit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 5; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageveh2edit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageveh3edit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 6; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageveh3edit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageveh4edit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 7; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageveh4edit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }
                          var imageveh5edit = AppConstants.DEFAULT_IMAGE;
                          for (var i = 8; i <  getAllCarsController.getAllVehicles!.data[index].images.length ; i++) {
                            imageveh5edit = getAllCarsController.getAllVehicles!.data[index].images[i].image ?? '';
                            break;
                          }



                          print("this is image in var image: $imagevehone");
                          if(getAllCarsController.getAllVehicles!.data[index].images != null)
                            mywidget.add(
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Image.network(imagevehone,fit: BoxFit.cover,height: 93,width: 133,),
                              ),
                            );

                          else mywidget.add(
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),

                              child: Image.network(AppConstants.DEFAULT_IMAGE,fit: BoxFit.cover,height: 93,width: 133,),
                            ),
                          );

                          //  }



                          print(getAllCarsController.getAllVehicles?.data[index].id);
                          int? vehicledelid = getAllCarsController.getAllVehicles?.data[index].id;

                          //    prefs?.setString('vehicledelid', vehicledelid.toString());
                          //  print("ids $vehicledelid");



                          return Card(

                            //
                            //key: ValueKey(getAllCarsController.getAllCars!.data[index].brandModel),
                            // key: ValueKey(_foundUsers[index].brandModel),


                            //we have to replace each fields like
                            //getAllCarsController.getAllCars?.data[index].brandModel ?? 'no name'
                            //                          _foundUsers[index].brandModel
                            //
                            elevation: 60,
                            shadowColor: Colors.black,
                            color: Colors.white,

                            child: SizedBox(
                              width: 350,
                              height: 360,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no name'
                                          ,style: TextStyle(fontWeight: FontWeight.bold),),

                                        GestureDetector(
                                          onTap: () async{
                                            // print("top: $imagevehone top");
                                            // print(imagesgroup);
                                            var valToken = await getToken();
                                            print("edit car $valToken");

                                            if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Car"){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCar(
                                                token: valToken,
                                                id: vehicledelid,
                                                brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                priceinkm: getAllCarsController.getAllVehicles?.data[index].priceInKm.toString() ?? 'no',
                                                description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                vehno: getAllCarsController.getAllVehicles?.data[index].vehicleNo ?? 'no',
                                                imgs:  imageinsurone ?? '',
                                                imgs2: imageinsurtwo ?? '',
                                                imgs3: imagercone ?? '',
                                                imgs4: imagerctwo ?? '',
                                                imgs5: imagevehone ?? '',
                                                imgs6: imagevehtwo ?? '',
                                                imgs7: imagevehthree ?? '',
                                                imgs8: imagevehfour ?? '',
                                                imgs9: imagevehfive ?? '',
                                                editimgs:  imageinsuroneedit ?? '',
                                                editimgs2: imageinsurtwoedit ?? '',
                                                editimgs3: imagerconeedit ?? '',
                                                editimgs4: imagerctwoedit ?? '',
                                                editimgs5: imageveh1edit ?? '',
                                                editimgs6: imageveh2edit ?? '',
                                                editimgs7: imageveh3edit ?? '',
                                                editimgs8: imageveh4edit ?? '',
                                                editimgs9: imageveh5edit ?? '',
                                                insurance: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate ?? 'no',
                                                group: imagesgroup,
                                                drivetype: getAllCarsController.getAllVehicles?.data[index].rideCategory.id,

                                              )));
                                            }
                                            if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Bike"){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditBike(
                                                token: valToken,
                                                id: vehicledelid,
                                                brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                vehno: getAllCarsController.getAllVehicles?.data[index].vehicleNo ?? 'no',
                                                imgs:  imageinsurone ?? '',
                                                imgs2: imageinsurtwo ?? '',
                                                imgs3: imagercone ?? '',
                                                imgs4: imagerctwo ?? '',
                                                imgs5: imagevehone ?? '',
                                                imgs6: imagevehtwo ?? '',
                                                imgs7: imagevehthree ?? '',
                                                imgs8: imagevehfour ?? '',
                                                imgs9: imagevehfive ?? '',
                                                editimgs:  imageinsuroneedit ?? '',
                                                editimgs2: imageinsurtwoedit ?? '',
                                                editimgs3: imagerconeedit ?? '',
                                                editimgs4: imagerctwoedit ?? '',
                                                editimgs5: imageveh1edit ?? '',
                                                editimgs6: imageveh2edit ?? '',
                                                editimgs7: imageveh3edit ?? '',
                                                editimgs8: imageveh4edit ?? '',
                                                editimgs9: imageveh5edit ?? '',
                                                insurance: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate ?? 'no',
                                                group: imagesgroup,
                                                drivetype: getAllCarsController.getAllVehicles?.data[index].rideCategory.id,

                                              )));
                                            }
                                            if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Van"){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditVan(
                                                token: valToken,
                                                id: vehicledelid,
                                                brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                vehno: getAllCarsController.getAllVehicles?.data[index].vehicleNo ?? 'no',
                                                imgs:  imageinsurone ?? '',
                                                imgs2: imageinsurtwo ?? '',
                                                imgs3: imagercone ?? '',
                                                imgs4: imagerctwo ?? '',
                                                imgs5: imagevehone ?? '',
                                                imgs6: imagevehtwo ?? '',
                                                imgs7: imagevehthree ?? '',
                                                imgs8: imagevehfour ?? '',
                                                imgs9: imagevehfive ?? '',
                                                editimgs:  imageinsuroneedit ?? '',
                                                editimgs2: imageinsurtwoedit ?? '',
                                                editimgs3: imagerconeedit ?? '',
                                                editimgs4: imagerctwoedit ?? '',
                                                editimgs5: imageveh1edit ?? '',
                                                editimgs6: imageveh2edit ?? '',
                                                editimgs7: imageveh3edit ?? '',
                                                editimgs8: imageveh4edit ?? '',
                                                editimgs9: imageveh5edit ?? '',
                                                insurance: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate ?? 'no',
                                                group: imagesgroup,
                                                drivetype: getAllCarsController.getAllVehicles?.data[index].rideCategory.id,

                                              )));
                                            }
                                            if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Tuk-Tuk"){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTukTuk(
                                                token: valToken,
                                                id: vehicledelid,
                                                brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                vehno: getAllCarsController.getAllVehicles?.data[index].vehicleNo ?? 'no',
                                                imgs:  imageinsurone ?? '',
                                                imgs2: imageinsurtwo ?? '',
                                                imgs3: imagercone ?? '',
                                                imgs4: imagerctwo ?? '',
                                                imgs5: imagevehone ?? '',
                                                imgs6: imagevehtwo ?? '',
                                                imgs7: imagevehthree ?? '',
                                                imgs8: imagevehfour ?? '',
                                                imgs9: imagevehfive ?? '',
                                                editimgs:  imageinsuroneedit ?? '',
                                                editimgs2: imageinsurtwoedit ?? '',
                                                editimgs3: imagerconeedit ?? '',
                                                editimgs4: imagerctwoedit ?? '',
                                                editimgs5: imageveh1edit ?? '',
                                                editimgs6: imageveh2edit ?? '',
                                                editimgs7: imageveh3edit ?? '',
                                                editimgs8: imageveh4edit ?? '',
                                                editimgs9: imageveh5edit ?? '',
                                                insurance: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate ?? 'no',
                                                group: imagesgroup,
                                                drivetype: getAllCarsController.getAllVehicles?.data[index].rideCategory.id,

                                              )));
                                            }
                                            else{
                                              print("sss");
                                            }





                                            print("img $imagevehone img");
                                          },
                                          child: Container(
                                            width: 31,
                                            height: 31,
                                            decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                            child: Icon(Icons.edit_outlined,size: 15,),

                                          ),
                                        ),


                                      ],
                                    ),



                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text('or similar',style: TextStyle(fontWeight: FontWeight.w300),),

                                        GestureDetector(
                                          onTap: (){


                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) => _dialogdeletevehicle(context),
                                            );




                                          },
                                          child: Container(
                                            width: 31,
                                            height: 31,
                                            // decoration: BoxDecoration(
                                            //   color: Colors.black12,
                                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                                            // ),
                                            child: Icon(Icons.delete,size: 15,color: Colors.red,),

                                          ),
                                        ),


                                      ],
                                    ),


                                    SizedBox(
                                      height: 23,
                                    ),




                                    Row(
                                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Economy',style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),

                                        //Spacer(),


                                        SizedBox(
                                          width: 141,
                                        ),

                                        Text("SLRs. ${getAllCarsController.getAllVehicles?.data[index].price.toString() ??  'no name'}",style: TextStyle(fontWeight: FontWeight.bold),)


                                      ],
                                    ),

                                    SizedBox(height: 11,),


                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [

                                                SizedBox(
                                                  width: 2 ,
                                                ),

                                                Container(
                                                  width: 53,
                                                  height: 28
                                                  ,
                                                  color: Colors.black12,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5 ,
                                                      ),
                                                      Text(getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? '0',style: TextStyle(fontWeight: FontWeight.bold),),
                                                      SizedBox(
                                                        width: 5 ,
                                                      ),
                                                      Icon(Icons.person,color: Colors.black26,),
                                                    ],
                                                  ),
                                                ),


                                                SizedBox(
                                                  width: 2 ,
                                                ),

                                                Container(
                                                  width: 53,
                                                  height: 28,
                                                  color: Colors.black12,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5 ,
                                                      ),
                                                      Text(getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? '0',style: TextStyle(fontWeight: FontWeight.bold),),
                                                      SizedBox(
                                                        width: 5 ,
                                                      ),
                                                      Icon(Icons.food_bank_outlined,color: Colors.black26,),
                                                    ],
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          width: 91,
                                        ),

                                        Column(
                                          children: [
                                            Text(getAllCarsController.getAllVehicles?.data[index].vehicleNo ?? '',style: TextStyle(fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ],
                                    ),



                                    SizedBox(
                                      height: 21,
                                    ),


                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [


                                            Row(

                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.ac_unit),
                                                    SizedBox(height: 11,),
                                                    Icon(Icons.car_rental_outlined),
                                                    SizedBox(height: 11,),
                                                    Icon(Icons.propane_tank),
                                                  ],
                                                ),

                                                SizedBox(
                                                  width: 11,
                                                ),

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Air Conditioning',style: TextStyle(fontWeight: FontWeight.bold),),
                                                    SizedBox(height: 21,),
                                                    Text(getAllCarsController.getAllVehicles?.data[index].gearType ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
                                                    SizedBox(height: 21,),
                                                    Text(getAllCarsController.getAllVehicles?.data[index].fuelType ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),




                                          ],
                                        ),


                                        Spacer(),

                                        Container(
                                          width: MediaQuery.of(context).size.width/2.53,
                                          child: Column(

                                              children: mywidget

                                          ),
                                        ),
                                      ],
                                    ),

                                    //CircleAvatar
                                    const SizedBox(
                                      height: 26,
                                    ), //SizedBox





                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [


                                        SizedBox(
                                          width: 170,
                                          height: 31,
                                          child: ElevatedButton.icon(

                                            onPressed: () async{


                                              var valToken = await getToken();
                                              print("details car $valToken");

                                              if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Car")
                                              {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CarDetails(
                                                  token: valToken,
                                                  id: vehicledelid,
                                                  brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                  vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                  seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                  doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                  luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                  ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                  gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                  fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                  fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                  price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                  description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                  secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                  imgs:  imageinsurone ?? '',
                                                  imgs2: imageinsurtwo ?? '',
                                                  imgs3: imagercone ?? '',
                                                  imgs4: imagerctwo ?? '',
                                                  imgs5: imagevehone ?? '',
                                                  imgs6: imagevehtwo ?? '',
                                                  imgs7: imagevehthree ?? '',
                                                  imgs8: imagevehfour ?? '',
                                                  imgs9: imagevehfive ?? '',
                                                  insur: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate,

                                                  //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                )));
                                              }
                                              if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Bike")
                                              {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> BikeDetails(
                                                  token: valToken,
                                                  id: vehicledelid,
                                                  brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                  vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                  seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                  doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                  luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                  ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                  gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                  fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                  fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                  price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                  description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                  secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                  imgs:  imageinsurone ?? '',
                                                  imgs2: imageinsurtwo ?? '',
                                                  imgs3: imagercone ?? '',
                                                  imgs4: imagerctwo ?? '',
                                                  imgs5: imagevehone ?? '',
                                                  imgs6: imagevehtwo ?? '',
                                                  imgs7: imagevehthree ?? '',
                                                  imgs8: imagevehfour ?? '',
                                                  imgs9: imagevehfive ?? '',
                                                  insur: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate,

                                                  //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                )));
                                              }
                                              if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Van")
                                              {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VanDetails(
                                                  token: valToken,
                                                  id: vehicledelid,
                                                  brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                  vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                  seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                  doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                  luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                  ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                  gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                  fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                  fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                  price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                  description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                  secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                  imgs:  imageinsurone ?? '',
                                                  imgs2: imageinsurtwo ?? '',
                                                  imgs3: imagercone ?? '',
                                                  imgs4: imagerctwo ?? '',
                                                  imgs5: imagevehone ?? '',
                                                  imgs6: imagevehtwo ?? '',
                                                  imgs7: imagevehthree ?? '',
                                                  imgs8: imagevehfour ?? '',
                                                  imgs9: imagevehfive ?? '',
                                                  insur: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate,

                                                  //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                )));
                                              }
                                              if(getAllCarsController.getAllVehicles?.data[index].vehicleCategory.name == "Tuk-Tuk")
                                              {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> TukTukDetails(
                                                  token: valToken,
                                                  id: vehicledelid,
                                                  brandn: getAllCarsController.getAllVehicles?.data[index].brandModel ?? 'no',
                                                  vehicletype: getAllCarsController.getAllVehicles?.data[index].vehicleType ?? 'no',
                                                  seats: getAllCarsController.getAllVehicles?.data[index].noOfSeats.toString() ?? 'no',
                                                  doors: getAllCarsController.getAllVehicles?.data[index].noOfDoors.toString() ?? 'no',
                                                  luggage: getAllCarsController.getAllVehicles?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                  ac: getAllCarsController.getAllVehicles?.data[index].airCondition ?? 'no',
                                                  gear: getAllCarsController.getAllVehicles?.data[index].gearType ?? 'no',
                                                  fuel: getAllCarsController.getAllVehicles?.data[index].fuelType ?? 'no',
                                                  fuelstatus: getAllCarsController.getAllVehicles?.data[index].status ?? 'no',
                                                  price: getAllCarsController.getAllVehicles?.data[index].price.toString() ?? 'no',
                                                  description: getAllCarsController.getAllVehicles?.data[index].description ?? 'no',
                                                  secdepo: getAllCarsController.getAllVehicles?.data[index].securityDeposit ?? 'no',
                                                  imgs:  imageinsurone ?? '',
                                                  imgs2: imageinsurtwo ?? '',
                                                  imgs3: imagercone ?? '',
                                                  imgs4: imagerctwo ?? '',
                                                  imgs5: imagevehone ?? '',
                                                  imgs6: imagevehtwo ?? '',
                                                  imgs7: imagevehthree ?? '',
                                                  imgs8: imagevehfour ?? '',
                                                  imgs9: imagevehfive ?? '',
                                                  insur: getAllCarsController.getAllVehicles?.data[index].insuranceExpiryDate,

                                                  //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                )));
                                              }
                                              else{
                                                print("aaa");
                                              }
//                                                print(getAllCarsController.getAllCars?.data[index].insuranceExpiryDate);

                                            },


                                            style: ButtonStyle(

                                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(31),
                                                        side: BorderSide(color: Colors.grey.shade300)
                                                    )
                                                )
                                            ),
                                            icon: Icon(Icons.details_rounded,size: 20,color: Colors.white,),
                                            label: Text('View Details',style: TextStyle(color: Colors.white),),
                                            // child: Padding(
                                            //   padding: const EdgeInsets.all(4),
                                            //   child: Icon(Icons.details_rounded,size: 25,color: Colors.blueAccent,),
                                            // ),
                                          ),

                                        ), //Si



                                      ],
                                    ),




                                  ],
                                ), //Column
                              ), //Padding
                            ), //SizedBox
                          );


                        }
                    ),
                  ),
                ),







                SizedBox(height: 5,),


              ],
            ),
            //   ),


          ],
        ),
      ),

      // ),
      // ),
    );
  }



  void logOut(
      String valToken
      ) async {
    try{
      Response response = await post(
          Uri.parse('http://pick4ride.com/api/logout'),
          headers: {
            'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
          }
      );
      if(response.statusCode == 200){
        //    Map<String,dynamic> veri = json.decode(response.body);
        print(response.body.toString());
        print(response.toString());
        prefs.remove('token');
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
      }
      else {
        print('failed');
        print(response.body.toString());
        print(response.toString());
        print(valToken);
      }
    }
    catch(e){
      print(e.toString());
    }
  }


  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Are you sure you want to sign out?'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            String? valTok = prefs.getString('token');
            print("signout: $valTok");
            logOut(valTok!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
          },
          child: const Text('Yes'),
        ),
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),

      ],
    );
  }


  Future<String?> getToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }



  checkToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    checktoken = preferences.getString('token');

    if(checktoken == null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    }
    else{
      print("kjkln");
    }

  }

}



class CustomDelegate extends SearchDelegate<String> {


  GetAllVehiclesController getAllCarsController = Get.put(GetAllVehiclesController());

  // List<String> modelname = [];
  // modelname.add(getAllCarsController.getAllCars!.data[index].brandModel);





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