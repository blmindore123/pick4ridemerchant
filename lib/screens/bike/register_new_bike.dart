import 'dart:convert';
import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pick4ridemerchant/classes/GetAllVehicles.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:pick4ridemerchant/screens/common/registered_cars_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../classes/imageres.dart';
import '../../controller/drive_category_controller.dart';
import '../../utils/HelperSaveData.dart';
import '../../widgets/drawer.dart';
import '../home.dart';
import '../login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class RegisterNewBike extends StatefulWidget {
  @override
  _RegisterNewBikeState createState() => _RegisterNewBikeState();
}

class _RegisterNewBikeState extends State<RegisterNewBike> {
  TextEditingController licenseController = TextEditingController();

//  TextEditingController pickUptimeController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();

  // TextEditingController dropOfftimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;
  TextEditingController brandNameController = TextEditingController();
  TextEditingController numofdoorController = TextEditingController();
  TextEditingController noofluggageController = TextEditingController();
  TextEditingController gearController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? multi;

  @override
  void initState() {
    super.initState();
    //  value = widget.value == true;
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  String radioButtonItem = 'Self Driverrr';
  int id = 11;
  bool isSwitched = false;

  int idvehicletype = 21;
  int idac = 31;

  DriveCategoryController driveCategoryController =
      Get.put(DriveCategoryController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  String radioButtonItemride = 'Self Driverrr';

  String radioButtonItemvehicle = 'Self Driverrddr';

  String radioButtonItemac = 'Driverrddr';

  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;

  String? respons;

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

  String? brandmodel;
  String? gearmodel;
  String? fuelmodel;


  List<File> selectedImagesnew = [];

  List<String> imagesarr = [];

  List<GetAllVehicles> _userDetails = [];

  String? xval;

  GetAllVehicles? getAllVehicles;

  String? one;
  String? two;
  String? three;
  String? four;
  String? five;

  Future selectOneImage(ImageSource media) async {
    final XFile? selectedImage1 = await imagePicker.pickImage(source: media);
    setState(() {
      image1 = selectedImage1;
    });
    uploadoneImage();
  }

  Future<String?> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  uploadoneImage() async {
    var valTok = await getToken();
    var headers = {'Authorization': 'Bearer $valTok'};

    File? imagefile1 = File(image1!.path);
    Image.file(imagefile1);
    File file1 = File(imagefile1.path);

    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + '/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image', image1!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      respo = await response.stream.bytesToString();
      print(respo);
      String? str = respo;
      String? abc = '"data":"';
      String? xyz = '"}';
      int startIndex = str!.indexOf(abc);
      int endIndex = str.indexOf(xyz, startIndex + abc.length);
      firstimage = str.substring(startIndex + abc.length, endIndex);
      print(firstimage);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future selectTwoImage(ImageSource media) async {
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image2 = selectedImage;
    });
    uploadTwoImage();
  }

  uploadTwoImage() async {
    var valTok = await getToken();
    var headers = {'Authorization': 'Bearer $valTok'};

    File? imagefile2 = File(image2!.path);
    Image.file(imagefile2!);

    File file2 = File(imagefile2.path);

    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + '/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image', image2!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      respo2 = await response.stream.bytesToString();
      print(respo2);
      String? str2 = respo2;
      String? abc2 = '"data":"';
      String? xyz2 = '"}';
      int startIndex = str2!.indexOf(abc2);
      int endIndex = str2.indexOf(xyz2, startIndex + abc2.length);
      secondimage = str2.substring(startIndex + abc2.length, endIndex);
      print(secondimage);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future selectThreeImage(ImageSource media) async {
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image3 = selectedImage;
    });
    uploadThreeImage();
  }

  uploadThreeImage() async {
    var valTok = await getToken();
    var headers = {'Authorization': 'Bearer $valTok'};

    File? imagefile3 = File(image3!.path);
    Image.file(imagefile3!);

    File file3 = File(imagefile3.path);

    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + '/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image', image3!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      respo3 = await response.stream.bytesToString();
      print(respo3);
      String? str3 = respo3;
      String? abc3 = '"data":"';
      String? xyz3 = '"}';
      int startIndex = str3!.indexOf(abc3);
      int endIndex = str3.indexOf(xyz3, startIndex + abc3.length);
      thirdimage = str3.substring(startIndex + abc3.length, endIndex);
      print(thirdimage);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future selectFourImage(ImageSource media) async {
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image4 = selectedImage;
    });

