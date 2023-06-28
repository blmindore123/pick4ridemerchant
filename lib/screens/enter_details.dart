import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pick4ridemerchant/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/appconst.dart';

class EnterDetailsScreen extends StatefulWidget {
  final token;

  final bool? value;
  final String label;
  final bool leadingCheckbox;
  final ValueChanged<bool?>? onChanged;

  const EnterDetailsScreen({
    @required this.token,
    Key? key,
    this.value,
    this.onChanged,
    this.label = '',
    this.leadingCheckbox = true,
  }) : super(key: key);

  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agree = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();

  late SharedPreferences prefs;
  String? token;

  bool onError = false;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        //   physics: AlwaysScrollableScrollPhysics(),

        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/app_images/common_top.png"),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.9),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      height: MediaQuery.of(context).size.height / 19.6,
                      child: Center(
                        child: Text(
                          "Enter Your Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width / 15.11),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.53),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      height: MediaQuery.of(context).size.height / 17.6,
                      child: Center(
                        child: Text(
                          "to register, fill the \n details below",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width / 21.83),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.3),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      //  height: MediaQuery.of(context).size.height,

                      height: 844,
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 22.75),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          181,
                                      left: MediaQuery.of(context).size.width /
                                          43.6,
                                      right: MediaQuery.of(context).size.width /
                                          43.6),
                                  child: Text("Name")),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        131,
                                    left: MediaQuery.of(context).size.width /
                                        43.6,
                                    right: MediaQuery.of(context).size.width /
                                        43.6),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  child: TextFormField(
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    validator: (nameController) {
                                      String value = nameController.toString();
                                      String pattern = r'[a-zA-Z]';
                                      RegExp regExp = new RegExp(pattern);
                                      if (value.length == 0) {
                                        return 'enter correct name';
                                      } else if (!regExp
                                          .hasMatch(value.toString())) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Name",
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              32.7),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),

                                      // errorBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.red
                                      //   )
                                      // ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //
                              //
                              //
                              //
                              Divider(),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          114.7,
                                      left: MediaQuery.of(context).size.width /
                                          43.6,
                                      right: MediaQuery.of(context).size.width /
                                          43.6),
                                  child: Text("Email")),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        161,
                                    left: MediaQuery.of(context).size.width /
                                        43.6,
                                    right: MediaQuery.of(context).size.width /
                                        43.6),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (emailController) {
                                      String value = emailController.toString();
                                      String pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regExp = new RegExp(pattern);
                                      if (value.length == 0) {
                                        return 'enter correct email';
                                      } else if (!regExp
                                          .hasMatch(value.toString())) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Email",
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              32.7),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          borderSide: BorderSide()),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Divider(),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          114.7,
                                      left: MediaQuery.of(context).size.width /
                                          43.6,
                                      right: MediaQuery.of(context).size.width /
                                          43.6),
                                  child: Text("Address")),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        161,
                                    left: MediaQuery.of(context).size.width /
                                        43.6,
                                    right: MediaQuery.of(context).size.width /
                                        43.6),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  child: TextFormField(
                                    controller: addressController,
                                    keyboardType: TextInputType.text,
                                    validator: (addressController) {
                                      String value =
                                          addressController.toString();
                                      if (value.length == 0) {
                                        return 'Please enter your address';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Address",
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              32.7),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          borderSide: BorderSide()),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Divider(),

                              Row(
                                children: [
                                  Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.black;
                                      }
                                      return Colors.black;
                                    }),
                                    value: agree,
                                    onChanged: (check) {
                                      setState(() {
                                        agree = check!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "I accept Terms & Conditions.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        4.22,
                                    right: MediaQuery.of(context).size.width /
                                        4.22,
                                    top: MediaQuery.of(context).size.height /
                                        24.44),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      18.38,
                                  width:
                                      MediaQuery.of(context).size.width / 2.16,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.orange),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(31),
                                                side: BorderSide(
                                                    color: Colors.red)))),
                                    onPressed: agree
                                        ? () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              //new
                                              _formKey.currentState?.save();
                                              //
                                              String? valTok =
                                                  prefs.getString('token');
                                              print("enterdetails: $valTok");
                                              print(nameController.text
                                                  .toString());
                                              print(emailController.text
                                                  .toString());
                                              jumptodashviaregister(
                                                  nameController.text,
                                                  emailController.text,
                                                  addressController.text,
                                                  valTok);
                                            }
                                          }
                                        : null,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15.11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //
    );
  }

  void jumptodashviaregister(String name, email, address, valTok) async {
    try {
      Response response = await post(
          Uri.parse(AppConstants.BASE_URL + 'merchant/signup'),
          body: json.encode({"name": name, "email": email, "address": address}),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $valTok'
          });
      if (response.statusCode == 200) {
        Map<String, dynamic> veri = json.decode(response.body);
        print(response.body.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print('failed');
        print(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
