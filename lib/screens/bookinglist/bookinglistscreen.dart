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
import '../../controller/bookingrequestscontroller.dart';
import '../../widgets/drawer.dart';
import '../login_otp.dart';




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
      //getAllCarsController.postDateTimeForSelfDriveCar('','','','');
     // bookingListController.fetchCarsBookingList(gearmodel ?? '');
      bookingListController.fetchCarsBookingList(gearmodel ?? '',
      //    bookingcount ?? ''
      );
      setState(() {
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
          title: Text("Booking Details",style: TextStyle(color: Colors.black),),

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
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      showSelectedItems: true,
                                      disabledItemFn: (String s) => s.startsWith('I'),
                                    ),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "Menu mode",
                                        hintText: "country in menu mode",
                                      ),
                                    ),
                                    // //mode of dropdown
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
                                        gearmodel = "all";
                                        prefs.setString('bookingname', gearmodel!);
                                        print("type of saved pref book $gearmodel");
                                      }
                                      if(vgear == "Past"){
                                        gearmodel = "past";
                                        prefs.setString('bookingname', gearmodel!);
                                        print("type of saved pref book $gearmodel");
                                      }
                                      if(vgear == "Current"){
                                        gearmodel = "current";
                                        prefs.setString('bookingname', gearmodel!);
                                        print("type of saved pref book $gearmodel");
                                      }
                                      if(vgear == "Future"){
                                        gearmodel = "future";
                                        prefs.setString('bookingname', gearmodel!);
                                        print("type of saved pref book $gearmodel");
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




                    //       if(getAllCarsController.getAllCars?.data?.length != null)
                    Container(

//                      height: MediaQuery.of(context).size.height,


                      child: Obx(
                            () =>  bookingListController.isLoading.value
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            :ListView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: bookingListController.bookingListModel?.data.length ??  0,

                            itemBuilder: (context,index){


                              // bookingcount = bookingListController.bookingListModel?.data.length.toString();
                              // prefs.setString('bookingcount', bookingcount!);



                              _buildPopupDialog2(BuildContext context) {

                                return new AlertDialog(
                                  title: const Text('Please Provide Reason'),
                                  content: new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                    ],
                                  ),
                                  actions: <Widget>[

                                    new   Form(
                                    key: _formKey,
                                      child: SizedBox(
                                      width: MediaQuery.of(context).size.width/1.5,
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

                                    new ElevatedButton(
                                      onPressed: () async{
                                        String? valTok = prefs.getString('token');
                                        print("signout: $valTok");

                                        acceptrejectbook(
                                            bookingListController.bookingListModel?.data[index].id,
                                            'rejected'
                                        );

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingListScreen(token: token)));
                                      },
                                      child: const Text('Submit'),
                                    ),
                                    new ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),

                                  ],
                                );

                              }


                              _buildPopupDialog3(BuildContext context) {

                                return new AlertDialog(
                                  title: const Text('Are you sure?'),
                                  content: new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                    ],
                                  ),
                                  actions: <Widget>[

                                    new ElevatedButton(
                                      onPressed: () async{
                                        String? valTok = prefs.getString('token');
                                        print("signout: $valTok");

                                        acceptrejectbook(
                                            bookingListController.bookingListModel?.data[index].id,
                                            'started'
                                        );

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingListScreen(token: token)));
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


                              _buildPopupDialog4(BuildContext context) {

                                return new AlertDialog(
                                  title: const Text('Completed?'),
                                  content: new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                    ],
                                  ),
                                  actions: <Widget>[

                                    new ElevatedButton(
                                      onPressed: () async{
                                        String? valTok = prefs.getString('token');
                                        print("signout: $valTok");

                                        acceptrejectbook(
                                            bookingListController.bookingListModel?.data[index].id,
                                            'completed'
                                        );

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingListScreen(token: token)));
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
                              //  String status = bookingListController.selfDriveCarModel?.data[index].;


                              //String nestedProperty = bookingListController.selfDriveCarModel?.data['data']['pickup_date'];

                              //   String aa = bookingListController.selfDriveCarModel?.data[index].;


                              // print(aa);


                              //if(gearmodel == 'All' && bookingListController.selfDriveCarModel?.data[index].bookingStatus == 'requested') {
                              return Padding(
                                padding: EdgeInsets.all(5),
                                child: Card(
                                  elevation: 60,
                                  shadowColor: Colors.black,
                                  color: Colors.white,

                                  child: SizedBox(
                                    width: 350,
                                    height: 180,
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

                                               Text('Pick - ${bookingListController.bookingListModel?.data[index].pickupDate}',
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
                                            child: Text('Drop - ${bookingListController.bookingListModel?.data[index].dropOffDate}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w300),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 23,
                                          ),



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

                                                      acceptrejectbook(
                                                          bookingListController.bookingListModel?.data[index].id,
                                                          'accepted'
                                                      );
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
                                                    onPressed: (){



                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) => _buildPopupDialog2(context),
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
                                                      onPressed: (){



                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => _buildPopupDialog2(context),
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

                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => _buildPopupDialog4(context),
                                                        );
                                                      }, child: Text('Completed?'),

                                                    ),
                                                  ),
                                                )
                                              

                                            ],
                                          ),
                                          
                                          
                                        ],
                                      ), //Column
                                    ), //Padding
                                  ), //SizedBox
                                ),
                              );
                              // }
                              // else{
                              //
                              // }


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
      ) async {
    try{

      var valToken = await getToken();
      print("booking $valToken");

      Response response = await put(
          Uri.parse(AppConstants.BASE_URL+'/merchant/booking/$bookid/$status'),
          headers: {
            'Content-type':'application/json; charset=UTF-8', 'Authorization':'Bearer $valToken'
          }
      );


      if(response.statusCode == 200){
        print(response.body.toString());
        print('');
        var snackBar = SnackBar(content: Text(response.body.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);


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