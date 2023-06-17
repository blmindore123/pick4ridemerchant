import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pick4ridemerchant/classes/getallcars.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:pick4ridemerchant/screens/common/registered_cars_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../classes/imageres.dart';
import '../../controller/drive_category_controller.dart';
import '../home.dart';
import '../login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class EditVan extends StatefulWidget {

  final token;
  final int? id;
  final String? brandn;
  final String? seats;
  final String? vehicletype;
  final String? doors;
  final String? luggage;
  final String? ac;
  final String? gear;
  final String? fuel;
  final String? fuelstatus;
  final String? price;
  final String? description;
  final String? secdepo;
  final String? imgs;
  final String? imgs2;
  final String? imgs3;
  final String? imgs4;
  final String? imgs5;
  final String? imgs6;
  final String? imgs7;
  final String? imgs8;
  final String? imgs9;
  final String? editimgs;
  final String? editimgs2;
  final String? editimgs3;
  final String? editimgs4;
  final String? editimgs5;
  final String? editimgs6;
  final String? editimgs7;
  final String? editimgs8;
  final String? editimgs9;
  final String? vehno;
  final String? insurance;
  final List<String>? group;
  final int? drivetype;

  const EditVan({
    @required this.token,
    @required this.id,
    @required this.brandn,
    @required this.seats,
    @required this.vehicletype,
    @required this.doors,
    @required this.luggage,
    @required this.ac,
    @required this.gear,
    @required this.fuel,
    @required this.fuelstatus,
    @required this.price,
    @required this.description,
    @required this.secdepo,
    @required this.imgs,
    @required this.imgs2,
    @required this.imgs3,
    @required this.imgs4,
    @required this.imgs5,
    @required this.imgs6,
    @required this.imgs7,
    @required this.imgs8,
    @required this.imgs9,
    @required this.editimgs,
    @required this.editimgs2,
    @required this.editimgs3,
    @required this.editimgs4,
    @required this.editimgs5,
    @required this.editimgs6,
    @required this.editimgs7,
    @required this.editimgs8,
    @required this.editimgs9,
    @required this.vehno,
    @required this.group,
    @required this.insurance,
    @required this.drivetype,
    Key? key,
  }) : super(key: key);
  @override
  _EditVanState createState() => _EditVanState();


}

class _EditVanState extends State<EditVan> {




  TextEditingController licenseController = TextEditingController();

  TextEditingController insuranceController = TextEditingController();

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


  List<String>? imagesgroup;


  String? brand,gears,fuels,vehino,insurdt,descriptxt;

  int? doors,luggages,seats,prices;


  String? multi;

  String radioButtonItemride = 'Self Driverrr';

  String? radioButtonItemvehicle = 'Self Driverrddr';

  String? radioButtonItemac;

  int? idride = 11;
  bool isSwitched = false;

  int? idvehicletype;
  int? idac = 31;



  @override
  void initState() {
    super.initState();
    //  value = widget.value == true;
    initSharedPref();

    setState(() {


      radioButtonItemvehicle = "Commercial";
      idride = widget.drivetype!;
      if(widget.drivetype == 1){
        xval = "yes";
      }


      if(widget.ac == "yes"){
        idac = 1;
      }
      else if(widget.ac == "no"){
        idac = 2;
      }





      if(widget.vehicletype == "Commercial"){
        idvehicletype = 1;
      }
      else if(widget.vehicletype == "Compact"){
        idvehicletype = 2;
      }
      else if(widget.vehicletype == "VIP"){
        idvehicletype = 3;
      }
      else if(widget.vehicletype == "Sports"){
        idvehicletype = 4;
      }





    });



  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }






  DriveCategoryController driveCategoryController = Get.put(DriveCategoryController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];


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


  List<File> selectedImagesnew = [];


  List<String> imagesarr = [];

  String? xval;


  GetAllCars? getAllCars;

  String? one;
  String? two;
  String? three;
  String? four;
  String? five;

