import 'dart:async';
import 'dart:convert';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:omkar_development/Drawer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../forgot1.dart';
import '../model/loginModel1.dart';

class Forgot2 extends StatefulWidget {
  // const Login({super.key});
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  State<Forgot2> createState() => _Forgot2State();
}

class _Forgot2State extends State<Forgot2> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false, // this is new

      appBar: AppBar(
        leading: Image.asset(
          "assets/images/omkar-logo 1.png",
        ),
        leadingWidth: ScreenSize.size.width,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),

      body: Stack(
        children: [
          Center(
              child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  height: ScreenSize.size.height * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff45657E),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                  ),
                  // color: Colors.amber,
                  height: ScreenSize.size.height - 119,
                  width: ScreenSize.size.width,
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    SizedBox(
                      height: ScreenSize.size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot password",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          width: ScreenSize.size.width * 0.88,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.amber,
                                    height: ScreenSize.size.height * 0.12,
                                    width: ScreenSize.size.width * 0.88,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // color: Colors.green,
                                                width: ScreenSize.size.width *
                                                    0.18,
                                                child: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: 'Inter',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.04,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // color: Colors.green,
                                            height:
                                                ScreenSize.size.height * 0.12,
                                            width: ScreenSize.size.width * 0.70,
                                            child: SizedBox(
                                              // color: Colors.green,
                                              width:
                                                  ScreenSize.size.width * 0.50,
                                              // height: ScreenSize.size.height * 0.08,
                                              child: TextFormField(
                                                // controller: emailController,
                                                textInputAction:
                                                    TextInputAction.next,

                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return " Please enter a email";
                                                  } else if (!RegExp(
                                                          r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                      .hasMatch(value)) {
                                                    return "Please enter a valid email";
                                                  }
                                                },
                                                // autovalidateMode:
                                                //     AutovalidateMode.onUserInteraction,
                                                // controller: nameController,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.email,
                                                    color: Colors.white,
                                                  ),
                                                  hintText: "Enter Email ",
                                                  // labelText: "First Name",
                                                  hintStyle: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter',
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.white),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  // errorStyle: TextStyle(color: Colors.white),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize.size.height * 0.12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          width: ScreenSize.size.width * 0.73,
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                child: Text(
                                  "   forgot password   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat Alternates',
                                    color: Color(0xff09618E),
                                  ),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Color(0xff09618E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ),
                  ]),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              ],
            ),
          )
              // : const CircularProgressIndicator()
              )
        ],
      ),
    );
  }
}
