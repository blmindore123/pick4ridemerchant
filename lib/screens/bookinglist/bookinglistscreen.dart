import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/appconst.dart';
import '../../controller/bookinglistcontroller.dart';
import '../../widgets/drawer.dart';
import '../login_otp.dart';
import 'booking_details.dart';




class BookingListScreen extends StatefulWidget {

  final token;



  const BookingListScreen({
    @required this.token,



    Key? key,
  }) : super(key: key);


  @override
  _BookingListScreenState createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {

  String? typebook;
  final List<String> _selectedItems = [];
  late SharedPreferences prefs;
  String? token;
  late final Gradient gradient;
  String? gearmodel;
  String? bookingcount;

  BookingListController bookingListController = Get.put(BookingListController());
  TextEditingController rejectreasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initSharedPref();
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      setState(() {
        bookingListController.fetchCarsBookingList(gearmodel ?? '',
          //    bookingcount ?? ''
        );
      });

    });

    // _selectedAnimals2 = _animals;

  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }








  static List<Animal> _animals = [
    Animal(id: 1, name: "All"),
    Animal(id: 2, name: "Past"),
    Animal(id: 3, name: "Current"),
    Animal(id: 4, name: "Future"),
  ];

  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();

  final _multiSelectKey = GlobalKey<FormFieldState>();

  List<Animal> _selectedAnimals5 = [];











  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Booking List",style: TextStyle(color: Colors.black),),

          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        //endDrawer: MyDrawer(),
        endDrawer: MyDrawer(),

        backgroundColor: Colors.white,
        body:

        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),

          child:

          //     Obx(
          // () => getAllCarsController.isLoading.value
          // ? Center(
          // child: CircularProgressIndicator(),
          // ):

          RefreshIndicator(
            onRefresh: () async {
              setState(() {});

            },

            child:

            Stack(
              children: [

                // child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/2.3,
//                          margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                            //color: Colors.blue,
                            child: Row(
                              children: [



                                // Icon(Icons.library_books,color: Colors.purple,size: 25,),
                                //
                                // Text("All Bookings"),

                                SizedBox(
                                  width: 130,
                                  height: 32,
                                  child: DropdownSearch<String>(
                                    //mode of dropdown
                                    // mode: Mode.DIALOG,
                                    // //to show search box
                                    // showSearchBox: true,
                                    // showSelectedItem: true,
                                    //list of dropdown items
                                    items: [
                                      "All",
                                      "Past",
                                      "Current",
                                      "Future",
                                    ],
                                    //    label: "Country",

                                    onChanged: (vgear){

                                      if(vgear == "All"){
                                        setState(() {
                                          gearmodel = "all";
                                          prefs.setString('bookingname', gearmodel!);
                                          print("type of saved pref book $gearmodel");
                                          bookingListController.fetchCarsBookingList(
                                              gearmodel ?? ''
                                          );
                                        });

                                      }
                                      if(vgear == "Past"){
                                        setState(() {
                                          gearmodel = "past";
                                          prefs.setString('bookingname', gearmodel!);
                                          print("type of saved pref book $gearmodel");
                                          bookingListController.fetchCarsBookingList(
                                              gearmodel ?? ''
                                          );
                                        });

                                      }
                                      if(vgear == "Current"){
                                        setState(() {
                                          gearmodel = "current";
                                          prefs.setString('bookingname', gearmodel!);
                                          print("type of saved pref book $gearmodel");
                                          bookingListController.fetchCarsBookingList(
                                              gearmodel ?? ''
                                          );
                                        });

                                      }
                                      if(vgear == "Future"){
                                        setState(() {
                                          gearmodel = "future";
                                          prefs.setString('bookingname', gearmodel!);
                                          print("type of saved pref book $gearmodel");
                                          bookingListController.fetchCarsBookingList(
                                              gearmodel ?? ''
                                          );
                                        });

                                      }
                                      else{
                                        print("");
                                      }
                                    },
                                    //show selected item
                                    selectedItem: "All",
                                  ),

                                ),

                              ],
                            ),
                          ),
                        ),




                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/2.3,
                            //color: Colors.blue,
                            child: Row(
                              children: [

                                Icon(Icons.library_books,color: Colors.purple,size: 25,),
                                Text("Extend Booking"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),





                    Divider(color: Colors.black,),

                    // Obx(
                    //      () =>  bookingListController.isLoading.value
                    //      ? Center(
                    //    child: CircularProgressIndicator(),
                    //  ) :
                    //      Text({bookingListController.selfDriveCarModel?.data}.toString()),
                    // ),

                    // Text(widget.pickadd ?? ''),
                    // Text(widget.dropadd ?? ''),

                    SizedBox(
                      height: 11,
                    ),







                    Container(



                      child: Obx(
                            () =>  bookingListController.isLoadingbookinglist.value
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            :ListView.builder(


                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: bookingListController.bookingListModel?.data.length ??  0,

                            itemBuilder: (context,index){


                              String pickdates = bookingListController.bookingListModel?.data[index].pickupDate ?? '';
                              String result = pickdates.substring(0,pickdates.indexOf('00:00:00'));

                              print(result);


                              String dropdates = bookingListController.bookingListModel?.data[index].dropOffDate ?? '';
                              String result2 = dropdates.substring(0,dropdates.indexOf('00:00:00'));

                              print(result2);


                              int? bookvehiclesid = bookingListController.bookingListModel?.data[index].vehicle.id;
                              print(bookvehiclesid);
                              // bookingcount = bookingListController.bookingListModel?.data.length.toString();
                              // prefs.setString('bookingcount', bookingcount!);







                              var imagevehicledet = AppConstants.DEFAULT_IMAGE;
                              print(imagevehicledet);
                              for (var i = 5; i <  bookingListController.bookingListModel!.data[index].vehicle.images.length; i++) {
                                imagevehicledet = bookingListController.bookingListModel!.data[index].vehicle.images[i].imageUrl ?? '';
                                break;
                              }



                              Widget _dialogrejectbooking(BuildContext context) {

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
                                          width: MediaQuery.of(context).size.width, height: 300,

                                          child: Column(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              Text("Are you sure you want to reject this booking?",softWrap: true,),

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
                                                          child:
                                                          Form(
                                                            key: _formKey,
                                                            child: SizedBox(
                                                              width: MediaQuery.of(context).size.width,
                                                              height: 42,
                                                              child:
                                                              TextFormField(
                                                                controller: rejectreasonController,
                                                                keyboardType: TextInputType.text,
                                                                validator: (rejectreasonController) {
                                                                  String value = rejectreasonController.toString();
                                                                  if (value!.isEmpty) {
                                                                    return 'Please enter some text';
                                                                  }
                                                                  return null;
                                                                },


                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  hintText: "Write here",
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(9),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.grey.shade50,
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

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ),




                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {



                                                      String? valTok = prefs.getString('token');
                                                      print("signout: $valTok");

                                                      acceptrejectbook(
                                                          bookingListController.bookingListModel?.data[index].id,
                                                          'rejected',
                                                          rejectreasonController.text
                                                      );

                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingListScreen(token: token)));

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
                                                        child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),)

                                                    ),
                                                  ),




                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
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
                                                        child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),)

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

                              Widget _dialogacceptbooking(BuildContext context) {



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
                                          width: MediaQuery.of(context).size.width, height: 300,

                                          child: Column(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              Text("Are you sure you want to accept this booking?",softWrap: true,),


                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {



                                                      String? valTok = prefs.getString('token');
                                                      print("signout: $valTok");

                                                      acceptrejectbook(
                                                          bookingListController.bookingListModel?.data[index].id,
                                                          'accepted',
                                                          ''
                                                      );

                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingListScreen(token: token)));

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
                                                        child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),)

                                                    ),
                                                  ),




                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
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
                                                        child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),)

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


                              return Padding(
                                padding: EdgeInsets.all(15),
                                child: Card(
                                  elevation: 10,
                                  //    shadowColor: Colors.black,
                                  color: Colors.white,

                                  child: SizedBox(
                                    width: 350,
                                    height: 250,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              // Text("Ride Confirm"
                                              //   ,style: TextStyle(fontWeight: FontWeight.bold),),

                                              // SizedBox(
                                              //   width: 35,
                                              // ),




                                              Container(
                                                // width: 16,
                                                // height: 16,
                                                  decoration: BoxDecoration(
                                                    //  color: Colors.lightGreen,
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.circular(
                                                            30)),
                                                  ),
                                                  child: Row(
                                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        bookingListController.bookingListModel?.data[index].vehicle.brandModel ?? '',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold),),

                                                      SizedBox(
                                                        width: 21,
                                                      ),


                                                      Container(
                                                        child: Icon(
                                                          Icons.done,
                                                          color: Colors
                                                              .white,
                                                          size: 15,),
                                                        decoration: BoxDecoration(
                                                          color: Colors
                                                              .green,
                                                          borderRadius: BorderRadius
                                                              .all(Radius
                                                              .circular(
                                                              30)),
                                                        ),
                                                      )


                                                    ],
                                                  )

                                              ),

                                              Text('Pick - $result',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .w300),
                                              ),

                                              //  Text(bookingListController.bookingListModel?.data[index].pickupDate ?? 'no name'),
                                              // getAllCarsController.getAllBikes?.data[index].brandModel ?? 'no name'


                                            ],
                                          ),

                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Category - ${bookingListController
                                                    .bookingListModel
                                                    ?.data[index].vehicle
                                                    .rideCategory.name}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .w300),
                                              )
                                          ),



                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text('Drop - $result2',
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w300),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 23,
                                          ),



