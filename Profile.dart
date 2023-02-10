import 'dart:io';

import 'package:flutter/material.dart';
import 'package:omkar_development/Editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Demo/editprofile2.dart';
import 'Demo/editprofile21.dart';
import 'Drawer.dart';
import 'Constants/app_constants.dart';
import 'model/profileModel.dart';
import 'model/securityModel.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late Future<Profile> Profile11;
  var user11;
  var email11;
  void checkLogin112() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val2 = perf.getString("user");
    String? val3 = perf.getString("email");
    setState(() {
      user11 = val2;
    });
    setState(() {
      email11 = val3;
    });
    // print("${user1}");
    if (val2 != null) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin112();
    // Profile11 = profile();
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0XFFD9D9D9),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                // color: Color(0xff09618E),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Drawer1(), maintainState: false),
                );
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Drawer1()),
                // );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
            // color: Color(0xff09618E),
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        // centerTitle: true,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    color: Color(0xff09618E),
                    child: IconButton(
                      icon: Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      iconSize: 10,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofile22()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: FutureBuilder<Profile>(
          future: Profile11,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         width: ScreenSize.size.width,
                        //         // color: Colors.amber,
                        //         height: ScreenSize.size.height / 4,
                        //         child: Image.asset(
                        //           "assets/images/lorries-outside-a-large-warehouse 2 (1).png",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: ScreenSize.size.height * 0.520,
                              width: ScreenSize.size.width * 0.86,
                              // color: Color(0xff09618E),
                              child: Card(
                                  shadowColor: Colors.blue[300],
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: ScreenSize.size.height * 0.030,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            child: Icon(
                                              Icons.person,
                                              size: 50,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: ScreenSize.size.height * 0.020,
                                      ),
                                      Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.10,
                                                ),
                                                Container(
                                                  height: 25,
                                                  child: Text(
                                                    "Name   : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 73, 150, 188),
                                                      fontFamily: 'Inter',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    // color: Colors.green,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.48,
                                                    height: 25,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .response
                                                                  .firstName,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        73,
                                                                        150,
                                                                        188),
                                                                fontFamily:
                                                                    'Inter',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                                width: ScreenSize
                                                                        .size
                                                                        .width *
                                                                    0.01),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .response
                                                                  .lastName,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        73,
                                                                        150,
                                                                        188),
                                                                fontFamily:
                                                                    'Inter',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.10,
                                                ),
                                                Container(
                                                  height: 25,
                                                  child: Text(
                                                    "Email    : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 73, 150, 188),
                                                      fontFamily: 'Inter',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    // color: Colors.green,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.48,
                                                    height: 25,
                                                    child: Text(
                                                      "${email11}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromARGB(
                                                            255, 73, 150, 188),
                                                        fontFamily: 'Inter',
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.10,
                                                ),
                                                Container(
                                                  height: 25,
                                                  // color: Colors.black,

                                                  child: Text(
                                                    "Mobile  : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 73, 150, 188),
                                                      fontFamily: 'Inter',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    // color: Colors.green,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.48,
                                                    height: 25,
                                                    child: Text(
                                                      snapshot
                                                          .data!.response.phone,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromARGB(
                                                            255, 73, 150, 188),
                                                        fontFamily: 'Inter',
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.074,
                                                ),
                                                Container(
                                                  height: 25,
                                                  // color: Colors.black,

                                                  child: Text(
                                                    "Address  : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 73, 150, 188),
                                                      fontFamily: 'Inter',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    // color: Colors.green,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.48,
                                                    height: 25,
                                                    child: Text(
                                                      snapshot.data!.response
                                                          .address,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromARGB(
                                                            255, 73, 150, 188),
                                                        fontFamily: 'Inter',
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: ScreenSize.size.height * 0.05,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     MaterialButton(
                                            //         color: Color.fromARGB(
                                            //             255, 70, 133, 164),
                                            //         onPressed: () {
                                            //           Navigator.push(
                                            //             context,
                                            //             MaterialPageRoute(
                                            //                 builder: (context) =>
                                            //                     Updateprofile()),
                                            //           );
                                            //         },
                                            //         child: Text("Edit Profile"))
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ])),
                ],
              );
            }
            return Center(child: const CircularProgressIndicator());
          }),
    );
  }
}
