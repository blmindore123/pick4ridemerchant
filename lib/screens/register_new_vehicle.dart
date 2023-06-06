import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:pick4ridemerchant/screens/bike/register_new_bike.dart';
import 'package:pick4ridemerchant/screens/car/register_new_car.dart';
import 'package:pick4ridemerchant/screens/tuktuk/register_new_tuktuk.dart';
import 'package:pick4ridemerchant/screens/van/register_new_van.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/drive_category_controller.dart';
import 'login_otp.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';

class RegisterNewVehicle extends StatefulWidget {
  @override
  _RegisterNewVehicleState createState() => _RegisterNewVehicleState();
}

class _RegisterNewVehicleState extends State<RegisterNewVehicle> {

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    //  value = widget.value == true;
    initSharedPref();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }



  DriveCategoryController driveCategoryController = Get.put(DriveCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Welcome",style: TextStyle(color: Colors.black),),

        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      endDrawer: Drawer(


        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(children: <Widget>[

                  ListTile(
                    title:  Text(""),
                    trailing:  Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                  ),

                  // ListTile(
                  //   title: Text(
                  //     'Sign up as supplier',
                  //     style: TextStyle(fontSize: 18.0, color: Colors.black),
                  //   ),
                  //   leading: Icon(
                  //     Icons.person,
                  //     size: 20.0,
                  //     color: Colors.purple,
                  //   ),
                  //   onTap: () {
                  //     /* Navigator.pop(context);
                  //   Navigator.of(context).push(new MaterialPageRoute(
                  //       builder: (context) => dealerBuilder()));*/
                  //   },
                  // ),
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
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
                      'Booking Details',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.book,
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

                      // String? valTok = prefs.getString('token');
                      // print("signout: $valTok");
                      // logOut(valTok!);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );


                    },
                  ),

                ]
                ),
              ),

            ],
          ),
        ),







      ),
      backgroundColor: Colors.white,








      body: RefreshIndicator(
        onRefresh: () async {
          setState(()
          {

          }
          );

        },
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),

              child:

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/65.3),
                    child: Container(

                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 1, left: MediaQuery.of(context).size.width/32.75, right: MediaQuery.of(context).size.width/49.125),
                            child: Container(
                              height: MediaQuery.of(context).size.height/20.075,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.shade100
                              ),
                              child: TextField(
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                    hintText: "search",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width/26.2, top: MediaQuery.of(context).size.height/133.83),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.search,color: Colors.black,),
                                      onPressed: (){},
                                      iconSize: MediaQuery.of(context).size.width/19.65,
                                    )
                                ),
                                onChanged: (val) {
                                  setState(() {
                                  }
                                  );
                                },
                                onSubmitted: (term) {

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                  SizedBox(
                    height: 65,
                  ),






                  Container(

                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,


                    child:

                    Obx(
                          () => driveCategoryController.isLoading.value
                          ? Center(
                        child: CircularProgressIndicator(),
                      ):  GridView.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (BuildContext context,index ){

                          return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                    GestureDetector(
                                      onTap: (){

                                        if(driveCategoryController.driveCategory?.data[index].id == 1){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewCar()));
                                        }
                                        if(driveCategoryController.driveCategory?.data[index].id == 2){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewVan()));
                                        }
                                        if(driveCategoryController.driveCategory?.data[index].id == 3){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewBike()));
                                        }
                                        if(driveCategoryController.driveCategory?.data[index].id == 4){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewTukTuk()));
                                        }
                                        else{
                                          print("");
                                        }
                                        //if()


                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                     //   radius: 42,
                                        minRadius: 42,
                                        maxRadius: 72,
                                        backgroundImage: NetworkImage(driveCategoryController.driveCategory?.data![index].imageUrl ?? '',),

                                      ),
                                    ),



                                  SizedBox(width: MediaQuery.of(context).size.width/16.75,),
                                  Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(driveCategoryController.driveCategory?.data![index].name ??  'no name',style: TextStyle(fontSize: MediaQuery.of(context).size.width/17.86,fontWeight: FontWeight.bold),
                                      )
                                  ),

                                ],

                              );
                        },
                        ),

    )
                  ),

                ],
              ),


            ),//scroll



          ],
        ),

      ),
    );
  }



  void logOut(
      String valToken
      ) async {
    try{
      Response response = await post(
          Uri.parse('http://pick4ride.com/api/logout'),
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







