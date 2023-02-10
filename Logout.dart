import 'package:flutter/material.dart';
import 'package:omkar_development/Electrict/ElectricPage.dart';

import 'package:omkar_development/RegistrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawer.dart';
import 'HomePage.dart';
import 'LogInPage.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  late int selectedRadio;

  var val;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    // logoutUser();
  }

  void logoutUser(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences perf = await SharedPreferences.getInstance();
    SharedPreferences pree = await SharedPreferences.getInstance();

    final token = prefs.getString("login");
    final username = prefs.getString("user");
    final usertok = prefs.getString("access");
    if (1 == 1) {
      await prefs.remove(token!);
      await prefs.remove(username!);
      await prefs.remove(usertok!);
      // print("data12${setSelectedRadio}");
      prefs.remove("refresh");
      prefs.remove("login");
      await prefs.remove('login');
      await prefs.remove("access");
      await perf.remove("login");
      await perf.remove("access");
      await pree.remove("login12");
      print("logout....Time Token.....${token}");
      print("logout${username}");
      prefs.clear();
      pree.clear;
      perf.clear;
      print("logout....Time Token.....${token}");
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
    }
    if (selectedRadio == 2) {
      Navigator.pop(context);
    }
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   var ScreenSize = MediaQuery.of(context);
  //   return AlertDialog(
  //     // insetPadding: EdgeInsets.fromLTRB(13, 190, 10, 210),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(9),
  //     ),
  //     elevation: 5,
  //     title: Container(
  //       width: ScreenSize.size.width * 0.14,
  //       height: ScreenSize.size.height * 0.25,
  //       // color: Colors.green,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 // SizedBox(
  //                 //   height: ScreenSize.size.height * 0.02,
  //                 // ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(
  //                       Icons.logout_sharp,
  //                       color: Color.fromARGB(255, 31, 145, 202),
  //                       size: 30,
  //                     ),
  //                     SizedBox(
  //                       width: ScreenSize.size.width * 0.03,
  //                     ),
  //                     Text(
  //                       'Logout',
  //                       style: TextStyle(
  //                         fontSize: 22.0,
  //                         fontWeight: FontWeight.w700,
  //                         color: Color.fromARGB(255, 31, 152, 212),
  //                         fontFamily: 'Inter',
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 // SizedBox(
  //                 //   height: ScreenSize.size.height * 0.01,
  //                 // ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         SizedBox(
  //                           // width: ScreenSize.size.width * 0.81,
  //                           height: ScreenSize.size.height * 0.10,
  //                           // color: Colors.amber,
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Container(
  //                                 // color: Colors.amber,
  //                                 width: ScreenSize.size.width * 0.51,
  //                                 height: ScreenSize.size.height * 0.06,
  //                                 child: Row(
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children: [
  //                                     Text(
  //                                       "Are you sure    \nyou want to logout?",
  //                                       style: TextStyle(
  //                                         // fontSize: 22.0,
  //                                         fontWeight: FontWeight.w700,
  //                                         color:
  //                                             Color.fromARGB(255, 88, 176, 223),
  //                                         fontFamily: 'Inter',
  //                                       ),
  //                                       textAlign: TextAlign.center,
  //                                     )
  //                                     // Row(
  //                                     //   children: [
  //                                     //     Radio(
  //                                     //       activeColor: Color(0xff09618E),
  //                                     //       value: 1,
  //                                     //       groupValue: selectedRadio,
  //                                     //       onChanged: (val) {
  //                                     //         print("one $val");
  //                                     //         setSelectedRadio(val);
  //                                     //       },
  //                                     //     ),
  //                                     //     Text(
  //                                     //       'Yes',
  //                                     //       style: TextStyle(
  //                                     //         fontSize: 22.0,
  //                                     //         fontWeight: FontWeight.w700,
  //                                     //         color: Color(0xff09618E),
  //                                     //         fontFamily: 'Inter',
  //                                     //       ),
  //                                     //     ),
  //                                     //   ],
  //                                     // ),
  //                                     // Row(
  //                                     //   children: [
  //                                     //     // Radio(
  //                                     //     //   activeColor: Color(0xff09618E),
  //                                     //     //   value: 2,
  //                                     //     //   groupValue: selectedRadio,
  //                                     //     //   onChanged: (val) {
  //                                     //     //     print(" two$val");
  //                                     //     //     setSelectedRadio(val);
  //                                     //     //   },
  //                                     //     // ),
  //                                     //     Text(
  //                                     //       'No',
  //                                     //       style: TextStyle(
  //                                     //         fontSize: 22.0,
  //                                     //         fontWeight: FontWeight.w700,
  //                                     //         color: Color(0xff09618E),
  //                                     //         fontFamily: 'Inter',
  //                                     //       ),
  //                                     //     ),
  //                                     //   ],
  //                                     // ),
  //                                   ],
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),

  //             // Text(
  //           ]),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 // color: Colors.amber,
  //                 height: ScreenSize.size.height * 0.053,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                         height: ScreenSize.size.height * 0.053,
  //                         width: ScreenSize.size.width * 0.22,
  //                         child: OutlinedButton(
  //                             style: OutlinedButton.styleFrom(
  //                               side:
  //                                   BorderSide(width: 1.0, color: Colors.blue),
  //                             ),
  //                             onPressed: () {
  //                               logoutUser(val);
  //                             },
  //                             child: Text(
  //                               "Yes",
  //                               style: TextStyle(
  //                                   color: Color.fromARGB(255, 68, 159, 219)),
  //                             ))

  //                         )
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: ScreenSize.size.width * 0.06,
  //               ),
  //               Container(
  //                 // color: Colors.amber,
  //                 height: ScreenSize.size.height * 0.053,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                       height: ScreenSize.size.height * 0.053,
  //                       width: ScreenSize.size.width * 0.22,
  //                       child: OutlinedButton(
  //                           style: OutlinedButton.styleFrom(
  //                             side: BorderSide(width: 1.0, color: Colors.blue),
  //                           ),
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                             // logoutUser(val);
  //                           },
  //                           child: Text(
  //                             "No",
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 68, 159, 219)),
  //                           )),
  //                       // child: ElevatedButton(
  //                       //   style: ElevatedButton.styleFrom(
  //                       //       primary: Color(0xff0060AF),
  //                       //       // side:
  //                       //       //     BorderSide(color: Colors.white, width: 1),
  //                       //       shape: RoundedRectangleBorder(
  //                       //           borderRadius: BorderRadius.circular(4.0))),
  //                       //   child: Text(
  //                       //     "No",
  //                       //     style: TextStyle(
  //                       //       fontSize: 12.0,
  //                       //       fontWeight: FontWeight.w300,
  //                       //       color: Color(0xffFFFFFF),
  //                       //       fontFamily: 'Inter',
  //                       //     ),
  //                       //   ),
  //                       //   onPressed: () async {
  //                       //     // SharedPreferences perf =
  //                       //     //     await SharedPreferences.getInstance();
  //                       //     // await perf.clear();
  //                       //     // logoutUser(val);
  //                       //     // Navigator.pop(context);
  //                       //     // Navigator.of(context).pushAndRemoveUntil(
  //                       //     //     MaterialPageRoute(
  //                       //     //         builder: (context) => Login()),
  //                       //     //     (route) => false);
  //                       //     // Navigator.pushNamedAndRemoveUntil(
  //                       //     //     context, '/Drawer', (route) => true);
  //                       //     // Navigator.pushReplacement(
  //                       //     //   context,
  //                       //     //   MaterialPageRoute(
  //                       //     //     builder: (context) => Drawer1(),
  //                       //     //   ),
  //                       //     // );
  //                       //     // Navigator.push(
  //                       //     //   context,
  //                       //     //   MaterialPageRoute(
  //                       //     //     builder: (context) => Drawer1(),
  //                       //     //   ),
  //                       //     // );
  //                       //   },
  //                       // )
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //           // SizedBox(
  //           //   height: ScreenSize.size.height * 0.01,
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return AlertDialog(
      // contentPadding: EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Are you sure    \nyou want to logout?",
            style: TextStyle(
              // fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 88, 176, 223),
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
          // Text(
          //   'Profile Update',
          //   style: TextStyle(
          //     fontSize: 22.0,
          //     fontWeight: FontWeight.w700,
          //     color: Color(0xff09618E),
          //     fontFamily: 'Inter',
          //   ),
          // ),
        ],
      ),
      // content: SingleChildScrollView(
      //   child: ListBody(
      //     children: <Widget>[
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           // Container(
      //           //             height: ScreenSize.size.height * 0.053,
      //           //             width: ScreenSize.size.width * 0.22,
      //           //             child: OutlinedButton(
      //           //                 style: OutlinedButton.styleFrom(
      //           //                   side:
      //           //                       BorderSide(width: 1.0, color: Colors.blue),
      //           //                 ),
      //           //                 onPressed: () {
      //           //                   logoutUser(val);
      //           //                 },
      //           //                 child: Text(
      //           //                   "Yes",
      //           //                   style: TextStyle(
      //           //                       color: Color.fromARGB(255, 68, 159, 219)),
      //           //                 )),
      //           //             child: ElevatedButton(
      //           //               style: ElevatedButton.styleFrom(
      //           //                   primary: Color(0xff0060AF),
      //           //                   // side:
      //           //                   //     BorderSide(color: Colors.white, width: 1),
      //           //                   shape: RoundedRectangleBorder(
      //           //                       borderRadius: BorderRadius.circular(4.0))),
      //           //               child: Text(
      //           //                 "Yes",
      //           //                 style: TextStyle(
      //           //                   fontSize: 12.0,
      //           //                   fontWeight: FontWeight.w300,
      //           //                   color: Color(0xffFFFFFF),
      //           //                   fontFamily: 'Inter',
      //           //                 ),
      //           //               ),
      //           //               onPressed: () async {
      //           //                 // SharedPreferences perf =
      //           //                 //     await SharedPreferences.getInstance();
      //           //                 // await perf.clear();
      //           //                 logoutUser(val);
      //           //                 // Navigator.pop(context);
      //           //                 // Navigator.of(context).pushAndRemoveUntil(
      //           //                 //     MaterialPageRoute(
      //           //                 //         builder: (context) => Login()),
      //           //                 //     (route) => false);
      //           //                 // Navigator.pushNamedAndRemoveUntil(
      //           //                 //     context, '/Drawer', (route) => true);
      //           //                 // Navigator.pushReplacement(
      //           //                 //   context,
      //           //                 //   MaterialPageRoute(
      //           //                 //     builder: (context) => Drawer1(),
      //           //                 //   ),
      //           //                 // );
      //           //                 // Navigator.push(
      //           //                 //   context,
      //           //                 //   MaterialPageRoute(
      //           //                 //     builder: (context) => Drawer1(),
      //           //                 //   ),
      //           //                 // );
      //           //               },
      //           //             )
      //           //             ),
      //           //          Container(
      //           //   height: ScreenSize.size.height * 0.053,
      //           //   width: ScreenSize.size.width * 0.22,
      //           //   child: OutlinedButton(
      //           //       style: OutlinedButton.styleFrom(
      //           //         side: BorderSide(width: 1.0, color: Colors.blue),
      //           //       ),
      //           //       onPressed: () {
      //           //         Navigator.pop(context);
      //           //         // logoutUser(val);
      //           //       },
      //           //       child: Text(
      //           //         "No",
      //           //         style: TextStyle(
      //           //             color: Color.fromARGB(255, 68, 159, 219)),
      //           //       )),
      //           //   child: ElevatedButton(
      //           //     style: ElevatedButton.styleFrom(
      //           //         primary: Color(0xff0060AF),
      //           //         // side:
      //           //         //     BorderSide(color: Colors.white, width: 1),
      //           //         shape: RoundedRectangleBorder(
      //           //             borderRadius: BorderRadius.circular(4.0))),
      //           //     child: Text(
      //           //       "No",
      //           //       style: TextStyle(
      //           //         fontSize: 12.0,
      //           //         fontWeight: FontWeight.w300,
      //           //         color: Color(0xffFFFFFF),
      //           //         fontFamily: 'Inter',
      //           //       ),
      //           //     ),
      //           //     onPressed: () async {
      //           //       // SharedPreferences perf =
      //           //       //     await SharedPreferences.getInstance();
      //           //       // await perf.clear();
      //           //       // logoutUser(val);
      //           //       // Navigator.pop(context);
      //           //       // Navigator.of(context).pushAndRemoveUntil(
      //           //       //     MaterialPageRoute(
      //           //       //         builder: (context) => Login()),
      //           //       //     (route) => false);
      //           //       // Navigator.pushNamedAndRemoveUntil(
      //           //       //     context, '/Drawer', (route) => true);
      //           //       // Navigator.pushReplacement(
      //           //       //   context,
      //           //       //   MaterialPageRoute(
      //           //       //     builder: (context) => Drawer1(),
      //           //       //   ),
      //           //       // );
      //           //       // Navigator.push(
      //           //       //   context,
      //           //       //   MaterialPageRoute(
      //           //       //     builder: (context) => Drawer1(),
      //           //       //   ),
      //           //       // );
      //           //     },
      //           //   )
      //           // )
      //         ],
      //       )
      //       // Text(
      //       //   "fgsdfgsdfg",
      //       //   style: TextStyle(
      //       //     // fontSize: 19.0,
      //       //     fontWeight: FontWeight.w400,
      //       //     color: Colors.black,
      //       //     fontFamily: 'Inter',
      //       //   ),
      //       //   textAlign: TextAlign.center,
      //       // ),
      //       // InkWell(
      //       //   child: SelectableText.rich(TextSpan(
      //       //       // text: "${data2.toString().substring(64)}",
      //       //       style: TextStyle(color: Colors.blue))),
      //       // ),
      //     ],
      //   ),
      // ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                // height: ScreenSize.size.height * 0.053,
                width: 100,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.blue),
                    ),
                    onPressed: () {
                      logoutUser(val);
                    },
                    child: Text(
                      "Yes",
                      style:
                          TextStyle(color: Color.fromARGB(255, 68, 159, 219)),
                    ))),
            Container(
              // height: ScreenSize.size.height * 0.053,
              // width: ScreenSize.size.width * 0.22,
              width: 100,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // logoutUser(val);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(color: Color.fromARGB(255, 68, 159, 219)),
                  )),
            )
            // Container(
            //             height: ScreenSize.size.height * 0.053,
            //             width: ScreenSize.size.width * 0.22,
            //             child: OutlinedButton(
            //                 style: OutlinedButton.styleFrom(
            //                   side:
            //                       BorderSide(width: 1.0, color: Colors.blue),
            //                 ),
            //                 onPressed: () {
            //                   logoutUser(val);
            //                 },
            //                 child: Text(
            //                   "Yes",
            //                   style: TextStyle(
            //                       color: Color.fromARGB(255, 68, 159, 219)),
            //                 )),
            //             child: ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                   primary: Color(0xff0060AF),
            //                   // side:
            //                   //     BorderSide(color: Colors.white, width: 1),
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(4.0))),
            //               child: Text(
            //                 "Yes",
            //                 style: TextStyle(
            //                   fontSize: 12.0,
            //                   fontWeight: FontWeight.w300,
            //                   color: Color(0xffFFFFFF),
            //                   fontFamily: 'Inter',
            //                 ),
            //               ),
            //               onPressed: () async {
            //                 // SharedPreferences perf =
            //                 //     await SharedPreferences.getInstance();
            //                 // await perf.clear();
            //                 logoutUser(val);
            //                 // Navigator.pop(context);
            //                 // Navigator.of(context).pushAndRemoveUntil(
            //                 //     MaterialPageRoute(
            //                 //         builder: (context) => Login()),
            //                 //     (route) => false);
            //                 // Navigator.pushNamedAndRemoveUntil(
            //                 //     context, '/Drawer', (route) => true);
            //                 // Navigator.pushReplacement(
            //                 //   context,
            //                 //   MaterialPageRoute(
            //                 //     builder: (context) => Drawer1(),
            //                 //   ),
            //                 // );
            //                 // Navigator.push(
            //                 //   context,
            //                 //   MaterialPageRoute(
            //                 //     builder: (context) => Drawer1(),
            //                 //   ),
            //                 // );
            //               },
            //             )
            //             ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       primary: Color(0xff0060AF),
            //       // side:
            //       //     BorderSide(color: Colors.white, width: 1),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(4.0))),
            //   child: Text(
            //     "Ok",
            //     style: TextStyle(
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.w300,
            //       color: Color(0xffFFFFFF),
            //       fontFamily: 'Inter',
            //     ),
            //   ),
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //       builder: (context) => Editprofile(),
            //     //       maintainState: false),
            //     // );
            //     // Scaffold.of(context).openDrawer();
            //     // tooltip:
            //     // MaterialLocalizations.of(context).openAppDrawerTooltip;
            //     Navigator.of(context).pushAndRemoveUntil(
            //         MaterialPageRoute(builder: (context) => Drawer1()),
            //         (route) => false);
            //     // Navigator.pushReplacement(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //       builder: (context) => Editprofile(), maintainState: false),
            //     // );
            //   },
            // )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
