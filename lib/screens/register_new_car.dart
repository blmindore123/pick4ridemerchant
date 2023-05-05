import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/drive_category_controller.dart';
import 'home.dart';
import 'login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class RegisterNewCar extends StatefulWidget {
  @override
  _RegisterNewCarState createState() => _RegisterNewCarState();
}

class _RegisterNewCarState extends State<RegisterNewCar> {




  TextEditingController licenseController = TextEditingController();
//  TextEditingController pickUptimeController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
 // TextEditingController dropOfftimeController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;
  TextEditingController brandNameController = TextEditingController();
  TextEditingController numofdoorController = TextEditingController();
  TextEditingController noofluggageController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();








  @override
  void initState() {
    super.initState();
    //  value = widget.value == true;
    initSharedPref();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  String radioButtonItem = 'Self Drive';
  int id = 1;
  bool isSwitched = false;

  int idvehicletype = 1;
  int idac = 1;

  DriveCategoryController driveCategoryController = Get.put(DriveCategoryController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];


  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;
  bool agree = false;

  Future selectOneImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image1 = selectedImage;
    });
  }



  Future selectTwoImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image2 = selectedImage;
    });
  }



  Future selectThreeImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image3 = selectedImage;
    });
  }


  Future selectFourImage(ImageSource media) async{
    final XFile? selectedImage = await imagePicker.pickImage(source: media);
    setState(() {
      image4 = selectedImage;
    });
  }



  void selectImages() async{
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if(selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }

    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text("Register New Car",style: TextStyle(color: Colors.black),),

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





            Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [



                    if (imageFileList!.length == 0) GestureDetector(
                  onTap: (){
        selectImages();
        },
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 200.0,
            ),
            itemCount: imageFileList!.length,
            itemBuilder: (context, itemIndex, realIndex)
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),

                child: Flexible(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.brown.shade50,

                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black,)
                        // ),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 113),
                                child: Text('Upload Pic',style: TextStyle(fontWeight: FontWeight.bold),)),
                          ],
                        )

                    )

                ),
              );
            },
          ),
        )
                    else GestureDetector(
                      onTap: (){
                        selectImages();
                      },
                      child: CarouselSlider.builder(
                        options: CarouselOptions(

                          height: 300.0,
                         // autoPlay: true,
                        ),
                        itemCount: imageFileList!.length,
                        itemBuilder: (context, itemIndex, realIndex)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),

                              child: Flexible(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    

                                    child: Image.file(File(imageFileList[itemIndex].path),fit: BoxFit.cover,)

                                )

                              ),
                          );
                        },
                      ),
                    ),


                    

                    // Container(
                    //   height: 233,
                    //   child: GridView.builder(
                    //       itemCount: imageFileList!.length,
                    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 2
                    //       ),
                    //       itemBuilder: (BuildContext context,int index){
                    //
                    //         return Image.file(File(imageFileList[index].path),fit: BoxFit.cover,);
                    //
                    //       }
                    //   ),
                    // ),

                    //
                    // ElevatedButton(
                    //     onPressed: (){
                    //   selectImages();
                    //
                    // }, child: Text('aaaa'),
                    // ),


               


                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Choose the ride option')),
                    ),



                 //   if(condition) Widget() else Widget(),





                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Self Drive';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Self Drive',
                          style: new TextStyle(fontSize: 12.0),
                        ),


                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'With Driver';
                              id = 2;
                            });
                          },
                        ),
                        Text(
                          'With Driver',
                          style: new TextStyle(fontSize: 12.0),
                        ),


                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Wedding Ride';
                              id = 3;
                            });
                          },
                        ),
                        Text(
                          'Wedding Ride',
                          style: new TextStyle(fontSize: 12.0),
                        ),

                      ],
                    ),





                    if(radioButtonItem == 'Self Drive') Row(
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
    }
    );
    },
    activeTrackColor: Colors.lightGreenAccent,
    activeColor: Colors.green,
    ),
    Text('No',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),

    ],
    ) else Text(''),










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
                            setState(() {
                              radioButtonItem = 'Commercial';
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
                              radioButtonItem = 'Compact';
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


                    Row(

                      children: [
                        Radio(
                          value: 3,
                          groupValue: idvehicletype,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'VIP';
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
                              radioButtonItem = 'Sports';
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


                    Container(
                      height: 42,
                      child: Row(
                        children: [



                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: TextFormField(
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



                          SizedBox(
                            width: 11,
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 11),
                              child: TextFormField(
                                controller: numofdoorController,
                                keyboardType: TextInputType.phone,
                                 validator: (numofdoorController) {
                                  String value = numofdoorController.toString();
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

                          //TextFormField(),
                          //TextFormField(),

                        ],
                      ),
                    ),




                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Text('No. of Luggage Space',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
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


                    Container(
                      height: 42,
                      child: Row(
                        children: [



                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: TextFormField(
                                controller: noofluggageController,
                                keyboardType: TextInputType.phone,
                                validator: (noofluggageController) {
                                  String value = noofluggageController.toString();
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
                            width: 11,
                          ),

                          Expanded(

                            child: Row(
                              children: [

                                Radio(
                                  value: 1,
                                  groupValue: idac,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'YES';
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
                                      radioButtonItem = 'NO';
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

                          //TextFormField(),
                          //TextFormField(),

                        ],
                      ),
                    ),



                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Text('Cast Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
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


                    Container(
                      height: 42,
                      child: Row(
                        children: [



                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: TextFormField(
                                controller: castController,
                                keyboardType: TextInputType.text,
                                validator: (castController) {
                                  String value = castController.toString();
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
                            width: 11,
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 11),
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

                          //TextFormField(),
                          //TextFormField(),

                        ],
                      ),
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


                    Container(
                      height: 42,
                      child: Row(
                        children: [



                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: TextFormField(
                                controller: seatsController,
                                keyboardType: TextInputType.phone,
                                validator: (seatsController) {
                                  String value = seatsController.toString();
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
                            width: 11,
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 11),
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

                          //TextFormField(),
                          //TextFormField(),

                        ],
                      ),
                    ),


                    SizedBox(
                      height: 11,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Text('License Expired Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            SizedBox(
                              width: 61,
                            ),
                            Text('Insurance Expired Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                          ],
                        )
                    ),

                    SizedBox(
                      height: 11,
                    ),


                    Container(
                      height: 52,
                      width: 331,
                      child: Row(
                        children: [

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Container(
                                color: Colors.brown.shade50,
                                padding:const EdgeInsets.all(15),
                                height:50,
                                width: 144,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: TextField(

                                    controller: licenseController, //editing controller of this TextField
                                    // validator: (vehiclenoController) {
                                    //   String value = vehiclenoController.toString();
                                    //   if (value.length == 0) {
                                    //     return 'please enter';
                                    //   }
                                    //   else{
                                    //     return '';
                                    //   }
                                    // },

                                    decoration: const InputDecoration(

                                      border: InputBorder.none,

                                      hintText: 'MM/DD/YY'
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
                                        String formattedDate = DateFormat('MM-dd-yy').format(pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                        setState(() {
                                          licenseController.text = formattedDate; //set foratted date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),


                          Container(
                              height: 50,
                              color: Colors.brown.shade50,
                              child: Icon(Icons.calendar_month,color: Colors.purple,)),


                          SizedBox(
                            width: 11,
                          ),

                          Expanded(
                            child: Padding(
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
                                    decoration: const InputDecoration(

//                                    suffixIcon: Icon(Icons.calendar_month,color: Colors.purple,),
                                      border: InputBorder.none,
                                      hintText: 'MM/DD/YY'

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
                                        String formattedDate = DateFormat('MM-dd-yy').format(pickedTime); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                        //You can format date as per your need

                                        //  String newTime = formattedDate.replaceAll(new RegExp(r'[^\w\s]+'),'');


                                        setState(() {
                                          insuranceController.text = formattedDate; //set foratted date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                              height: 50,
                              color: Colors.brown.shade50,
                              child: Icon(Icons.calendar_month,color: Colors.purple,)),

                        ],
                      ),
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
                              keyboardType: TextInputType.phone,
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
                            ),
                          ),
                        ),
                      ],
                    ),



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
                            if(_formKey.currentState!.validate() && image1 != null && image2 != null && image3 != null && image4 != null && imageFileList != null){

                             _formKey.currentState?.save();
                              String? valTok = prefs.getString('token');
                              print("enterdetails: $valTok");
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

                           }
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Submit',style: TextStyle(fontSize: MediaQuery.of(context).size.width/18.11),)),
                        ),
                      ),
                    ),

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



}







