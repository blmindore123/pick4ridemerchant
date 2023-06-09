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
  GetAllCars? getAllCars;


  TextEditingController controller = new TextEditingController();

  // List<Map<String,dynamic>> _allUsers = [];
  //
  //
  // List<Map<String,dynamic>> _foundUsers = [];

 String? toke;

  @override
  void initState() {
    super.initState();

    initSharedPref();

    checkToken();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      getAllCarsController.fetchData();


          setState(() {
     });
    });







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



  GetAllCarsController getAllCarsController = Get.put(GetAllCarsController());

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

    // String? valTok = prefs.getString('token');
    // if(valTok == null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    // }

    return Scaffold(
     // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text("Registered Vehicles",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),

      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(children: <Widget>[
                  ListTile(
                    title:  Text(""),
                    trailing:  Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     'Sign up as supplier',
                  //     style: TextStyle(fontSize: 18.0, color: Colors.black),
                  //   ),
                  //   leading: Icon(
                  //     Icons.person,
                  //     size: 20.0,
                  //     color: Colors.purple,
                  //   ),
                  //   onTap: () {
                  //     /* Navigator.pop(context);
                  //   Navigator.of(context).push(new MaterialPageRoute(
                  //       builder: (context) => dealerBuilder()));*/
                  //   },
                  // ),
                  ListTile(
                    title: Text(
                      'Invoice Report',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.shuffle,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Profile Management',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.info_outline,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'FAQ',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.fax,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.policy_outlined,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Change Location',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.purple,),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.contact_page,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'About Us',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.info,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Terms and Conditions',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.note,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Booking Details',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.book,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Share App',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.share,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.logout,
                      size: 20.0,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      // String? valTok = prefs.getString('token');
                      // print("signout: $valTok");
                      // logOut(valTok!);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                    },
                  ),

                ]
                ),
              ),
            ],
          ),
        ),
      ),
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


                    SizedBox(
                      height: 21,
                    ),

                    // TextField(
                    //   onChanged: (value) => _runFilter(value),
                    //   decoration: InputDecoration(
                    //     labelText: 'search',suffixIcon: Icon(Icons.search)),
                    // ),


                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('Location',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('change',style: TextStyle(color: Colors.blue),),

                        ],
                      ),
                    ),

                    Divider(color: Colors.black,),





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
                                  :       Text("${getAllCarsController.getAllCars?.data?.length.toString() ?? '0'} Vehicles",style: TextStyle(fontWeight: FontWeight.w300),)),


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
                            :ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                                itemCount: getAllCarsController.getAllCars?.data?.length ??  0,

                          //     itemCount: _foundUsers.length,
                            itemBuilder: (context,index){
                         //     _allUsers.add();

                              // suggestons.add(
                              //     getAllCarsController.getAllCars!.data[index].brandModel
                              // );

                              List<Widget> mywidget = [];

                              //one insur
                              var imageinsurone = AppConstants.DEFAULT_IMAGE;
                              for (var i = 0; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageinsurone = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //two insur

                              var imageinsurtwo = AppConstants.DEFAULT_IMAGE;
                              print(imageinsurtwo);

                              for (var i = 1; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageinsurtwo = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }



                              //one rc
                              var imagercone = AppConstants.DEFAULT_IMAGE;
                              print(imagercone);

                              for (var i = 2; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagercone = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //two rc
                              var imagerctwo = AppConstants.DEFAULT_IMAGE;
                              print(imagerctwo);
                              for (var i = 3; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagerctwo = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //one veh
                              var imagevehone = AppConstants.DEFAULT_IMAGE;

                              print(imagevehone);

                              for (var i = 4; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagevehone = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //two veh
                              var imagevehtwo = AppConstants.DEFAULT_IMAGE;

                              print(imagevehtwo);

                              for (var i = 5; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagevehtwo = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //three veh
                              var imagevehthree = AppConstants.DEFAULT_IMAGE;

                              print(imagevehthree);

                              for (var i = 6; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagevehthree = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //four veh
                              var imagevehfour = AppConstants.DEFAULT_IMAGE;

                              print(imagevehfour);

                              for (var i = 7; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagevehfour = getAllCarsController.getAllCars!.data[index]
                                    .images[i].imageUrl;
                                break;
                              }


                              //five veh
                              var imagevehfive = AppConstants.DEFAULT_IMAGE;

                              print(imagevehfive);

                              for (var i = 8; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagevehfive = getAllCarsController.getAllCars!.data[index]
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
                              for (var i = 0; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageinsuroneedit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageinsurtwoedit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 1; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageinsurtwoedit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imagerconeedit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 2; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagerconeedit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imagerctwoedit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 3; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imagerctwoedit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageveh1edit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 4; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageveh1edit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageveh2edit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 5; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageveh2edit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageveh3edit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 6; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageveh3edit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageveh4edit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 7; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageveh4edit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }
                              var imageveh5edit = AppConstants.DEFAULT_IMAGE;
                              for (var i = 8; i <  getAllCarsController.getAllCars!.data[index].images.length ; i++) {
                                imageveh5edit = getAllCarsController.getAllCars!.data[index]
                                    .images[i].image;
                                break;
                              }



                              print("this is image in var image: $imagevehone");
                              if(getAllCarsController.getAllCars!.data[index].images != null)
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



                              print(getAllCarsController.getAllCars?.data[index].id);
                              int? vehicledelid = getAllCarsController.getAllCars?.data[index].id;

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
                                            Text(getAllCarsController.getAllCars?.data[index].brandModel ?? 'no name'
                                              ,style: TextStyle(fontWeight: FontWeight.bold),),

                                            GestureDetector(
                                              onTap: () async{
                                                // print("top: $imagevehone top");
                                                // print(imagesgroup);
                                                var valToken = await getToken();
                                                print("edit car $valToken");

                                                if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Car"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCar(
                                                    token: valToken,
                                                    id: vehicledelid,
                                                    brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                    vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                    seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                    doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                    luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                    ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                    gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                    fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                    fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                    price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                    description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                    secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                    vehno: getAllCarsController.getAllCars?.data[index].vehicleNo ?? 'no',
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
                                                    insurance: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate ?? 'no',
                                                    group: imagesgroup,
                                                    drivetype: getAllCarsController.getAllCars?.data[index].rideCategory.id,

                                                  )));
                                                }
                                                if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Bike"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditBike(
                                                    token: valToken,
                                                    id: vehicledelid,
                                                    brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                    vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                    seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                    doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                    luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                    ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                    gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                    fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                    fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                    price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                    description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                    secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                    vehno: getAllCarsController.getAllCars?.data[index].vehicleNo ?? 'no',
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
                                                    insurance: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate ?? 'no',
                                                    group: imagesgroup,
                                                    drivetype: getAllCarsController.getAllCars?.data[index].rideCategory.id,

                                                  )));
                                                }
                                                if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Van"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditVan(
                                                    token: valToken,
                                                    id: vehicledelid,
                                                    brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                    vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                    seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                    doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                    luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                    ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                    gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                    fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                    fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                    price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                    description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                    secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                    vehno: getAllCarsController.getAllCars?.data[index].vehicleNo ?? 'no',
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
                                                    insurance: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate ?? 'no',
                                                    group: imagesgroup,
                                                    drivetype: getAllCarsController.getAllCars?.data[index].rideCategory.id,

                                                  )));
                                                }
                                                if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Tuk-Tuk"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTukTuk(
                                                    token: valToken,
                                                    id: vehicledelid,
                                                    brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                    vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                    seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                    doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                    luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                    ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                    gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                    fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                    fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                    price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                    description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                    secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                    vehno: getAllCarsController.getAllCars?.data[index].vehicleNo ?? 'no',
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
                                                    insurance: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate ?? 'no',
                                                    group: imagesgroup,
                                                    drivetype: getAllCarsController.getAllCars?.data[index].rideCategory.id,

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
                                              onTap: () async{


                                                try{

                                                  int? vehicleId = getAllCarsController.getAllCars!.data[index].id;

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
                                                      getAllCarsController.getAllCars!.data.removeAt(index);
                                                    });

                                                    getAllCars = GetAllCars.fromJson(result);


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

                                            Text("Rs. ${getAllCarsController.getAllCars?.data[index].price.toString() ??  'no name'}",style: TextStyle(fontWeight: FontWeight.bold),)


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
                                                          Text(getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? '0',style: TextStyle(fontWeight: FontWeight.bold),),
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
                                                          Text(getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? '0',style: TextStyle(fontWeight: FontWeight.bold),),
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
                                                Text(getAllCarsController.getAllCars?.data[index].vehicleNo ?? '',style: TextStyle(fontWeight: FontWeight.bold),)
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
                                                        Text(getAllCarsController.getAllCars?.data[index].gearType ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
                                                        SizedBox(height: 21,),
                                                        Text(getAllCarsController.getAllCars?.data[index].fuelType ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
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

                                                  if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Car")
                                                   {
                                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> CarDetails(
                                                       token: valToken,
                                                       id: vehicledelid,
                                                       brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                       vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                       seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                       doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                       luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                       ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                       gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                       fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                       fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                       price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                       description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                       secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                       imgs:  imageinsurone ?? '',
                                                       imgs2: imageinsurtwo ?? '',
                                                       imgs3: imagercone ?? '',
                                                       imgs4: imagerctwo ?? '',
                                                       imgs5: imagevehone ?? '',
                                                       imgs6: imagevehtwo ?? '',
                                                       imgs7: imagevehthree ?? '',
                                                       imgs8: imagevehfour ?? '',
                                                       imgs9: imagevehfive ?? '',
                                                       insur: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate,

                                                       //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                     )));
                                                   }
                                                  if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Bike")
                                                  {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BikeDetails(
                                                      token: valToken,
                                                      id: vehicledelid,
                                                      brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                      vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                      seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                      doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                      luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                      ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                      gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                      fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                      fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                      price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                      description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                      secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                      imgs:  imageinsurone ?? '',
                                                      imgs2: imageinsurtwo ?? '',
                                                      imgs3: imagercone ?? '',
                                                      imgs4: imagerctwo ?? '',
                                                      imgs5: imagevehone ?? '',
                                                      imgs6: imagevehtwo ?? '',
                                                      imgs7: imagevehthree ?? '',
                                                      imgs8: imagevehfour ?? '',
                                                      imgs9: imagevehfive ?? '',
                                                      insur: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate,

                                                      //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                    )));
                                                  }
                                                  if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Van")
                                                  {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VanDetails(
                                                      token: valToken,
                                                      id: vehicledelid,
                                                      brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                      vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                      seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                      doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                      luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                      ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                      gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                      fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                      fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                      price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                      description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                      secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                      imgs:  imageinsurone ?? '',
                                                      imgs2: imageinsurtwo ?? '',
                                                      imgs3: imagercone ?? '',
                                                      imgs4: imagerctwo ?? '',
                                                      imgs5: imagevehone ?? '',
                                                      imgs6: imagevehtwo ?? '',
                                                      imgs7: imagevehthree ?? '',
                                                      imgs8: imagevehfour ?? '',
                                                      imgs9: imagevehfive ?? '',
                                                      insur: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate,

                                                      //  ac: getAllCarsController.getAllCars?.data[index].airCondition,

                                                    )));
                                                  }
                                                  if(getAllCarsController.getAllCars?.data[index].vehicleCategory.name == "Tuk-Tuk")
                                                  {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TukTukDetails(
                                                      token: valToken,
                                                      id: vehicledelid,
                                                      brandn: getAllCarsController.getAllCars?.data[index].brandModel ?? 'no',
                                                      vehicletype: getAllCarsController.getAllCars?.data[index].vehicleType ?? 'no',
                                                      seats: getAllCarsController.getAllCars?.data[index].noOfSeats.toString() ?? 'no',
                                                      doors: getAllCarsController.getAllCars?.data[index].noOfDoors.toString() ?? 'no',
                                                      luggage: getAllCarsController.getAllCars?.data[index].noOfLuggageSpace.toString() ?? 'no',
                                                      ac: getAllCarsController.getAllCars?.data[index].airCondition ?? 'no',
                                                      gear: getAllCarsController.getAllCars?.data[index].gearType ?? 'no',
                                                      fuel: getAllCarsController.getAllCars?.data[index].fuelType ?? 'no',
                                                      fuelstatus: getAllCarsController.getAllCars?.data[index].status ?? 'no',
                                                      price: getAllCarsController.getAllCars?.data[index].price.toString() ?? 'no',
                                                      description: getAllCarsController.getAllCars?.data[index].description ?? 'no',
                                                      secdepo: getAllCarsController.getAllCars?.data[index].securityDeposit ?? 'no',
                                                      imgs:  imageinsurone ?? '',
                                                      imgs2: imageinsurtwo ?? '',
                                                      imgs3: imagercone ?? '',
                                                      imgs4: imagerctwo ?? '',
                                                      imgs5: imagevehone ?? '',
                                                      imgs6: imagevehtwo ?? '',
                                                      imgs7: imagevehthree ?? '',
                                                      imgs8: imagevehfour ?? '',
                                                      imgs9: imagevehfive ?? '',
                                                      insur: getAllCarsController.getAllCars?.data[index].insuranceExpiryDate,

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
                    //else Center(
                    //     child: CircularProgressIndicator()
                    // ),


                    //


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


  List<String> data = ['apple','mango','pineapple','apple'];

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