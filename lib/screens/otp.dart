import 'package:flutter/material.dart';
import 'package:pick4ridemerchant/dimensions/dimen.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:pick4ridemerchant/screens/enter_details.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:http/http.dart';
import 'package:pick4ridemerchant/screens/enter_details.dart';
import 'package:pick4ridemerchant/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_otp.dart';


class OtpPage extends StatefulWidget {


  static final routeName = "otp-page";

  String country_code;
  String phone_number;
  String role;
  String device_id;



  OtpPage({required this.country_code,required this.phone_number,required this.role,required this.device_id,/*required this.otp*/});




  @override
  _OtpPageState createState() => _OtpPageState();
}



class _OtpPageState extends State<OtpPage> {



  late FocusNode myFocusNode;
  late SharedPreferences prefs;

  var newToken;






  @override
  void initState(){

    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    //init sharedpref
    initSharedPref();

  }

  void initSharedPref() async{

    prefs = await SharedPreferences.getInstance();

  }




  @override
  Widget build(BuildContext context) {
  //  final mQ = MediaQuery.of(context).size;

print(MediaQuery.of(context).size.width);
print(MediaQuery.of(context).size.height);

    return Scaffold(
     // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

     body: SingleChildScrollView(

       physics: AlwaysScrollableScrollPhysics(),

       child: Column(
         children: [

           Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,



             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage("images/app_images/common_top.png"),fit: BoxFit.cover
                 )
             ),

             child: Stack(
               children: [

                 Padding(
                   padding: EdgeInsets.only(
                     left: MediaQuery.of(context).size.width/6.55, //392.72 802.9
                     right: MediaQuery.of(context).size.width/6.55,
                     top: MediaQuery.of(context).size.height/2.82, //
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     //mainAxisAlignment: MainAxisAlignment.center,
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Text("Please Wait", style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/15.72)),
                       // SizedBox(height: mQ.height * 0.01),
                       Text(
                         "We Will Auto Verify The \n          OTP Sent To \n    ${widget.country_code} ${widget.phone_number}",
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/15.72),
                       ),
                     ],
                   ),
                 ),






                 Padding(
                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.85,),
                   child: PinCodeFields(
                     length: 4,
                     fieldBorderStyle: FieldBorderStyle.square,
                     responsive: false,
                     fieldHeight:MediaQuery.of(context).size.height/15.4,
                     fieldWidth: MediaQuery.of(context).size.width/7.4,
                     borderWidth:1.0,
                     activeBorderColor: Colors.pink,
                     activeBackgroundColor: Colors.pink.shade100,
                     // borderRadius: BorderRadius.circular(10.0),
                     keyboardType: TextInputType.number,
                     autoHideKeyboard: false,
                     fieldBackgroundColor: Colors.grey.shade200,
                     borderColor: Colors.blue,
                     textStyle: TextStyle(
                       fontSize: MediaQuery.of(context).size.width/13.1,
                       fontWeight: FontWeight.bold,
                     ),
                     onComplete: (output) {
                       // Your logic with pin code
                       print(output);
                     },
                   ),
                 ),







                 Padding(
                   padding: EdgeInsets.only(
                     top: MediaQuery.of(context).size.height/1.1,
                     left:MediaQuery.of(context).size.width/2.48,
                     right: MediaQuery.of(context).size.width/2.7,
                   ),
                   child: Column(

                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [


                       Text("Resend Code?",style: TextStyle(fontWeight: FontWeight.w200),),

                     ],
                   ),
                 ),



                 // Center(
                 //   child:
                 Padding(
                   padding: EdgeInsets.only(
                     top: MediaQuery.of(context).size.height/1.23
                     ,
                     left: MediaQuery.of(context).size.width/3.4,
                     right: MediaQuery.of(context).size.width/4.6,



                   ),
                   child: SizedBox(
                     // height: 49, //height of button
                       height: MediaQuery.of(context).size.height/13.38,
                       width: MediaQuery.of(context).size.width/1.16, //width of button
                       child:ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: Colors.orange, //background color of button
                             side: BorderSide(width:3, color:Colors.orangeAccent), //border width and color
                             //    elevation: 3, //elevation of button
                             shape: RoundedRectangleBorder( //to set border radius to button
                                 borderRadius: BorderRadius.circular(30)
                             ),
                             //  padding: EdgeInsets.all(20) //content padding inside button
                           ),
                           onPressed: (){
                 //            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterDetailsScreen()));
                             //code to execute when this button is pressed.


                             print(widget.country_code);
                             print(widget.phone_number);
                             print(widget.role);
                             print(widget.device_id);
                             print(otp);


                             verify(
                                 widget.country_code,
                                 widget.phone_number,
                                 widget.role,
                                 widget.device_id,
                                 otp
                             );


                           },
                           child: Text("Verify",style: TextStyle(fontSize: MediaQuery.of(context).size.width/15.86),)
                       )
                   ),
                 )
                 //  )



               ],
             ),
           ),


         ],
       ),

     )

    );
  }



  @override
  void dispose(){
    // SmsAutoFill.unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }



  void verify(
      String countryCode,phoneNumber,role,deviceId,otp
      ) async {
    try{
      Response response = await post(
        Uri.parse('http://pick4ride.com/api/verify-otp'),
        body: {
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "otp": 1111.toString(),
          "role": role,
          "device_id": deviceId,
          "device_type": "android",
          "certification_type": "development"
        },


      );
      if(response.statusCode == 200){
        Map<String,dynamic> veri = json.decode(response.body);
        String nest = veri['data']['profile_status'];

        print(nest);
        print(response.body.toString());
        print('Login successfully');

        // addTokenToSF() async{
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //   prefs.setString('token', token);
        // }

        var newToken = veri['data']['token'];

        prefs.setString('token', newToken);
        print("new token h: $newToken");


        String? valTok = prefs.getString('token');
        print("valTok: $valTok");


        if(veri['data']['profile_status'] == "completed"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(token: newToken)));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterDetailsScreen(token: newToken)));
        }
      }
      else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
      print(e);
      print('catched');
    }
  }












}