    uploadFourImage();
  }

  uploadFourImage() async {
    var valTok = await getToken();
    var headers = {'Authorization': 'Bearer $valTok'};

    File? imagefile4 = File(image4!.path);
    Image.file(imagefile4!);

    File file4 = File(imagefile4.path);

    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + '/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image', image4!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      respo4 = await response.stream.bytesToString();
      print(respo4);
      String? str4 = respo4;
      String? abc4 = '"data":"';
      String? xyz4 = '"}';
      int startIndex = str4!.indexOf(abc4);
      int endIndex = str4.indexOf(xyz4, startIndex + abc4.length);
      fourthimage = str4.substring(startIndex + abc4.length, endIndex);
      print(fourthimage);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future selectImages() async {
    final List<XFile> xfilePick = await imagePicker.pickMultiImage();

    if (xfilePick!.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesnew.add(File(xfilePick[i].path));

        var valTok = await getToken();
        var headers = {'Authorization': 'Bearer $valTok'};

        var request = http.MultipartRequest(
            'POST', Uri.parse(AppConstants.BASE_URL + '/upload-images'));

        for (int i = 0; i < selectedImagesnew.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'images[]', selectedImagesnew[i].path));
          break;
        }
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          respo = await response.stream.bytesToString();
          print(respo);

          String? stri = respo;
          String? abcd = '"data":["';
          String? xyzr = '"]}';
          int startIndex = stri!.indexOf(abcd);
          int endIndex = stri.indexOf(xyzr, startIndex + abcd.length);
          multi = stri.substring(startIndex + abcd.length, endIndex);
          imagesarr.add(multi ?? '');
          print(imagesarr);

          for (i = 0; i < imagesarr.length; i++) {
            if (i == 0) {
              one = imagesarr[0];
              print("one $one");
            }

            if (i == 1) {
              two = imagesarr[1];
              print("two $two");
            }

            if (i == 2) {
              three = imagesarr[2];
              print("three $three");
            }
            if (i == 3) {
              four = imagesarr[3];
              print("four $four");
            }
            if (i == 4) {
              five = imagesarr[4];
              print("five $five");
            }
          }
        } else {
          print(response.reasonPhrase);
        }
      }

      setState(() {});
    }

    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Register New Bike",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      endDrawer: MyDrawer(),
      // Drawer(
      //   child: Container(
      //     decoration: BoxDecoration(color: Colors.white),
      //     child: Column(
      //       children: <Widget>[
      //         Expanded(
      //           child: Column(children: <Widget>[
      //             ListTile(
      //               title: Text(""),
      //               trailing: Icon(
      //                 Icons.arrow_forward_outlined,
      //                 color: Colors.black,
      //               ),
      //             ),
      //
      //             // ListTile(
      //             //   title: Text(
      //             //     'Sign up as supplier',
      //             //     style: TextStyle(fontSize: 18.0, color: Colors.black),
      //             //   ),
      //             //   leading: Icon(
      //             //     Icons.person,
      //             //     size: 20.0,
      //             //     color: Colors.purple,
      //             //   ),
      //             //   onTap: () {
      //             //     /* Navigator.pop(context);
      //             //   Navigator.of(context).push(new MaterialPageRoute(
      //             //       builder: (context) => dealerBuilder()));*/
      //             //   },
      //             // ),
      //             ListTile(
      //               title: Text(
      //                 'Invoice Report',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.shuffle,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /*Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => shufflerBuilder()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Profile Management',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.info_outline,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //
      //             ListTile(
      //               title: Text(
      //                 'FAQ',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.fax,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //
      //             ListTile(
      //               title: Text(
      //                 'Privacy Policy',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.policy_outlined,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Change Location',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.location_on,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Contact Us',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.contact_page,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'About Us',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.info,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Terms and Conditions',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.note,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Booking Details',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.book,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Share App',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.share,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 /* Navigator.pop(context);
      //                 Navigator.of(context).push(new MaterialPageRoute(
      //                     builder: (context) => mistakePage()));*/
      //               },
      //             ),
      //             ListTile(
      //               title: Text(
      //                 'Sign Out',
      //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
      //               ),
      //               leading: Icon(
      //                 Icons.logout,
      //                 size: 20.0,
      //                 color: Colors.purple,
      //               ),
      //               onTap: () {
      //                 // String? valTok = prefs.getString('token');
      //                 // print("signout: $valTok");
      //                 // logOut(valTok!);
      //
      //                 showDialog(
      //                   context: context,
      //                   builder: (BuildContext context) =>
      //                       _buildPopupDialog(context),
      //                 );
      //               },
      //             ),
      //           ]),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),


      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 31,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Choose the ride option',style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),)),
                    ),

