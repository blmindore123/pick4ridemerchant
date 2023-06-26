import 'package:flutter/material.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/bookinglist/bookinglistscreen.dart';
import '../screens/login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';

class MyDrawer extends StatefulWidget {



  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}




class _MyDrawerState extends State<MyDrawer> {

  late SharedPreferences prefs;
   String? token;
   @override
   void initState() {
     super.initState();
     initSharedPref();
   }
   void initSharedPref() async{

     prefs = await SharedPreferences.getInstance();
     await prefs.reload();

   }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
          children: <Widget>[
          ListTile(
                      title:  Text(""),
                      trailing:  Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                    ),
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
                          String? valTok = prefs.getString('token');
                          print('drive cart token : $valTok');



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
                          'Booking List',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        leading: Icon(
                          Icons.book,
                          size: 20.0,
                          color: Colors.purple,
                        ),
                        onTap: () {
                           Navigator.pop(context);
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => BookingListScreen(
                                    token: token)));
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

                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _dialogContent(context),
                          );


                        },
                      ),
          ]),



    );
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


  Widget _dialogContent(BuildContext context) {

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
          top: 230,
          // child: Padding(
          // padding: EdgeInsets.all(42),
          child: Card(
            elevation: 8,
            //    color: Colors.blue.shade500,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width, height: 200,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [




                  Text('Are you sure you want to logout?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          String? valTok = prefs.getString('token');
                          print("signout: $valTok");
                          logOut(valTok!);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
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
                            child: Text('YES',style: TextStyle(fontWeight: FontWeight.bold),)

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
                            child: Text('NO',style: TextStyle(fontWeight: FontWeight.bold),)

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


}
