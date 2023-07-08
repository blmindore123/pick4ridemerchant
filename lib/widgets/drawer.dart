import 'package:flutter/material.dart';
import 'package:pick4ridemerchant/constants/appconst.dart';
import 'package:pick4ridemerchant/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/get_all_vehicles_controller.dart';
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
  GetAllVehiclesController getAllCarsController =
      Get.put(GetAllVehiclesController());

  late SharedPreferences prefs;

  String _email = '';
  String userFirstName = '';

  String? token;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    if (userFirstName != null) {
      userFirstName = prefs.getString(Constatnts.firstName).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadCounter() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // setState(() {
      _email = (prefs.getString('merchantname') ?? '');
      // });

      // print(_loadCounter());
      print(_email);
    }

    // String? merchant;
    // merchant = prefs.getString('merchantname');

    return Drawer(
      child: ListView(children: <Widget>[
        ListTile(
            title: Container(
          child: Obx(
            () => getAllCarsController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,

                    //     itemCount: _foundUsers.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.center,
                        //child: Text(getAllCarsController.getAllVehicles?.data[index].merchant.fullName.toUpperCase() ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                        child: Text(
                          userFirstName.replaceFirst(userFirstName[0], userFirstName[0].toUpperCase()),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                        ),
                      );
                    }),
          ),
        )

            //               Obx(
            //                   () =>  getAllCarsController.isLoading.value
            //                 ? Center(
            //                 child: Text(""),
            //              )
            // :       Text("${getAllCarsController.getAllVehicles?.data?.length.toString() ?? '0'} Vehicles",style: TextStyle(fontWeight: FontWeight.w300),)),
            //               trailing:  Icon(Icons.arrow_forward_outlined,color: Colors.black,),

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
            Navigator.of(context).push(MaterialPageRoute(
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
              builder: (BuildContext context) => _dialoglogout(context),
            );
          },
        ),
      ]),
    );
  }

  void logOut(String valToken) async {
    try {
      Response response =
          await post(Uri.parse(AppConstants.BASE_URL + '/logout'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $valToken'
      });
      if (response.statusCode == 200) {
        //    Map<String,dynamic> veri = json.decode(response.body);
        print(response.body.toString());
        print(response.toString());
        prefs.remove('token');
        prefs.clear();
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

  Widget _dialoglogout(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 50,
          left: 50,
          top: 230,
          // child: Padding(
          // padding: EdgeInsets.all(42),
          child: Card(
            elevation: 8,
            //    color: Colors.blue.shade500,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(
                      //   width: 15,
                      // ),

                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            String? valTok = prefs.getString('token');
                            print("signout: $valTok");
                            logOut(valTok!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: BorderSide(color: Colors.blue)))),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              'YES',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: BorderSide(
                                          color: Colors.redAccent)))),
                          child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                'NO',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(
                  //   width: 15,
                  // ),
                ],
              ),
            ),
          ),
          // ),
        ),
        Positioned(
          right: 40,
          top: 235,
          child: Align(
            //   alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 55,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<String?> getMerchantName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('merchantname');
  }
}
