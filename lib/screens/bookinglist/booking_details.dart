import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import '../../widgets/drawer.dart';
import '../login_otp.dart';
import 'booking_details.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

//
// import '../widgets/widgets.dart';

class BookingDetails extends StatefulWidget {

  final token;
  final id;
  final status;
  final datepick;
  final datedrop;
  final modelname;
  final category;
  final vehicleimage;
  final vehiclename;
  final vehicleprice;
  final vehicleluggage;
  final addresspickup;
  final addressdropoff;
  final fuel;
  final vehiclenumber;
  final customername;

  //final price;
  const BookingDetails({
    @required this.token,
    @required this.id,
    @required this.status,
    @required this.datepick,
    @required this.datedrop,
    @required this.modelname,
    @required this.category,
    @required this.vehicleimage,
    @required this.vehiclename,
    @required this.vehicleprice,
    @required this.vehicleluggage,
    @required this.addresspickup,
    @required this.addressdropoff,
    @required this.fuel,
    @required this.vehiclenumber,
    @required this.customername,

    Key? key,
  }) : super(key: key);


  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

var totalCost;

class _BookingDetailsState extends State<BookingDetails> {

  String? token;
  late SharedPreferences prefs;
  TextEditingController rejectreasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


//   extension StringCasingExtension on String {
//   String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
//   String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
// }


  @override
  void initState() {
    initSharedPref();
    super.initState();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }



  Widget _dialogrejectbooking(BuildContext context) {

    return Stack(
      children: [

        Positioned(
          right: 0,
          left: 30,
          top: 220,


          child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.close,color: Colors.red,)
                ),
              )
          ),

        ),

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
                              widget.id,
                              'rejected'
                          );

                          print("id : in details ${widget.id}");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingDetails(token: token)));

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



      ],
    );

  }


  Widget _dialogacceptbooking(BuildContext context) {

    return Stack(
      children: [

        Positioned(
          right: 0,
          left: 30,
          top: 220,


          child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.close,color: Colors.red,)
                ),
              )
          ),

        ),

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
                              widget.id,
                              'accepted'
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingDetails(
                              token: token
                          )));


                          print("id : in details ${widget.id}");

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



      ],
    );

  }


  @override
  Widget build(BuildContext context) {

    String? customernocaps = widget.customername;
    String? customercaps = customernocaps?.capitalize!;


      String? fuelnocaps = widget.fuel;
      String? fuelcaps = fuelnocaps?.capitalize!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 235, 240, 1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomBackButton(
                    //   pageHeader: '',
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "${widget.modelname}".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      customercaps ?? '',
                      style: TextStyle(
                        color: Color.fromRGBO(27, 34, 46, 1),
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                     widget.vehicleimage,
                      height:  MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SPECIFICATIONS',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpecificationWidget(
                        text: '₹ ${widget.vehicleprice}',
                        helpText: 'Car rent',
                      ),
                      SpecificationWidget(
                        text: '₹ ${widget.vehicleprice}',
                        helpText: 'Your ride cost',
                      ),
                      SpecificationWidget(
                        text: '₹ ${widget.vehicleprice+widget.vehicleprice}',
                        helpText: 'Total cost',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpecificationWidget(
                        text: fuelcaps!,
                        helpText: "Fuel Type",
                      ),
                      SpecificationWidget(
                        text: widget.datepick,
                        helpText: 'Pickup date',
                      ),
                      SpecificationWidget(
                        text: widget.datedrop,
                        helpText: 'DropOff date',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height:30,
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Info',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpecificationWidget(
                        text: 'Pick Up Address',
                        helpText: widget.addresspickup,
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      SpecificationWidget(
                        text: 'Drop Out Address',
                        helpText: widget.addressdropoff,
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SpecificationWidget(
                  //       text: 'Drop Out Address',
                  //       helpText: 'Near Building 123,Green Park,Raipur',
                  //     ),
                  //
                  //   ],
                  // ),
                ],
              ),
            ),






            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [

                      if(widget.status == 'requested')
                        Expanded(
                          child: Container(

                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                            child: ElevatedButton(
                              onPressed: (){

                                acceptrejectbook(
                                    widget.id,
                                    'accepted'
                                );
                                // bookingListController.bookingListModel?.data[index].bookingStatus == 'accepted';

                              }, child: Text('ACCEPT'),

                            ),
                          ),
                        ) else Text(''),


                      if(widget.status == 'accepted')
                        Expanded(
                          child: Container(

                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                            child: ElevatedButton(
                              onPressed: (){

                              }, child: Text('ACCEPTED'),

                            ),
                          ),
                        ) else Text(''),



                      if(widget.status == 'completed')
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


                      if(widget.status == 'started')
                        Expanded(
                          child: Container(

                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                            child: ElevatedButton(
                              onPressed: (){

                              }, child: Text('STARTED'),

                            ),
                          ),
                        ) else Text(''),


                      if(widget.status == 'cancelled')
                        Expanded(
                          child: Container(

                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),

                            child: ElevatedButton(
                              onPressed: (){

                              }, child: Text('CANCELLED'),

                            ),
                          ),
                        ) else Text(''),

                      if(widget.status == 'requested')
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
                      if(widget.status == 'rejected')
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

                      if(widget.status == 'started')
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
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }


  Future<String?> getToken() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
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


        String oldString = response.body.toString();
        String newString = oldString.replaceAll('{"success":false,"message":', '');
        String latString = newString.replaceAll(',"data":[]}','');
        // var snackBar = SnackBar(
        //     behavior: SnackBarBehavior.floating,
        //     margin: EdgeInsets.only(bottom: 300.0),
        //     content: Text(latString)
        // );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("latstring : $latString");


           String? valTok = prefs.getString('token');
           print("valTok: $valTok");
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


}

class SpecificationWidget extends StatelessWidget {
  final String helpText;
  final String text;

  SpecificationWidget(
      {
        required this.text, required this.helpText
      }
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              helpText,
              style: TextStyle(fontSize: 8.5, color: Colors.black54),
              // maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }




}

class Data extends StatelessWidget {
  final String carTitle;
  final String carInfo;

  Data({required this.carTitle,required this.carInfo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_forward_ios_rounded),
      title: Row(
        children: [
          Text(
            carTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            carInfo,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}