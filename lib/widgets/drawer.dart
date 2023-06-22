import 'package:flutter/material.dart';
import 'package:pick4ridemerchant/utils/HelperSaveData.dart';
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

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        ListTile(
          title: Text(""),
          trailing: Icon(
            Icons.arrow_forward_outlined,
            color: Colors.black,
          ),
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
            Navigator.pop(context);
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => BookingListScreen(token: token)));
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
              builder: (BuildContext context) => _buildPopupDialog(context),
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
        children: <Widget>[],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            String? valTok = prefs.getString('token');
            print("signout: $valTok");
            logOut(valTok!);
            Navigator.pop(context);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Login()));
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

  void logOut(String valToken) async {
    try {
      Response response =
          await post(Uri.parse('http://pick4ride.com/api/logout'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $valToken'
      });
      if (response.statusCode == 200) {
        //    Map<String,dynamic> veri = json.decode(response.body);
        print(response.body.toString());
        print(response.toString());
        prefs.remove('token');
        HelperSaveData.helperSaveData.logout();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('failed');
        print(response.body.toString());
        print(response.toString());
        print(valToken);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
