import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pick4ridemerchant/screens/common/registered_cars_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';
import '../login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CarDetails extends StatefulWidget {

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
  final String? insur;


  const CarDetails({
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
    @required this.insur,

    Key? key,
  }) : super(key: key);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {




  TextEditingController licenseController = TextEditingController();
//  TextEditingController pickUptimeController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  // TextEditingController dropOfftimeController = TextEditingController();

  CarouselController carouselController = CarouselController();

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
  bool agree = false;


  List<String?> widgetimg = [];

  String? vehwidaimg;
  String? vehwidbimg;
  String? vehwidcimg;
  String? vehwiddimg;
  String? vehwideimg;

  @override
  Widget build(BuildContext context) {


    vehwidaimg = widget.imgs5;
    widgetimg.add(vehwidaimg);

    vehwidbimg = widget.imgs6;
    widgetimg.add(vehwidbimg);

    vehwidcimg = widget.imgs7;
    widgetimg.add(vehwidcimg);

    vehwiddimg = widget.imgs8;
    widgetimg.add(vehwiddimg);

    vehwideimg = widget.imgs9;
    widgetimg.add(vehwideimg);





    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text("Car Details",style: TextStyle(color: Colors.black),),

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

            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [


                  // Positioned(
                  //     top: 282,
                  //     left: 22,
                  //     child: Text('aaa')),




                  SizedBox(
                    height: 311,
                    width: 411,
                    child: Stack(
                      children: [





                        GestureDetector(
                          onTap: (){
                          },
                          child: CarouselSlider.builder(
                            carouselController: carouselController,
                            options: CarouselOptions(
                              height:280.0,
                            ),
                            itemCount: 5,
                            itemBuilder: (context, itemIndex, realIndex)
                            {
                              return Padding(
                                  padding: const EdgeInsets.all(21.0),


                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    //   color: Colors.brown.shade50,

                                  //  child: Image.network(widget.imgs!,fit: BoxFit.cover,),



                                    child: Image.network(widgetimg[itemIndex]!,fit: BoxFit.cover,),




                                  )


                              );
                            },
                          ),
                        ),





                        Positioned(
                          // alignment: Alignment.centerLeft,
                          top: 118,
                          left: 19,
                          child: IconButton(
                            onPressed: (){
                              carouselController.previousPage();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                        ),

                        Positioned(
                          // alignment: Alignment.centerLeft,
                          top: 118,left: 331,
                          child: IconButton(
                            onPressed: (){
                              carouselController.nextPage();
                            },
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),






                      ],
                    ),
                  ),






                  //   if(condition) Widget() else Widget(),






                  SizedBox(
                    height: 11,
                  ),



                  Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [


                          Text('Brand/Model',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(
                            width: 113,
                          ),
                          Text('Vehicle Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


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
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.brandn!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),



                        SizedBox(
                          width: 11,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.vehicletype!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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
                            width: 118,
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
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.seats!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),


                        SizedBox(
                          width: 11,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.doors!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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


                          Text('Count of Luggage Space',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(
                            width: 46,
                          ),
                          Text('Air Condition(AC/Non-AC)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


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
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.luggage!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),



                        SizedBox(
                          width: 11,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.ac!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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


                  Container(
                    height: 42,
                    child: Row(
                      children: [



                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.gear!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),



                        SizedBox(
                          width: 11,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.fuel!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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


                          Text('Fuel Status',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(
                            width: 127,
                          ),
                          Text('Price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


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
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text("Full",maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),



                        SizedBox(
                          width: 11,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 42,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 19,right: 6),
                                  child: Text(widget.price!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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




                  Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [



                        // Expanded(
                        //      child:
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Container(
                            // color: Colors.brown.shade50,
                            child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          ),
                        ),
                        //  ),



                        SizedBox(
                          width: 71,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 53,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 5,left: 6,right: 6),
                                  child: Text(widget.description!,maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


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




                  Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [



                        // Expanded(
                        //      child:
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Container(
                            // color: Colors.brown.shade50,
                            child: Text("Security Deposit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          ),
                        ),
                        //  ),



                        SizedBox(
                          width: 41,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 53,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 6,right: 6),
                                  child: Text("${widget.secdepo}: 8,000",maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),

                        //TextFormField(),
                        //TextFormField(),$

                      ],
                    ),
                  ),


                  SizedBox(
                    height: 11,
                  ),


                  Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [



                        // Expanded(
                        //      child:
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Container(
                            // color: Colors.brown.shade50,
                            child: Text("Insurance Expiry Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          ),
                        ),
                        //  ),



                        SizedBox(
                          width: 41,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Container(
                              height: 53,
                              color: Colors.brown.shade50,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15,left: 6,right: 6),
                                  child: Text("${widget.insur}",maxLines:2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),)),


                            ),


                          ),
                        ),

                        //TextFormField(),
                        //TextFormField(),$

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 31,
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
                      widget.imgs != null ? Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                                color: Colors.brown.shade50,
                                child: Image.network(widget.imgs!,fit: BoxFit.cover,)
                            ),
                          ),
                        ),
                      ): GestureDetector(
                        onTap: (){

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
                      widget.imgs2 != null ? GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 115,
                          width: 161,
                          child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs2!,fit: BoxFit.cover,)
                          ),
                        ),
                      ): GestureDetector(
                        onTap: (){

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
                      widget.imgs3 != null ? Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 115,
                            width: 161,
                            child: Card(
                                color: Colors.brown.shade50,
                                child: Image.network(widget.imgs3!,fit: BoxFit.cover,)
                            ),
                          ),
                        ),
                      ): GestureDetector(
                        onTap: (){

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
                      widget.imgs4 != null ? GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 115,
                          width: 161,
                          child: Card(
                              color: Colors.brown.shade50,
                              child: Image.network(widget.imgs4!,fit: BoxFit.cover,)
                          ),
                        ),
                      ): GestureDetector(
                        onTap: (){

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
                    padding: EdgeInsets.only(bottom: 71),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height/22.38,
                          width: MediaQuery.of(context).size.width/2.16,
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

                              print(widgetimg);

                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('Edit',style: TextStyle(fontSize: MediaQuery.of(context).size.width/24.11),)),
                          ),
                        ),


                        // SizedBox(
                        //   width: 11,
                        // ),


                        SizedBox(
                          height: MediaQuery.of(context).size.height/22.38,
                          width: MediaQuery.of(context).size.width/2.16,
                          child: ElevatedButton(
                            style: ButtonStyle(

                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white24),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(31),
                                        side: BorderSide(color: Colors.white24)
                                    )
                                )
                            ),
                            onPressed: () {
                              var newToken = prefs.getString('token');
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisteredCarsList(token: newToken)));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:
                                  Text('Other Vehicle',style: TextStyle(fontSize: MediaQuery.of(context).size.width/24.11,color: Colors.black),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),




                ],
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



  void noToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var x = preferences.getString('token');

    if(x == null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    }

  }

}