//                                          Text("Booking No. ${bookingListController.bookingListModel?.data[index].id}",style: TextStyle(color: Colors.blue),),

                                          // Align(
                                          //   alignment: Alignment.topRight,
                                          //   child: Container(
                                          //
                                          //     height: 105,
                                          //     width: 100,
                                          //      child:
                                          //     Image.network(bookingListController.bookingListModel?.data[index].vehicle.vehicleCategory.imageUrl ?? ''),
                                          //
                                          //   ),
                                          // ),


                                          Row(
                                            children: [

                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'requested')
                                                Expanded(
                                                  child: Container(

                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                                                    child: ElevatedButton(
                                                      onPressed: (){


                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => _dialogacceptbooking(context),
                                                        );


                                                        // acceptrejectbook(
                                                        //     bookingListController.bookingListModel?.data[index].id,
                                                        //     'accepted'
                                                        // );
                                                        // bookingListController.bookingListModel?.data[index].bookingStatus == 'accepted';

                                                      }, child: Text('ACCEPT'),

                                                    ),
                                                  ),
                                                ) else Text(''),


                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'accepted')
                                                Expanded(
                                                  child: Container(

                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                      }, child: Text('ACCEPTED'),

                                                    ),
                                                  ),
                                                ) else Text(''),



                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'completed')
                                                Expanded(
                                                  child: Container(


                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                      }, child: Text('COMPLETED'),
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.greenAccent, // background
                                                        onPrimary: Colors.white,
                                                        // shape: StadiumBorder()// foreground
                                                      ),
                                                    ),
                                                  ),
                                                ) else Text(''),


                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'started')
                                                Expanded(
                                                  child: Container(

                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                      }, child: Text('STARTED'),

                                                    ),
                                                  ),
                                                ) else Text(''),


                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'cancelled')
                                                Expanded(
                                                  child: Container(

                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                      }, child: Text('CANCELLED'),

                                                    ),
                                                  ),
                                                ) else Text(''),











                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'requested')
                                                Expanded(
                                                  child: Container(
                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.red.shade300, // background
                                                        onPrimary: Colors.white,
                                                        // shape: StadiumBorder()// foreground
                                                      ),
                                                      onPressed: (){
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => _dialogrejectbooking(context),
                                                        );
                                                      }, child: Text('REJECT'),

                                                    ),
                                                  ),
                                                ),
                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'rejected')
                                                Expanded(
                                                  child: Container(
                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.red.shade300, // background
                                                        onPrimary: Colors.white,
                                                        // shape: StadiumBorder()// foreground
                                                      ),
                                                      onPressed: (){



                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => _dialogacceptbooking(context),
                                                        );
                                                      }, child: Text('REJECTED'),

                                                    ),
                                                  ),
                                                ),




                                              // if(bookingListController.bookingListModel?.data[index].bookingStatus == 'accepted')
                                              //   Expanded(
                                              //     child: Container(
                                              //       margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                              //       child: ElevatedButton(
                                              //         onPressed: (){
                                              //
                                              //           showDialog(
                                              //             context: context,
                                              //             builder: (BuildContext context) => _buildPopupDialog3(context),
                                              //           );
                                              //         }, child: Text('Start Now'),
                                              //
                                              //       ),
                                              //     ),
                                              //   ),





                                              if(bookingListController.bookingListModel?.data[index].bookingStatus == 'started')
                                                Expanded(
                                                  child: Container(
                                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                        // showDialog(
                                                        //   context: context,
                                                        //   builder: (BuildContext context) => _buildPopupDialog4(context),
                                                        // );
                                                      }, child: Text('Completed?'),

                                                    ),
                                                  ),
                                                )


                                            ],
                                          ),




                                          SizedBox(height: 21,),

                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent, // background
                                                onPrimary: Colors.white,
                                                // shape: StadiumBorder()// foreground
                                              ),
                                              onPressed: (){

                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingDetails(
                                                    token: token,
                                                    id: bookvehiclesid,
                                                    status:bookingListController.bookingListModel?.data[index].bookingStatus ?? '',
                                                    datepick:result ?? '',
                                                    datedrop:result2 ?? '',
                                                    modelname:bookingListController.bookingListModel?.data[index].vehicle.brandModel ?? '',
                                                    category:bookingListController.bookingListModel?.data[index].vehicle.rideCategory.name ?? '',
                                                    vehicleimage: imagevehicledet ?? '',
                                                    // vehicleimage: bookingListController.bookingListModel?.data[index].vehicle. ?? '',
                                                    vehiclename:bookingListController.bookingListModel?.data[index].vehicle.vehicleCategory.name ?? '',
                                                    vehicleprice:bookingListController.bookingListModel?.data[index].bookingAmount ?? '',
                                                    vehicleluggage:bookingListController.bookingListModel?.data[index].vehicle.noOfLuggageSpace ?? '',
                                                    addresspickup:bookingListController.bookingListModel?.data[index].pickupPoint ?? '',
                                                    addressdropoff:bookingListController.bookingListModel?.data[index].dropOffPoint ?? '',
                                                    fuel:bookingListController.bookingListModel?.data[index].vehicle.fuelType ?? '',
                                                    vehiclenumber: bookingListController.bookingListModel?.data[index].vehicle.vehicleNo ?? '',
                                                    customername: bookingListController.bookingListModel?.data[index].customer.fullName ?? ''

                                                )));


                                                //   var zzz = bookingListController.bookingListModel?.

                                                print("id in list:${bookingListController.bookingListModel?.data[index].id}");
                                                print("image: $imagevehicledet");

                                              },
                                              child: Text("View Booking Details")
                                          ),


                                          // Container(
                                          //   height: 25,
                                          //   width: 55,
                                          //   child:  Image.network(imagevehicledet),
                                          // )

                                        ],
                                      ), //Column
                                    ), //Padding
                                  ), //SizedBox
                                ),
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