  Future selectOneImage(ImageSource media) async{
    final XFile? selectedImage1 = await imagePicker.pickImage(source: media);
    setState(() {
      image1 = selectedImage1;
    });
    uploadoneImage();
  }

  Future<String?> getToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  uploadoneImage() async{

    var valTok = await getToken();
    var headers = {
      'Authorization': 'Bearer $valTok'
    };

    File? imagefile1 = File(image1!.path);
    Image.file(imagefile1!);
    File file1 = File(imagefile1.path);

    var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image',image1!.path));
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
      int endIndex = str.indexOf(xyz,startIndex+ abc.length);
      firstimage = str.substring(startIndex+abc.length,endIndex);
      print(firstimage);
    }
    else {
      print(response.reasonPhrase);
    }
  }


  Future selectTwoImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image2 = selectedImage;
    });
    uploadTwoImage();
  }
  uploadTwoImage() async{

    var valTok = await getToken();
    var headers = {
      'Authorization': 'Bearer $valTok'
    };


    File? imagefile2 = File(image2!.path);
    Image.file(imagefile2!);

    File file2 = File(imagefile2.path);

    var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image',image2!.path));
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
      int endIndex = str2.indexOf(xyz2,startIndex+ abc2.length);
      secondimage = str2.substring(startIndex+abc2.length,endIndex);
      print(secondimage);
    }
    else {
      print(response.reasonPhrase);
    }
  }


  Future selectThreeImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image3 = selectedImage;
    });
    uploadThreeImage();
  }

  uploadThreeImage() async{

    var valTok = await getToken();
    var headers = {
      'Authorization': 'Bearer $valTok'
    };


    File? imagefile3 = File(image3!.path);
    Image.file(imagefile3!);

    File file3 = File(imagefile3.path);

    var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image',image3!.path));
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
      int endIndex = str3.indexOf(xyz3,startIndex+ abc3.length);
      thirdimage = str3.substring(startIndex+abc3.length,endIndex);
      print(thirdimage);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future selectFourImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image4 = selectedImage;
    });

    uploadFourImage();

  }


  uploadFourImage() async{

    var valTok = await getToken();
    var headers = {
      'Authorization': 'Bearer $valTok'
    };


    File? imagefile4 = File(image4!.path);
    Image.file(imagefile4!);

    File file4 = File(imagefile4.path);

    var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/upload-image?'));

    request.files.add(await http.MultipartFile.fromPath('image',image4!.path));
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
      int endIndex = str4.indexOf(xyz4,startIndex+ abc4.length);
      fourthimage = str4.substring(startIndex+abc4.length,endIndex);
      print(fourthimage);
    }
    else {
      print(response.reasonPhrase);
    }
  }



  Future selectImages() async{
    final List<XFile> xfilePick = await imagePicker.pickMultiImage();

    if(xfilePick!.isNotEmpty){



      for (var i = 0; i < xfilePick.length; i++) {

        selectedImagesnew.add(File(xfilePick[i].path));

        var valTok = await getToken();
        var headers = {
          'Authorization': 'Bearer $valTok'
        };


        var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/upload-images'));

        for(int i = 0;i<selectedImagesnew.length;i++){

          request.files.add(await http.MultipartFile.fromPath('images[]', selectedImagesnew[i].path));
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
          int endIndex = stri.indexOf(xyzr,startIndex+ abcd.length);
          multi = stri.substring(startIndex+abcd.length,endIndex);
          imagesarr.add(multi ?? '');
          print(imagesarr);



          for(i = 0;i<imagesarr.length;i++){

            if(i==0){

              one = imagesarr[0];
              print("one $one");

            }

            if(i==1){

              two = imagesarr[1];
              print("two $two");

            }




            if(i==2){

              three = imagesarr[2];
              print("three $three");

            }
            if(i==3){

              four = imagesarr[3];
              print("four $four");

            }
            if(i==4){

              five = imagesarr[4];
              print("five $five");

            }

          }



        }
        else {
          print(response.reasonPhrase);
        }


      }

      setState(() {

      });


    }

    // setState(() {
    //
    // });

  }



  @override
  Widget build(BuildContext context) {

    print(radioButtonItemvehicle);



    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text("Edit Van",style: TextStyle(color: Colors.black),),

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
                      /*Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => shufflerBuilder()));*/
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

      body: RefreshIndicator(
        onRefresh: () async {
          setState(()
          {

          }
          );

        },
        child: Stack(
          children: [








            // if(radioButtonItem == null){
            //   radioButtonItem == widget.ride
            // }


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
                          child: Text('Choose the ride option')),
                    ),

//                  //   if(condition) Widget() else Widget(),
//


                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: idride,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItemride = 'Self Drive';
                              idride = 1;
                              print(idride);
                            });
                          },
                        ),
                        Text(
                          'Self Drive',
                          style: new TextStyle(fontSize: 12.0),
                        ),


                        Radio(
                          value: 2,
                          groupValue: idride,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItemride = 'With Driver';
                              idride = 2;
                              print(idride);
                            });
                          },
                        ),
                        Text(
                          'With Driver',
                          style: new TextStyle(fontSize: 12.0),
                        ),


                        Radio(
                          value: 3,
                          groupValue: idride,
                          onChanged: (val) {

                            setState(() {
                              radioButtonItemride = 'Wedding Ride';
                              idride = 3;
                              print(idride);
                            });


                          },


                        ),
                        Text(
                          'Wedding Ride',
                          style: new TextStyle(fontSize: 12.0),
                        ),

                      ],
                    ),





                    if(radioButtonItemride == 'Self Drive') Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                            padding: EdgeInsets.only(left: 11),
                            child: Text("Security Deposit",style: TextStyle(fontWeight: FontWeight.bold),)),


                        SizedBox(
                          width: 41,
                        ),

                        Text('Yes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),

                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);

                              if(isSwitched == true){
                                xval = "yes";
                              }
                              else{
                                xval = "no";
                              }


                            }
                            );
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                        Text('No',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),

                      ],
                    ) else Text(''),





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
                          child: Text('Vehicle Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),






                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: idvehicletype,
                          onChanged: (val) {

                            //    radioButtonItemvehicle = widget.vehicletype!;

                            setState(() {

                              radioButtonItemvehicle = 'Commercial';
                              idvehicletype = 1;
                            });
                          },
                        ),
                        Text(
                            'Commercial',
                            style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300)
                        ),


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
                        Text(
                            'Compact',
                            style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300)
                        ),

                      ],
                    ),
