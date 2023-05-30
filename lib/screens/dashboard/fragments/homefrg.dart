import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart';
import 'package:pick4ridemerchant/screens/register_new_vehicle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home.dart';
import '../../login_otp.dart';
import '../../registered_cars_list.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {

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


                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/133.83),
                  child: CarouselSlider(
                    options: CarouselOptions(height: MediaQuery.of(context).size.height/5.3),
                    items: [1,2].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                           //   margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                              child: Image.asset('images/app_images/ads.png',fit: BoxFit.cover,),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
//                Divider(),
  //              Divider(),

    SizedBox(
      height: 35,
    ),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/17,right: MediaQuery.of(context).size.width/17),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisteredCarsList()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/8.11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(blurRadius: 4,color: Colors.black)
                              ],


                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('images/app_images/i5.png'),
                              maxRadius: MediaQuery.of(context).size.height/12.75,
                              minRadius: MediaQuery.of(context).size.height/13.1,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/32.75,),
                          Text("Vehicle \nManagement.",style: TextStyle(fontSize: MediaQuery.of(context).size.width/17.86,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),


               // Divider(),
              //  Divider(),

                SizedBox(
                  height: 25,
                ),




                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/17,right: MediaQuery.of(context).size.width/17),
                  child: Container(
                    height: MediaQuery.of(context).size.height/8.11,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 4,color: Colors.black)
                            ],


                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/app_images/i6.png'),
                            maxRadius: MediaQuery.of(context).size.height/12.75,
                            minRadius: MediaQuery.of(context).size.height/13.1,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/32.75,),
                        Text("Managing \nTravel Charges.",style: TextStyle(fontSize: MediaQuery.of(context).size.width/17.86,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
               // Divider(),
               // Divider(),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/17,right: MediaQuery.of(context).size.width/17),
                  child: Container(
                    height: MediaQuery.of(context).size.height/8.11,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 4,color: Colors.black)
                            ],


                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/app_images/i7.png'),
                            maxRadius: MediaQuery.of(context).size.height/12.75,
                            minRadius: MediaQuery.of(context).size.height/13.1,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/32.75,),
                        Text("Vehicle available \nor Unavailable",style: TextStyle(fontSize: MediaQuery.of(context).size.width/17.86,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),







                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height/17.23
                    ,
                    left: MediaQuery.of(context).size.width/13.6,
                    right: MediaQuery.of(context).size.width/13.6,



                  ),
                  child: SizedBox(
                    // height: 49, //height of button
                      height: MediaQuery.of(context).size.height/13.38,
                      width: MediaQuery.of(context).size.width/1.16, //width of button
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, //background color of button
                            side: BorderSide(width:3, color:Colors.blue), //border width and color
                            //    elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(30)
                            ),
                            //  padding: EdgeInsets.all(20) //content padding inside button
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterNewVehicle()));
                            //code to execute when this button is pressed.
                          },
                          child: Text("Register New Vehicles",style: TextStyle(fontSize: MediaQuery.of(context).size.width/14.96),)
                      )
                  ),
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







