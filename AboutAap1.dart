import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Demo/editprofile2.dart';
import 'Drawer.dart';

class About1 extends StatefulWidget {
  const About1({super.key});

  @override
  State<About1> createState() => _About1State();
}

class _About1State extends State<About1> {
  var user12;

  var email12;

  void checkLogin113() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val2 = perf.getString("user");
    String? val3 = perf.getString("email");
    setState(() {
      user12 = val2;
    });
    setState(() {
      email12 = val3;
    });
    // print("${user1}");
    if (val2 != null) {}
  }

  @override
  void initState() {
    super.initState();
    checkLogin113();
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff09618E),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Drawer1(), maintainState: false),
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
          'About App',
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
            color: Color(0xff09618E),
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: ScreenSize.size.width,
                    // color: Colors.amber,
                    height: ScreenSize.size.height / 4,
                    child: Image.asset(
                      "assets/images/lorries-outside-a-large-warehouse 2 (1).png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: ScreenSize.size.height * 0.580,
              width: ScreenSize.size.width,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenSize.size.height * 0.520,
                    width: ScreenSize.size.width * 0.86,
                    // color: Colors.amber,
                    child: Card(
                      shadowColor: Colors.blue[300],
                      elevation: 10,
                      child: Container(
                        height: ScreenSize.size.height,
                        // color: Colors.amber,
                        width: ScreenSize.size.width * 0.95,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: ScreenSize.size.height * 0.06),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   // color: Colors.amber,
                                //   width: ScreenSize.size.width * 0.20,
                                //   child: Column(
                                //     children: [
                                //       CircleAvatar(
                                //         // backgroundColor: Color.fromARGB(255, 234, 208, 131),
                                //         radius: 40,
                                //         child: Icon(Icons.person, color: Colors.white),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  // color: Colors.amber,
                                  width: ScreenSize.size.width * 0.80,
                                  height: ScreenSize.size.height * 0.31,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        // color: Colors.amber,
                                        width: ScreenSize.size.width * 0.20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              // backgroundColor: Color.fromARGB(255, 234, 208, 131),
                                              radius: 40,
                                              child: Icon(Icons.person,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   width: ScreenSize.size.width * 0.10,
                                          // ),
                                          Container(
                                            // color: Colors.black,
                                            width: ScreenSize.size.width * 0.15,
                                            child: Text(
                                              "Name   : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromARGB(
                                                    255, 73, 150, 188),
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                          ),
                                          Container(
                                              // color: Colors.green,
                                              // width:
                                              //     ScreenSize.size.width * 0.48,
                                              // height: ScreenSize.size.height * 0.03,
                                              child: Text(
                                            "${"user11"}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 73, 150, 188),
                                              fontFamily: 'Inter',
                                            ),
                                            textAlign: TextAlign.justify,
                                          )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   width: ScreenSize.size.width * 0.10,
                                          // ),
                                          Container(
                                            // color: Colors.black,
                                            width: ScreenSize.size.width * 0.15,
                                            child: Text(
                                              "Email    : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromARGB(
                                                    255, 73, 150, 188),
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                          ),
                                          Container(
                                              // color: Colors.green,
                                              // width:
                                              //     ScreenSize.size.width * 0.48,
                                              // height: ScreenSize.size.height * 0.03,
                                              child: Text(
                                            "${"email11"}",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 73, 150, 188),
                                              fontFamily: 'Inter',
                                            ),
                                            textAlign: TextAlign.justify,
                                          )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   width: ScreenSize.size.width * 0.10,
                                          // ),
                                          Container(
                                            // color: Colors.black,
                                            width: ScreenSize.size.width * 0.15,
                                            child: Text(
                                              "Phone  : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromARGB(
                                                    255, 73, 150, 188),
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                          ),
                                          Container(
                                              // color: Colors.green,
                                              // width:
                                              //     ScreenSize.size.width * 0.48,
                                              // height: ScreenSize.size.height * 0.03,
                                              child: Text(
                                            "1234567890",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 73, 150, 188),
                                              fontFamily: 'Inter',
                                            ),
                                            textAlign: TextAlign.justify,
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize.size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                    color: Color.fromARGB(255, 70, 133, 164),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Editprofile21()),
                                      );
                                    },
                                    child: Text("Edit Profile"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
