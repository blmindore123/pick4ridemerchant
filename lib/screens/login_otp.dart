import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'otp.dart';



FlutterOtp otp = FlutterOtp();

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

 // static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  String country_code= "+94";

  String phone_number= "";

  String role= "merchant";

//
  int minNumber = 1000;

  int maxNumber = 6000;

  void login(String country_code,phone_number,role) async {
    try{
      Response response = await post(
          Uri.parse('http://pick4ride.com/api/send-otp'),
          body: {
            "country_code": "+94",
            "phone_number": phone_number,
            "role": "merchant"
          }


      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(response);
        print(response.body.toString());
        print(data['token']);

        print('Login successfully');
      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),

          child: Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/app_images/common_top.png"),
                        fit: BoxFit.cover
                    )
                ),
                child: Stack(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3,),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(6))),
                        height: MediaQuery.of(context).size.height/14.6,

                        child: Center(

                          child: Text("Enter Your Mobile Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/14,),),
                        ),
                      ),
                    ),





                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.54,),
                      child: Container(
                        height: MediaQuery.of(context).size.height/13.6,
                        child: Center(
                          child: Text("to login or register, will send you a \n          confirmation code",style: TextStyle(fontWeight: FontWeight.normal,fontSize: MediaQuery.of(context).size.width/22.2,),),
                        ),
                      ),
                    ),






                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height/1.88,
                        left: MediaQuery.of(context).size.width/16.7,
                        right: MediaQuery.of(context).size.width/16.7,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(21))),
                        height: MediaQuery.of(context).size.height/8.4,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mobile No.",style: TextStyle(fontWeight: FontWeight.bold),),

                              //  Divider(),

                              SizedBox(
                                height: 9,
                              ),

                              TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(10),
                                ],
                                controller: numberController,
                                keyboardType: TextInputType.phone,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return 'Please enter some text';
                                //   }
                                //   return null;
                                // },
                                validator: (numberController) {
                                  String value = numberController.toString();
                                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.length == 0 && value != 10) {
                                    return 'enter 10 digits number';
                                  }
                                  else if (!regExp.hasMatch(value.toString())) {
                                    return '';
                                  }
                                },

                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Enter Here",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),






                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height/1.22,
                          left: MediaQuery.of(context).size.width/3.5,
                          right: MediaQuery.of(context).size.width/3.5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height/14.38,
                        width: MediaQuery.of(context).size.width/2.33,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange, // background
                              onPrimary: Colors.white,
                              shape: StadiumBorder()// foreground
                          ),
                           onPressed: () {
    //
    //
     if(_formKey.currentState!.validate()) {

        login(country_code,numberController.text.toString(),role);
        otp.sendOtp(numberController.text.toString(), '1111', minNumber, maxNumber, country_code);
       Navigator.pushAndRemoveUntil(
       context,
       MaterialPageRoute(
       builder: (context) =>
       //        OtpPage(country_code: country_code, phone_number: numberController.text.toString(), role: role, device_id: '4', otp: '1111',),
       OtpPage(country_code: country_code, phone_number: numberController.text.toString(), role: role, device_id: '4'),
       ),
       (route) => false
       );

     }

                          },
                          child: Text('Login',style: TextStyle(fontSize:
                          MediaQuery.of(context).size.width/17.86,

                          ),),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}