//
//
                    Row(

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
                          style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300),
                        ),

                        SizedBox(
                          width: 66,
                        ),

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
                          style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300),
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


                            Text('Brand & Model',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            SizedBox(
                              width: 105,
                            ),
                            Text('No. of Doors',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        //   Text('hhk'),







                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            //initialValue: widget.brandn ?? '',
                            controller: brandNameController,
                            keyboardType: TextInputType.text,
                            validator: (brandNameController) {
                              String value = brandNameController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.brandn,
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
                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: numofdoorController,
                            keyboardType: TextInputType.number,
                            validator: (numofdoorController) {
                              String value = numofdoorController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.doors,
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


                            Text('Luggage Space (ltr)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            SizedBox(
                              width: 51,
                            ),
                            Text('Air Condition',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),



//


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        //   Text('hhk'),

                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: noofluggageController,
                            keyboardType: TextInputType.number,
                            validator: (noofluggageController) {
                              String value = noofluggageController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.luggage,
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
                        SizedBox(
                          width: 155,
                          height: 42,
                          child: Row(
                            children: [

                              Radio(
                                value: 1,
                                groupValue: idac,
                                onChanged: (val) {
                                  setState(() {
                                    radioButtonItemac = 'yes';
                                    idac = 1;
                                  });
                                },
                              ),
                              Text(
                                'Yes',
                                style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300),
                              ),

                              SizedBox(
                                width: 6,
                              ),

                              Radio(
                                value: 2,
                                groupValue: idac,
                                onChanged: (val) {
                                  setState(() {
                                    radioButtonItemac = 'no';
                                    idac = 2;
                                  });
                                },
                              ),
                              Text(
                                'No',
                                style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w300),
                              ),





                            ],
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


                            Text('Gear Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            SizedBox(
                              width: 131,
                            ),
                            Text('Fuel Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        //   Text('hhk'),







                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: gearController,
                            keyboardType: TextInputType.text,
                            validator: (gearController) {
                              String value = gearController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.gear,
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
                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: fuelController,
                            keyboardType: TextInputType.text,
                            validator: (fuelController) {
                              String value = fuelController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.fuel,
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


                            Text('No. of Seats',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            SizedBox(
                              width: 111,
                            ),
                            Text('Vehicle No.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //   Text('hhk'),
                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: seatsController,
                            keyboardType: TextInputType.number,
                            validator: (seatsController) {
                              String value = seatsController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.seats,
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
                        SizedBox(
                          width: 155,
                          height: 42,
                          child: TextFormField(
                            controller: vehiclenoController,
                            keyboardType: TextInputType.text,
                            validator: (vehiclenoController) {
                              String value = vehiclenoController.toString();
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.vehno,
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

                            //
                            // Text('License Expired Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            // SizedBox(
                            //   width: 61,
                            // ),
                            Text('Insurance Expired Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      children: [

                        // //Expanded(
                        // // child:
                        // Padding(
                        //   padding: EdgeInsets.only(left: 0),
                        //   child: Container(
                        //     color: Colors.brown.shade50,
                        //     padding:const EdgeInsets.all(15),
                        //     height:50,
                        //     width: 144,
                        //     child: Padding(
                        //       padding: EdgeInsets.only(top: 4),
                        //       child: TextField(
                        //
                        //         controller: licenseController, //editing controller of this TextField
                        //         // validator: (vehiclenoController) {
                        //         //   String value = vehiclenoController.toString();
                        //         //   if (value.length == 0) {
                        //         //     return 'please enter';
                        //         //   }
                        //         //   else{
                        //         //     return '';
                        //         //   }
                        //         // },
                        //
                        //         decoration: const InputDecoration(
                        //
                        //             border: InputBorder.none,
                        //
                        //             hintText: '2023-05-21'
                        //         ),
                        //         readOnly: true,  // when true user cannot edit text
                        //         onTap: () async {
                        //           DateTime? pickedTime = await showDatePicker(
                        //               context: context,
                        //               initialDate: DateTime.now(), //get today's date
                        //               firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        //               lastDate: DateTime(2101)
                        //
                        //
                        //           );
                        //
                        //           if(pickedTime != null ){
                        //             print(pickedTime);  //get the picked date in the format => 2022-07-04 00:00:00.000
                        //             String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                        //             print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //             setState(() {
                        //               licenseController?.text = formattedDate; //set foratted date to TextField value.
                        //             });
                        //           }else{
                        //             print("Date is not selected");
                        //           }
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // // ),
                        //
                        //
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
                            padding:const EdgeInsets.all(15),
                            height:50,
                            width: 144,
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: TextField(

                                controller: insuranceController, //editing controller of this TextField
                                decoration:  InputDecoration(

//                                    suffixIcon: Icon(Icons.calendar_month,color: Colors.purple,),
                                    border: InputBorder.none,
                                    hintText: widget.insurance

                                ),
                                readOnly: true,  // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(), //get today's date
                                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101)


                                  );

                                  if(pickedTime != null ){
                                    print(pickedTime);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                    //You can format date as per your need

                                    //  String newTime = formattedDate.replaceAll(new RegExp(r'[^\w\s]+'),'');


                                    setState(() {
                                      insuranceController?.text = formattedDate; //set foratted date to TextField value.
                                    });
                                  }else{
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
                            child: Icon(Icons.calendar_month,color: Colors.purple,)),

                      ],
                    ),


                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),


                    SizedBox(
                      height: 11,
                    ),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: SizedBox(
                            width: 300,
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
                                hintText: widget.price,
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
                          child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),


                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11,right: 11),
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
                              hintText: widget.description,
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
                          )
                      ),
                    ),



                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Image of vehicle license and insurance copy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),


                    SizedBox(
                      height: 11,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        image1 != null ? Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: GestureDetector(
                            onTap: (){
                              selectOneImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 115,
                              width: 161,
                              child: Card(
                                  color: Colors.brown.shade50,
                                  child: Image.file(File(image1!.path),fit: BoxFit.cover,)
                              ),
                            ),
                          ),
                        ): GestureDetector(
                          onTap: (){
                            selectOneImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs!,fit: BoxFit.cover,),

                            ),
                          ),
                        ),




                        SizedBox(
                          width: 21,
                        ),
                        image2 != null ? GestureDetector(
                          onTap: (){
                            selectTwoImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                                color: Colors.brown.shade50,
                                child: Image.file(File(image2!.path),fit: BoxFit.cover,)
                            ),
                          ),
                        ): GestureDetector(
                          onTap: (){
                            selectTwoImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs2!,fit: BoxFit.cover,),
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
                          child: Text('Image of vehicle book copy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),

                    SizedBox(
                      height: 11,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        image3 != null ? Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: GestureDetector(
                            onTap: (){
                              selectThreeImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 115,
                              width: 161,
                              child: Card(
                                  color: Colors.brown.shade50,
                                  child: Image.file(File(image3!.path),fit: BoxFit.cover,)
                              ),
                            ),
                          ),
                        ): GestureDetector(
                          onTap: (){
                            selectThreeImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs3!,fit: BoxFit.cover,),

                            ),
                          ),
                        ),


                        SizedBox(
                          width: 21,
                        ),
                        image4 != null ? GestureDetector(
                          onTap: (){
                            selectFourImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                                color: Colors.brown.shade50,
                                child: Image.file(File(image4!.path),fit: BoxFit.cover,)
                            ),
                          ),
                        ): GestureDetector(
                          onTap: (){
                            selectFourImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs4!,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 31,
                    ),


                    GestureDetector(
                      onTap: (){  },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        child: selectedImagesnew.isEmpty ? GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:  5,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1

                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // TO show selected file
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26
                                      ,width: 2
                                  )
                              ),
                              child:  Image.network(
                                widget.group?[index] ?? '',fit: BoxFit.cover,
                              ),
                            );

                          },
                        )


                            : GridView.builder(

                          scrollDirection: Axis.horizontal,
                          itemCount:  selectedImagesnew.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1

                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // TO show selected file
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26
                                      ,width: 2
                                  )
                              ),
                              child: kIsWeb
                                  ? Image.network(
                                  selectedImagesnew[index].path)
                                  : Image.file(selectedImagesnew[index]),
                            );

                          },
                        ),
                      ),
                    ),

                    if(selectedImagesnew.length < 6)
                      ElevatedButton(onPressed: (){

                        selectImages();

                      }, child: Text('Add Images')
                      )else Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('Max 5 images allowed',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),


                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/4.22,
                          right: MediaQuery.of(context).size.width/4.22,
                          top: MediaQuery.of(context).size.height/24.44,
                          bottom: 11
                      ),

                      child: SizedBox(
                        height: MediaQuery.of(context).size.height/18.38,
                        width: MediaQuery.of(context).size.width/2.56,
                        child: ElevatedButton(
                          style: ButtonStyle(

                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: () {

                            String? valTok = prefs.getString('token');
                            print("enterdetails: $valTok");


                            //1
                            if(brandNameController.text == ""){
                              brand = widget.brandn;
                            }
                            else{
                              brand = brandNameController.text;
                            }

                            //2
                            if(fuelController.text == ""){
                              fuels = widget.fuel;
                            }
                            else{
                              fuels = fuelController.text;
                            }

                            //3
                            if(gearController.text == ""){
                              gears = widget.gear;
                            }
                            else{
                              gears = gearController.text;
                            }

                            //4
                            if(vehiclenoController.text == ""){
                              vehino = widget.vehno;
                            }
                            else{
                              vehino = vehiclenoController.text;
                            }
                            //5
                            if(insuranceController.text == ""){
                              insurdt = widget.insurance;
                            }
                            else{
                              insurdt = insuranceController.text;
                            }
                            //6
                            if(descriptionController.text == ""){
                              descriptxt = widget.description;
                            }
                            else{
                              descriptxt = descriptionController.text;
                            }
                            //7
                            if(numofdoorController.text == ""){
                              doors = widget.doors.toInt();
                            }
                            else{
                              doors = int.parse(numofdoorController.text);
                            }

                            //8
                            if(noofluggageController.text == ""){
                              luggages = widget.luggage.toInt();
                            }
                            else{
                              luggages = int.parse(noofluggageController.text);
                            }
                            //9
                            if(seatsController.text == ""){
                              seats = widget.seats.toInt();
                            }
                            else{
                              seats = int.parse(seatsController.text);
                            }
                            //10
                            if(priceController.text == ""){
                              prices = widget.price.toInt();
                            }
                            else{
                              prices = int.parse(priceController.text);
                            }




                            editVan(
                              idride ?? widget.id,
                              radioButtonItemvehicle ?? widget.vehicletype,
                              xval ?? widget.secdepo,
                              brand ?? widget.brandn,
                              doors,
                              luggages,
                              radioButtonItemac ?? widget.ac,
                              gears ?? widget.gear,
                              fuels ?? widget.fuel,
                              seats,
                              vehino ?? widget.vehno,
                              insurdt ?? widget.insurance,
                              prices,
                              descriptxt ?? widget.description,
                              firstimage ?? '',
                              secondimage ?? '',
                              thirdimage ?? '',
                              fourthimage ?? '',
                              one ?? '',
                              two ?? '',
                              three ?? '',
                              four ?? '',
                              five ?? '',
                              // three ?? widget.editimgs7,
                              // four ?? widget.editimgs8,
                              // five ?? widget.editimgs9,
                            );


                            print("veh $radioButtonItemvehicle");



                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Submit',style: TextStyle(fontSize: MediaQuery.of(context).size.width/18.11),)),
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



  void editVan(
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
    try{

      var valToken = await getToken();
      print("edit van $valToken");

      Response response = await put(
          Uri.parse('http://pick4ride.com/api/merchant/vehicles/${widget.id}'),

          body:  json.encode(
              {
                "vehicle_category": 2,
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
                  {
                    "type": "insurance",
                    "image": imageOneinsur
                  },
                  {
                    "type": "insurance",
                    "image": imageTwoinsur
                  },
                  {
                    "type": "insurance",
                    "image": imageOnerc
                  },
                  {
                    "type": "insurance",
                    "image": imageTworc
                  },
                  {
                    "type": "vehicle",
                    "image": imageOneveh
                  },
                  {
                    "type": "vehicle",
                    "image": imageTwoveh
                  },
                  {
                    "type": "vehicle",
                    "image": imageThreeveh
                  },
                  {
                    "type": "vehicle",
                    "image": imageFourveh
                  },
                  {
                    "type": "vehicle",
                    "image": imageFiveveh
                  }
                ]
              }
          ),
          headers: {
            'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
          }
      );


      if(response.statusCode == 200){

        setState(() {

        });

        print(response.body.toString());
        print('vehicle added');
        //String? valTok = prefs.getString('token');
        //print("valTok: $valTok");
        //var result = jsonDecode(response.body);
        //getAllCars = GetAllCars.fromJson(result);




        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisteredCarsList()));


      }
      else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
      print('catched');
    }
  }

  void noToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var x = preferences.getString('token');

    if(x == null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    }

  }

}