//      ),

//        ),
        )

    );
  }






  void logOut(
      String valToken
      ) async {
    try{
      Response response = await post(
          Uri.parse(AppConstants.BASE_URL+'/logout'),

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







  void acceptrejectbook(
      int? bookid,
      String? status,
      String? rejectreason
      ) async {
    try{

      var valToken = await getToken();
      print("booking $valToken");

      Response response = await put(

          Uri.parse(AppConstants.BASE_URL+'/merchant/booking/$bookid/$status'),

          body: json.encode(
              {
                "cancel_reason": rejectreason
              }
              ),
         // body: {
         //   "cancel_reason": rejectreason
         // },

          headers: {
            'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
          }
      );


      if(response.statusCode == 200){
        print(response.body.toString());
        print('');
        // var snackBar = SnackBar(content: Text(response.body.toString()));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);


        String oldString = response.body.toString();
        String newString = oldString.replaceAll('{"success":false,"message":', '');
        String latString = newString.replaceAll(',"data":[]}','');
        var snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 300.0),
            content: Text(latString)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("latstring : $latString");

        setState(() {

        });
        //    String? valTok = prefs.getString('token');
        //    print("valTok: $valTok");
      }
      else {
        print('failed');
        print(response.statusCode);
        var snackBar = SnackBar(content: Text('Booking Failed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      print(e.toString());
      print('catched');
      var snackBar = SnackBar(content: Text("${e.toString()}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }




  Future<String?> getToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
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

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}