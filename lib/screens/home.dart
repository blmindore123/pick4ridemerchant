import 'package:flutter/material.dart';
import 'package:pick4ridemerchant/extensions/string_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/images.dart';
import 'dashboard/fragments/earning.dart';
import 'dashboard/fragments/filter.dart';
import 'dashboard/fragments/homefrg.dart';
import 'dashboard/fragments/notify.dart';
import 'dashboard/fragments/profile.dart';
import 'login_otp.dart';

class HomeScreen extends StatefulWidget {
  final token;

  HomeScreen({@required this.token});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    // currentIndex = 0;
    setState(() {});
  }

  @override
  void setState(fn) {
    // if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,

      body: [
        HomeFragment(),
        EarningFragment(),
        ProfileFragment(),
        NotifyFragment(),
        FilterFragment(),
      ][currentIndex],

      endDrawer: Drawer(),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, blurRadius: 9)
        ]),
        child: BottomNavigationBar(
          //    currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: MediaQuery.of(context).size.width / 11,
                ),
                // a.iconImage(color: Colors.blue),
                label: ''),
            BottomNavigationBarItem(
                icon: b.iconImage(color: Colors.grey), label: ''),
            BottomNavigationBarItem(
                icon: c.iconImage(color: Colors.grey), label: ''),
            BottomNavigationBarItem(
                icon: d.iconImage(color: Colors.grey), label: ''),
            BottomNavigationBarItem(
                icon: e.iconImage(color: Colors.grey), label: ''),
          ],
          onTap: (index) {
            //    currentIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),

      endDrawerEnableOpenDragGesture: false,
    );
  }

  //

  void noToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var x = preferences.getString('token');

    if (x == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