//                  //   if(condition) Widget() else Widget(),
//

                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItemride = 'Self Drive';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Self Drive',
                          style: new TextStyle(fontSize: 12.0),
                        ),

                        // Radio(
                        //   value: 2,
                        //   groupValue: id,
                        //   onChanged: (val) {
                        //     setState(() {
                        //       radioButtonItemride = 'With Driver';
                        //       id = 2;
                        //     });
                        //   },
                        // ),
                        // Text(
                        //   'With Driver',
                        //   style: new TextStyle(fontSize: 12.0),
                        // ),
                        //
                        //
                        // Radio(
                        //   value: 3,
                        //   groupValue: id,
                        //   onChanged: (val) {
                        //     setState(() {
                        //       radioButtonItemride = 'Wedding Ride';
                        //       id = 3;
                        //     });
                        //   },
                        // ),
                        // Text(
                        //   'Wedding Ride',
                        //   style: new TextStyle(fontSize: 12.0),
                        // ),
                      ],
                    ),

                    if (radioButtonItemride == 'Self Drive')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text(
                                "Security Deposit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            width: 41,
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);

                                if (isSwitched == true) {
                                  xval = "yes";
                                } else {
                                  xval = "no";
                                }
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                          Text(
                            'No',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ],
                      )
                    else
                      Text(''),

