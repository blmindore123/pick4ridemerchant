import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pick4ridemerchant/screens/enter_details.dart';
import 'package:pick4ridemerchant/screens/home.dart';
import 'package:pick4ridemerchant/screens/login_otp.dart';
import 'package:pick4ridemerchant/screens/car/register_new_car.dart';
import 'package:pick4ridemerchant/screens/register_new_vehicle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
//
//FilterStore filterStore = FilterStore();
//
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(
      GetMaterialApp(
          home: MyApp())
  )
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {

  late SharedPreferences prefs;
  bool? _isFirstRun;
  String? xval;


  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{

     prefs = await SharedPreferences.getInstance();
     String? valTok = prefs.getString('token');



     bool ifr = await IsFirstRun.isFirstRun();
     _isFirstRun = ifr;
     _reset() async {
       await IsFirstRun.reset();
      // _checkFirstRun();
     }
     print("state: $valTok");
     print("run: $_isFirstRun");
     if(ifr == false || valTok == null){
        // await
         Timer(
             Duration(seconds: 5),() async{
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
         }
         );
     }

     else{
      // await
       Timer(
                 Duration(seconds: 5),() async{
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                 }
             );
     }



  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('images/app_images/splashmerchant.png',fit: BoxFit.cover,),
    );
  }
}
