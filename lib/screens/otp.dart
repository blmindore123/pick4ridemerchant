import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:pick4ridemerchant/screens/enter_details.dart';

import 'package:http/http.dart';
import 'package:pick4ridemerchant/screens/home.dart';
import 'package:pick4ridemerchant/screens/resend_otp.dart';
import 'package:pick4ridemerchant/utils/ApiCall.dart';

import '../constants/appconst.dart';
import '../model/UserModel.dart';
import '../utils/constants.dart';

class OtpPage extends StatefulWidget {
  static final routeName = "otp-page";

  String country_code;
  String phone_number;
  String role;
  String device_id;

  OtpPage({
    required this.country_code,
    required this.phone_number,
    required this.role,
    required this.device_id,
    /*required this.otp*/
  });

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late FocusNode myFocusNode;
  late SharedPreferences prefs;

  TextEditingController phoneController = TextEditingController();

  var newToken;

  String? devicetokenfb;
  String? deviceId;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    //init sharedpref
    // initSharedPref();


    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((devicetoken){
      print("device token is $devicetoken");

      devicetokenfb = devicetoken;

    });

  }

  // void initSharedPref() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

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
                      image: AssetImage("images/app_images/common_top.png"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width /
                          5, //392.72 802.9
                      // right: MediaQuery.of(context).size.width / 6.55,
                      top: MediaQuery.of(context).size.height / 2.82, //
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("Please Wait",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 15.72)),
                        // SizedBox(height: mQ.height * 0.01),
                        Text(
                          "We Will Auto Verify The \n          OTP Sent To",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width / 15.72),
                        ),
                        Text(
                          "${widget.country_code} ${widget.phone_number}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width / 20.42),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 1.85,
                    ),
                    child: PinCodeFields(
                      controller: phoneController,
                      length: 4,
                      fieldBorderStyle: FieldBorderStyle.square,
                      responsive: false,
                      fieldHeight: MediaQuery.of(context).size.height / 15.4,
                      fieldWidth: MediaQuery.of(context).size.width / 7.4,
                      borderWidth: 1.0,
                      activeBorderColor: Colors.pink,
                      activeBackgroundColor: Colors.pink.shade100,
                      // borderRadius: BorderRadius.circular(10.0),
                      keyboardType: TextInputType.number,
                      autoHideKeyboard: false,
                      fieldBackgroundColor: Colors.grey.shade200,
                      borderColor: Colors.blue,
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 13.1,
                        fontWeight: FontWeight.bold,
                      ),
                      onComplete: (output) {
                        // Your logic with pin code
                        print(output);
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: MediaQuery.of(context).size.height / 1.1,
                  //     left: MediaQuery.of(context).size.width / 2.48,
                  //     right: MediaQuery.of(context).size.width / 5,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Resend Code?",
                  //         style: TextStyle(fontWeight: FontWeight.normal),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Align(

                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.1),
                          child: GestureDetector(
                              onTap: (){
                                resendCode(widget.phone_number,widget.country_code);
                              },
                              child: Text('Resend Code?',style: TextStyle(fontWeight: FontWeight.normal,),)))
                  ),


                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                       top: MediaQuery.of(context).size.height/1.25,

                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height/15.38,
                        width: MediaQuery.of(context).size.width/2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            //background color of button
                            side:
                                BorderSide(width: 3, color: Colors.orangeAccent),
                            //border width and color
                            //    elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            //  padding: EdgeInsets.all(20) //content padding inside button
                          ),
                          onPressed: () {
                            //            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterDetailsScreen()));
                            //code to execute when this button is pressed.


                            if (phoneController.text.length < 4) {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return AlertDialog(
                              //         title: Text("Enter 4 Digits Code"),
                              //       );
                              //     });
                              var snackBar = SnackBar(content: Text('Enter 4 Digits Code'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else{
                              verifyApi();
                            }


                            print(widget.country_code);
                            print(widget.phone_number);
                            print(widget.role);
                            print(widget.device_id);
                            print("device token $devicetokenfb");

                            // verify(widget.country_code, widget.phone_number,
                            //     widget.role, widget.device_id, 1111
                            //     //  otp
                            //     );

                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 15.86),
                          ),
                        ),
                      ),
                    ),
                  )
                  //  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // SmsAutoFill.unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }

  late UserModel userModel;
  bool clickLoad = false;

  void verifyApi() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      clickLoad = true;
    });
    userModel = await ApiCall.verifyOtpApi(widget.country_code,
        widget.phone_number, widget.role, widget.device_id, 1111,
        devicetokenfb ?? ''
    );

    if (userModel.success == true) {
      // var newToken = veri['data']['token'];
      var newToken = userModel.data!.token;
      prefs.setString('token', newToken!);
      prefs.setString(Constatnts.firstName, userModel.data!.firstName!);
      prefs.setString(Constatnts.lastName, userModel.data!.lastName!);
      print("new token h: $newToken");
      String? valTok = prefs.getString('token');
      print("valTok: $valTok");

      if (userModel.data!.profileStatus == "completed") {
        prefs.setBool("true", true);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomeScreen(token: newToken)));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EnterDetailsScreen(token: newToken)));
      }
    } else {
      Fluttertoast.showToast(
          msg: userModel.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
    }
    setState(() {
      clickLoad = false;
    });
  }

  void resendCode(String phoneNumber,String countryCode) async{

    try{
      Response response = await post(
        Uri.parse(AppConstants.BASE_URL+'/resend-otp'),
        body: {
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "role": "customer"
        },


      );
      if(response.statusCode == 200){

        String? valTok = prefs.getString('token');
        print("valTok: $valTok");


        Navigator.push(context, MaterialPageRoute(builder: (context)=> ResendOtpPage(
          token: valTok,
          country_code: widget.country_code,
          phone_number: widget.phone_number,
          role: widget.role,
          device_id: widget.device_id,
        )));

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