//
//
//
//
//
                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Vehicle Type',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: idvehicletype,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItemvehicle = 'Commercial';
                                      idvehicletype = 1;
                                    });
                                  },
                                ),
                                Text('Commercial',
                                    style: new TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: idvehicletype,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItemvehicle = 'Compact';
                                      idvehicletype = 2;
                                    });
                                  },
                                ),
                                Text('Compact',
                                    style: new TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: idvehicletype,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItemvehicle = 'VIP';
                                      idvehicletype = 3;
                                    });
                                  },
                                ),
                                Text(
                                  'VIP',
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: idvehicletype,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItemvehicle = 'Sports';
                                      idvehicletype = 4;
                                    });
                                  },
                                ),
                                Text(
                                  'Sports',
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                'Brand & Model',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                'Luggage Space (ltr)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //   Text('hhk'),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 5),
                            // width: 155,
                            height: 42,
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                fit: FlexFit.loose,
                                showSearchBox: true,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              // dropdownDecoratorProps: DropDownDecoratorProps(
                              //   dropdownSearchDecoration: InputDecoration(
                              //     labelText: "Menu mode",
                              //     hintText: "country in menu mode",
                              //   ),
                              // ),

                              //list of dropdown items
                              items: [
                                "Yamaha MT15",
                                "Honda Shine",
                                "Bajaj Avenger Cruise",
                                "Yamaha Enticer",
                                "Yamaha YZF-R15",
                              ],
                              //    label: "Country",

                              // onChanged: print,
                              onChanged: (v) {

                                brandmodel = v;

                                print(brandmodel);
                                // if (v == "Ferrari Enzo") {
                                //   brandmodel = "Ferrari Enzo";
                                // }
                                //
                                // if (v == "Maruti Zen") {
                                //   brandmodel = "Maruti Zen";
                                // }
                                //
                                // if (v == "Maruti Baleno") {
                                //   brandmodel = "Maruti Baleno";
                                // }
                                //
                                // if (v == "Hyundai Creta") {
                                //   brandmodel = "Hyundai Creta";
                                // }
                                //
                                // if (v == "Toyota Fortuner") {
                                //   brandmodel = "Toyota Fortuner";
                                // } else {
                                //   print("");
                                // }
                              },

                              selectedItem: "Yamaha MT15",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5,right: 10),
                            // width: 155,
                            height: 42,
                            child: TextFormField(
                              controller: noofluggageController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.bottom,
                              validator: (noofluggageController) {
                                String value = noofluggageController.toString();
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Write Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

//gear

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Gear Type',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Fuel Type',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //   Text('hhk'),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 5),
                            // width: 196,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                fit: FlexFit.loose,
                                showSearchBox: true,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              // dropdownDecoratorProps: DropDownDecoratorProps(
                              //   dropdownSearchDecoration: InputDecoration(
                              //     labelText: "Menu mode",
                              //     hintText: "country in menu mode",
                              //   ),
                              // ),
                              //list of dropdown items
                              items: [
                                "Manual",
                                "Automatic",
                              ],
                              //    label: "Country",

                              onChanged: (vgear) {
                                if (vgear == "Manual") {
                                  gearmodel = "Manual";
                                }
                                if (vgear == "Automatic") {
                                  gearmodel = "Automatic";
                                } else {
                                  print("");
                                }
                              },
                              //show selected item
                              selectedItem: "Manual",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 10),
                            // width: 196,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                fit: FlexFit.loose,
                                showSearchBox: true,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              // dropdownDecoratorProps: DropDownDecoratorProps(
                              //   dropdownSearchDecoration: InputDecoration(
                              //     labelText: "Menu mode",
                              //     // hintText: "country in menu mode",
                              //   ),
                              // ),
                              //list of dropdown items
                              items: [
                                "Petrol",
                                "Diesel",

                              ],
                              //    label: "Country",
                              onChanged: (vfuel) {
                                if (vfuel == "Petrol") {
                                  fuelmodel = "Petrol";
                                }
                                if (vfuel == "Diesel") {
                                  fuelmodel = "Diesel";
                                }
                                else {
                                  print("");
                                }
                              },
                              //show selected item
                              selectedItem: "Petrol",
                            ),
                            // child: TextFormField(
                            //   controller: fuelController,
                            //   keyboardType: TextInputType.text,
                            //   validator: (fuelController) {
                            //     String value = fuelController.toString();
                            //     if (value!.isEmpty) {
                            //       return 'Please enter some text';
                            //     }
                            //     return null;
                            //   },
                            //
                            //
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     hintText: "Write Here",
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(9),
                            //       borderSide: BorderSide(
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(9),
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  'No. of Seats',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Vehicle No.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //   Text('hhk'),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 5),
                            // width: 155,
                            height: 42,
                            child: TextFormField(
                              controller: seatsController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.bottom,
                              validator: (seatsController) {
                                String value = seatsController.toString();
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Write Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5,right: 10),
                            // width: 155,
                            height: 42,
                            child: TextFormField(
                              controller: vehiclenoController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.bottom,
                              validator: (vehiclenoController) {
                                String value = vehiclenoController.toString();
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Write Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Text('License Expired Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            // SizedBox(
                            //   width: 11,
                            // ),
                            Text(
                              'Insurance Expired Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Expanded(
                        // child:
                        //
                        // SizedBox(
                        //   width: 21,
                        // ),
                        //
                        //   Padding(
                        //     padding: EdgeInsets.only(left: 0),
                        //     child: Container(
                        //       color: Colors.brown.shade50,
                        //       padding:const EdgeInsets.all(15),
                        //       height:50,
                        //       width: MediaQuery.of(context).size.width/2.72,
                        //       child: Padding(
                        //         padding: EdgeInsets.only(top: 4),
                        //         child: TextField(
                        //
                        //           controller: licenseController, //editing controller of this TextField
                        //
                        //           decoration: const InputDecoration(
                        //
                        //             border: InputBorder.none,
                        //
                        //             hintText: 'yyyy/MM/dd'
                        //           ),
                        //           readOnly: true,  // when true user cannot edit text
                        //           onTap: () async {
                        //             DateTime? pickedTime = await showDatePicker(
                        //                 context: context,
                        //                 initialDate: DateTime.now(), //get today's date
                        //                 firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        //                 lastDate: DateTime(2101)
                        //
                        //
                        //             );
                        //
                        //             if(pickedTime != null ){
                        //               print(pickedTime);  //get the picked date in the format => 2022-07-04 00:00:00.000
                        //               String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                        //               print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //               setState(() {
                        //                 licenseController.text = formattedDate; //set foratted date to TextField value.
                        //               });
                        //             }else{
                        //               print("Date is not selected");
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // Container(
                        //     height: 50,
                        //     color: Colors.brown.shade50,
                        //     child: Icon(Icons.calendar_month,color: Colors.purple,)),

                        SizedBox(
                          width: 11,
                        ),

                        // Expanded(
                        // child:
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            color: Colors.brown.shade50,
                            padding: const EdgeInsets.all(15),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.72,
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: TextField(
                                controller: insuranceController,
                                //editing controller of this TextField
                                decoration: const InputDecoration(

//                                    suffixIcon: Icon(Icons.calendar_month,color: Colors.purple,),
                                    border: InputBorder.none,
                                    hintText: 'yyyy/MM/dd'),
                                readOnly: true,
                                // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      //get today's date
                                      firstDate: DateTime(2000),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedTime != null) {
                                    print(
                                        pickedTime); //get the picked date in the format => 2022-07-04 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(
                                            pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2022-07-04
                                    //You can format date as per your need

                                    //  String newTime = formattedDate.replaceAll(new RegExp(r'[^\w\s]+'),'');

                                    setState(() {
                                      insuranceController.text =
                                          formattedDate; //set foratted date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        // ),

                        Container(
                            height: 50,
                            color: Colors.brown.shade50,
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.purple,
                            )),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            height: 45,
                            child: TextFormField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              validator: (priceController) {
                                String value = priceController.toString();
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Per Day'),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11, right: 11),
                      child: SizedBox(
                          width: 480,
                          //    height: 145,
                          child: TextFormField(
                            controller: descriptionController,
                            keyboardType: TextInputType.text,
                            validator: (descriptionController) {
                              String value = descriptionController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter Here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Image of vehicle license and insurance copy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        image1 != null
                            ? Padding(
                                padding: EdgeInsets.only(left: 11),
                                child: GestureDetector(
                                  onTap: () {
                                    selectOneImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                      height: 115,
                                      width: 161,
                                      // child: Card(
                                      //     color: Colors.brown.shade50,
                                      //     child: Image.file(File(image1!.path),fit: BoxFit.cover,)
                                      // ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 161,
                                            child: Card(
                                                color: Colors.brown.shade50,
                                                child: Image.file(
                                                  File(image1!.path),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          Positioned(
                                            left: 111,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  image1 = null;
                                                });
                                              },
                                              icon: new Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectOneImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 115,
                                  width: 161,
                                  child: Card(
                                    color: Colors.brown.shade50,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 21,
                        ),
                        image2 != null
                            ? GestureDetector(
                                onTap: () {
                                  selectTwoImage(ImageSource.gallery);
                                },
                                child: Container(
                                    height: 115,
                                    width: 161,
                                    // child: Card(
                                    //     color: Colors.brown.shade50,
                                    //     child: Image.file(File(image2!.path),fit: BoxFit.cover,)
                                    // ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 161,
                                          child: Card(
                                              color: Colors.brown.shade50,
                                              child: Image.file(
                                                File(image2!.path),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Positioned(
                                          left: 111,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                image2 = null;
                                              });
                                            },
                                            icon: new Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectTwoImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 115,
                                  width: 161,
                                  child: Card(
                                    color: Colors.brown.shade50,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Image of vehicle book copy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        image3 != null
                            ? Padding(
                                padding: EdgeInsets.only(left: 11),
                                child: GestureDetector(
                                  onTap: () {
                                    selectThreeImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                      height: 115,
                                      width: 161,
                                      // child: Card(
                                      //     color: Colors.brown.shade50,
                                      //     child: Image.file(File(image3!.path),fit: BoxFit.cover,)
                                      // ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 161,
                                            child: Card(
                                                color: Colors.brown.shade50,
                                                child: Image.file(
                                                  File(image3!.path),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          Positioned(
                                            left: 111,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  image3 = null;
                                                });
                                              },
                                              icon: new Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectThreeImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 115,
                                  width: 161,
                                  child: Card(
                                    color: Colors.brown.shade50,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 21,
                        ),
                        image4 != null
                            ? GestureDetector(
                                onTap: () {
                                  selectFourImage(ImageSource.gallery);
                                },
                                child: Container(
                                    height: 115,
                                    width: 161,
                                    // child: Card(
                                    //     color: Colors.brown.shade50,
                                    //     child: Image.file(File(image4!.path),fit: BoxFit.cover,)
                                    // ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 161,
                                          child: Card(
                                              color: Colors.brown.shade50,
                                              child: Image.file(
                                                File(image4!.path),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Positioned(
                                          left: 111,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                image4 = null;
                                              });
                                            },
                                            icon: new Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectFourImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 115,
                                  width: 161,
                                  child: Card(
                                    color: Colors.brown.shade50,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),

                    SizedBox(
                      height: 31,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Vehicle Images',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        child: selectedImagesnew.isEmpty
                            ? const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 40,
                          ),
                        )
                            : GridView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: selectedImagesnew.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  // TO show selected file
                                  return
                                      //   Container(
                                      //   decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //           color: Colors.black26
                                      //           ,width: 2
                                      //       )
                                      //   ),
                                      //   child: kIsWeb
                                      //       ? Image.network(
                                      //       selectedImagesnew[index].path)
                                      //       : Image.file(selectedImagesnew[index],fit: BoxFit.cover,),
                                      // );

                                      Stack(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            //       selectedImagesnew.removeAt(index);
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 161,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26,
                                                      width: 2)),
                                              child: kIsWeb
                                                  ? Image.network(
                                                      selectedImagesnew[index]
                                                          .path,fit: BoxFit.cover,)
                                                  : Image.file(
                                                      selectedImagesnew[index],
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            Positioned(
                                              left: 111,
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    selectedImagesnew
                                                        .removeAt(index);
                                                  });
                                                },
                                                icon: new Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ),

                    if (selectedImagesnew.length < 6)
                      ElevatedButton(
                          onPressed: () {
                            selectImages();
                          },
                          child: Text('Add Images'))
                    else
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Max 5 images allowed',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )),

                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4.22,
                          right: MediaQuery.of(context).size.width / 4.22,
                          top: MediaQuery.of(context).size.height / 24.44,
                          bottom: 11),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 18.38,
                        width: MediaQuery.of(context).size.width / 2.56,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                image1 != null &&
                                image2 != null &&
                                image3 != null &&
                                image4 != null &&
                                imageFileList != null) {
                              _formKey.currentState?.save();
                              String? valTok = prefs.getString('token');
                              print("enterdetails: $valTok");

                              //register bike method called

                              registerBike(
                                id,
                                radioButtonItemvehicle,
                                xval,
                                brandmodel ?? 'Yamaha MT15',
                                0,
                                int.parse(noofluggageController.text),
                                'no',
                                gearmodel ?? 'Manual',
                                fuelmodel ?? 'Petrol',
                                int.parse(seatsController.text),
                                vehiclenoController.text,
                                insuranceController.text,
                                int.parse(priceController.text),
                                descriptionController.text,
                                firstimage ?? '',
                                secondimage ?? '',
                                thirdimage ?? '',
                                fourthimage ?? '',
                                one ?? '',
                                two ?? '',
                                three ?? '',
                                four ?? '',
                                five ?? '',
                              );
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Enter All Details!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }

                            // id,
                            print(id);
                            // radioButtonItem,
                            print(radioButtonItemvehicle);
                            // xval,
                            print(xval);
                            // brandNameController.text,
                            print(brandNameController.text);
                            // int.parse(noofluggageController.text),
                            int.parse(noofluggageController.text);
                            // gearController.text,
                            print(gearController.text);
                            // fuelController.text,
                            print(fuelController.text);
                            // int.parse(seatsController.text),
                            print(int.parse(seatsController.text));
                            // vehiclenoController.text,
                            print(vehiclenoController.text);
                            // insuranceController.text,
                            print(insuranceController.text);
                            // int.parse(priceController.text),
                            print(int.parse(priceController.text));
                            // descriptionController.text,
                            print(descriptionController.text);
                            // firstimage
                            print(firstimage);
                            print(one);
                            print(two);
                            print(three);
                            print(four);
                            print(five);
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            18.11),
                              )),
                        ),
                      ),
                    ),

                    // ElevatedButton(onPressed: (){
                    //   uploadoneImage();
                    // }, child: Text('send')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logOut(String valToken) async {
    try {
      Response response =
          await post(Uri.parse(AppConstants.BASE_URL + '/logout'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $valToken'
      });
      if (response.statusCode == 200) {
        //    Map<String,dynamic> veri = json.decode(response.body);
        print(response.body.toString());
        print(response.toString());
        prefs.remove('token');
        HelperSaveData.helperSaveData.logout();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('failed');
        print(response.body.toString());
        print(response.toString());
        print(valToken);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure you want to sign out?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            String? valTok = prefs.getString('token');
            print("signout: $valTok");
            logOut(valTok!);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }

  void registerBike(
    int? id,
    String? vehicletypecat,
    String? secdepo,
    String? brand,
    int? doors,
    int? luggage,
    String? ac,
    String? gear,
    String? fuel,
    int? seats,
    String? vehicleno,
    String? insurance,
    int? price,
    String? description,
    String? imageOneinsur,
    String? imageTwoinsur,
    String? imageOnerc,
    String? imageTworc,
    String? imageOneveh,
    String? imageTwoveh,
    String? imageThreeveh,
    String? imageFourveh,
    String? imageFiveveh,
  ) async {
    try {
      var valToken = await getToken();
      print("reg car $valToken");

      final queryparams = {
        "vehicle_category": 3,
        "ride_category": id,
        "vehicle_type": vehicletypecat,
        "security_deposit": secdepo,
        "brand_model": brand,
        "no_of_doors": doors,
        "no_of_luggage_space": luggage,
        "air_condition": ac,
        "gear_type": gear,
        "fuel_type": fuel,
        "no_of_seats": seats,
        "vehicle_no": vehicleno,
        "insurance_expiry_date": insurance,
        "price": price,
        "description": description,
        "images": [
          {"type": "insurance", "image": imageOneinsur},
          {"type": "insurance", "image": imageTwoinsur},
          {"type": "rc_book", "image": imageOnerc},
          {"type": "rc_book", "image": imageTworc},
          if(one != null){"type": "vehicle", "image": imageOneveh },
          if(two != null){"type": "vehicle", "image": imageTwoveh},
          if(three != null){"type": "vehicle", "image": imageThreeveh},
          if(four != null){"type": "vehicle", "image": imageFourveh},
          if(five != null){"type": "vehicle", "image": imageFiveveh}
        ]

      };


      Response response =
          await post(Uri.parse(AppConstants.BASE_URL + '/merchant/vehicles'),
              body: json.encode(
              queryparams
                //     {
              //   "vehicle_category": 3,
              //   "ride_category": id,
              //   "vehicle_type": vehicletypecat,
              //   "security_deposit": secdepo,
              //   "brand_model": brand,
              //   "no_of_doors": doors,
              //   "no_of_luggage_space": luggage,
              //   "air_condition": ac,
              //   "gear_type": gear,
              //   "fuel_type": fuel,
              //   "no_of_seats": seats,
              //   "vehicle_no": vehicleno,
              //   "insurance_expiry_date": insurance,
              //   "price": price,
              //   "description": description,
              //   "images": [
              //     {"type": "insurance", "image": imageOneinsur},
              //     {"type": "insurance", "image": imageTwoinsur},
              //     {"type": "rc_book", "image": imageOnerc},
              //     {"type": "rc_book", "image": imageTworc},
              //     {"type": "vehicle", "image": imageOneveh},
              //     {"type": "vehicle", "image": imageTwoveh},
              //     {"type": "vehicle", "image": imageThreeveh},
              //     {"type": "vehicle", "image": imageFourveh},
              //     {"type": "vehicle", "image": imageFiveveh}
              //   ]
              // }
              ),
              headers: {
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $valToken'
          });

      if (response.statusCode == 200) {
        print(response.body.toString());
        print('vehicle added');
        //    String? valTok = prefs.getString('token');
        //    print("valTok: $valTok");

        final responseJson = json.decode(response.body);
        setState(() {});

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisteredCarsList()));

        //  var result = jsonDecode(response.body);
        // GetAllVehicles = GetAllVehicles.fromJson(result);
        // setState(() {
        //   GetAllVehiclesController.GetAllVehicles!.data.removeAt(index);
        // });
        //
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
      print('catched');
    }
  }

  //doors
  //ac
  //

  void noToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var x = preferences.getString('token');

    if (x == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
