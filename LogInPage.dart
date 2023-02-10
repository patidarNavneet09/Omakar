// import 'dart:async';
// import 'dart:convert';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:omkar_development/Drawer.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'forgot1.dart';
// import 'model/loginModel1.dart';

// class Login extends StatefulWidget {
//   // const Login({super.key});
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   bool isAlertSet = false;
//   @override
//   void initState() {
//     selectedRadio = 0;
//     myFocusNode = FocusNode();
//     checkLogin();
//     checkLogin1();
//     getConnectivity();
//     InternetConnectionChecker().onStatusChange.listen((status) {
//       final connected = status == InternetConnectionStatus.connected;
//       // Do something

//       showSimpleNotification(
//         Text(
//           connected
//               ? "Internet connection ready"
//               : "Please check your internet connection",
//           style: TextStyle(color: Color(connected ? 0xffFFFFFF : 0xffFFFFFF)),
//         ),
//         background: Color(connected ? 0xff15998E : 0xffFF5C5C),
//       );
//     });

//     super.initState();
//   }

//   getConnectivity() => subscription = Connectivity()
//           .onConnectivityChanged
//           .listen((ConnectivityResult result) async {
//         isDeviceConnected = await InternetConnectionChecker().hasConnection;
//         if (!isDeviceConnected && isAlertSet == false) {
//           showDialogBox();
//           setState(() => isAlertSet = true);
//         }
//       });
//   @override
//   void dispose() {
//     myFocusNode.dispose();
//     subscription.cancel();
//     super.dispose();
//   }

//   var data1;
//   var data;
//   var email = "";
//   Future<Login2?> login(
//     String emailController,
//     passwordController,
//   ) async {
//     if (isDeviceConnected = await InternetConnectionChecker().hasConnection) {
//       getConnectivity();
//       showDialog(
//           context: context,
//           builder: (context) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           });
//     }
//     try {
//       Response response = await post(
//           Uri.parse("http://mayank1412.pythonanywhere.com/admin-api/login/"),
//           body: {
//             "email": emailController,
//             "password": passwordController,
//             // "group": 1.toString(),
//           });
//       Navigator.of(context).pop();
//       // print(data["status"]);
//       if (response.statusCode == 200) {
//         email = emailController;
//         print("gsdfg");
//         // print(data["status"]);
//         print(response.statusCode);
//         data = jsonDecode(response.body.toString());
//         // print("Login " + data["refresh"]);
//         // print((emailController )+( passwordController));
//         if (data["status"] == 401) {
//           print(data["error"]);
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//               "${data["error"]}",
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.blue[600],
//           ));
//         }
//         pageRoute(data['refresh'], data['username'], data1);
//         // print("Token Login ${data['refresh']}");

//         print("account succeful");
//       } else {
//         print("asdfsad");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

//   void pageRoute(String refresh, String username, data1) async {
//     SharedPreferences perf = await SharedPreferences.getInstance();
//     await perf.setString(
//       "login",
//       refresh,
//     );
//     await perf.setString(
//       "user",
//       username,
//     );
//     await perf.setString(
//       "email",
//       email,
//     );
//     // Navigator.of(context)
//     //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
//   }

//   late int selectedRadio;

//   void checkLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // perf.setBool('isLoggedIn', true);
//     String? val = prefs.getString("login");
//     print("navneet${val}");
//     if (val != null) {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//           '/Drawer',
//           (
//             Route<dynamic> route,
//           ) =>
//               false);
//     }
//   }

//   void checkLogin1() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // perf.setBool('isLoggedIn', true);
//     String? val1 = prefs.getString("user");
//     print("navneet${val1}");
//     if (val1 != null) {}
//   }

//   setSelectedRadio(val) {
//     setState(() {
//       selectedRadio = val;
//     });
//   }

//   late FocusNode myFocusNode;
//   bool _isLoading = false;

//   void show() {
//     setState(() {
//       _isLoading = true;
//     });
//   }

//   void hide() {
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   final formkey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var ScreenSize = MediaQuery.of(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: false, // this is new

//       appBar: AppBar(
//         leading: Image.asset(
//           "assets/images/omkar-logo 1.png",
//         ),
//         leadingWidth: ScreenSize.size.width,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.white,
//         titleSpacing: 0,
//         actions: [Image.asset("assets/images/Ellipse 27.png")],
//       ),

//       body: Stack(
//         children: [
//           Center(
//               child: Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   height: ScreenSize.size.height * 0.05,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xff0765A8),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(25.0),
//                         topRight: Radius.circular(25.0)),
//                   ),
//                   // color: Colors.amber,
//                   height: ScreenSize.size.height - 119,
//                   width: ScreenSize.size.width,
//                   child: ListView(scrollDirection: Axis.vertical, children: [
//                     SizedBox(
//                       height: ScreenSize.size.height * 0.05,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 28.0,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xffFFFFFF),
//                             fontFamily: 'Inter',
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: ScreenSize.size.height * 0.03,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           // color: Colors.amber,
//                           width: ScreenSize.size.width * 0.88,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // SizedBox(
//                               //   // width: ScreenSize.size.width * 0.78,
//                               //   child: Row(
//                               //     mainAxisAlignment: MainAxisAlignment.center,
//                               //     children: [
//                               //       Text(
//                               //         "User Type:",
//                               //         style: TextStyle(
//                               //           fontSize: 17.0,
//                               //           fontWeight: FontWeight.w500,
//                               //           color: Color(0xffFFFFFF),
//                               //           fontFamily: 'Inter',
//                               //         ),
//                               //       ),
//                               //       SizedBox(
//                               //         width: ScreenSize.size.width * 0.045,
//                               //       ),
//                               //       Theme(
//                               //         data: ThemeData(
//                               //           unselectedWidgetColor: Colors.white,
//                               //         ),
//                               //         child: Radio(
//                               //           activeColor: Colors.white,
//                               //           value: 1,
//                               //           groupValue: selectedRadio,
//                               //           onChanged: (val) {
//                               //             print(" $val");
//                               //             setSelectedRadio(val);
//                               //           },
//                               //         ),
//                               //       ),
//                               //       Text(
//                               //         "Tenants",
//                               //         style: TextStyle(
//                               //           fontSize: 14.0,
//                               //           fontWeight: FontWeight.w600,
//                               //           color: Color(0xffFFFFFF),
//                               //           fontFamily: 'Inter',
//                               //         ),
//                               //       ),
//                               //       Theme(
//                               //         data: ThemeData(
//                               //           unselectedWidgetColor: Colors.white,
//                               //         ),
//                               //         child: Radio(
//                               //           activeColor: Colors.white,
//                               //           value: 2,
//                               //           groupValue: selectedRadio,
//                               //           onChanged: (val) {
//                               //             print(" $val");
//                               //             setSelectedRadio(val);
//                               //           },
//                               //         ),
//                               //       ),
//                               //       Text(
//                               //         "Owner",
//                               //         style: TextStyle(
//                               //           fontSize: 14.0,
//                               //           fontWeight: FontWeight.w600,
//                               //           color: Color(0xffFFFFFF),
//                               //           fontFamily: 'Inter',
//                               //         ),
//                               //       ),
//                               //     ],
//                               //   ),
//                               // ),

//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     // color: Colors.amber,
//                                     height: ScreenSize.size.height * 0.12,
//                                     width: ScreenSize.size.width * 0.88,
//                                     child: TextFormField(
//                                       onFieldSubmitted: (value) {
//                                         validate();
//                                       },
//                                       // onTap: () {
//                                       //   emailController.clear();
//                                       // },
//                                       textInputAction: TextInputAction.next,

//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return " Please enter a email";
//                                         } else if (!RegExp(
//                                                 r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
//                                             .hasMatch(value)) {
//                                           return "Please enter a valid email";
//                                         }
//                                       },
//                                       // autovalidateMode:
//                                       //     AutovalidateMode.onUserInteraction,
//                                       controller: emailController,
//                                       // autofocus: true,
//                                       // focusNode: myFocusNode,
//                                       style: TextStyle(color: Colors.white),
//                                       decoration: InputDecoration(
//                                         suffixIcon: Icon(
//                                           Icons.person_outline,
//                                           color: Colors.white,
//                                         ),
//                                         labelText: "Email",
//                                         labelStyle: TextStyle(
//                                           fontSize: 17.0,
//                                           fontWeight: FontWeight.w300,
//                                           color: Colors.white,
//                                           fontFamily: 'Inter',
//                                         ),
//                                         errorStyle:
//                                             TextStyle(color: Colors.white),
//                                         focusedErrorBorder:
//                                             UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white)),
//                                         errorBorder: UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                         ),
//                                         focusedBorder: UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                         ),
//                                         enabledBorder: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.white)),
//                                         // focusedBorder: UnderlineInputBorder(
//                                         //   borderSide:
//                                         //       BorderSide(color: Colors.white),
//                                         // ),
//                                         // border: OutlineInputBorder(
//                                         //   borderSide:
//                                         //       BorderSide(color: Colors.white),
//                                         // ),
//                                         // errorBorder: UnderlineInputBorder(
//                                         //   borderSide:
//                                         //       BorderSide(color: Colors.white),
//                                         // ),

//                                         // // enabledBorder: OutlineInputBorder(
//                                         // //     borderSide: BorderSide(
//                                         // //         color: Colors.white))
//                                         // enabledBorder: UnderlineInputBorder(
//                                         //     borderSide:
//                                         //         BorderSide(color: Colors.white)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: ScreenSize.size.height * 0.001,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     // color: Colors.amber,
//                                     height: ScreenSize.size.height * 0.11,
//                                     width: ScreenSize.size.width * 0.88,
//                                     child: TextFormField(
//                                       onFieldSubmitted: (value) {
//                                         validate();
//                                       },
//                                       textInputAction: TextInputAction.done,
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "Please enter your password";
//                                         } else if (value.length < 8) {
//                                           return 'Please enter password minimum 8 charecter';
//                                         }
//                                         return null;
//                                       },
//                                       // autovalidateMode:
//                                       //     AutovalidateMode.onUserInteraction,
//                                       controller: passwordController,
//                                       obscureText: true,
//                                       // enableInteractiveSelection: true,
//                                       // autofocus: true,
//                                       style: TextStyle(color: Colors.white),
//                                       decoration: InputDecoration(
//                                         counterStyle:
//                                             TextStyle(color: Colors.white),
//                                         suffixIcon: Icon(
//                                           Icons.lock_outline,
//                                           color: Colors.white,
//                                         ),
//                                         // border: InputBorder.none,
//                                         labelText: "Password",
//                                         labelStyle: TextStyle(
//                                           fontSize: 17.0,
//                                           fontWeight: FontWeight.w300,
//                                           color: Colors.white,
//                                           fontFamily: 'Inter',
//                                         ),
//                                         errorStyle:
//                                             TextStyle(color: Colors.white),
//                                         focusedErrorBorder:
//                                             UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white)),
//                                         errorBorder: UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                         ),
//                                         focusedBorder: UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                         ),
//                                         enabledBorder: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.white)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               // SizedBox(
//                               //   height: ScreenSize.size.height * 0.03,
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: ScreenSize.size.height * 0.01,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           // color: Colors.amber,
//                           width: ScreenSize.size.width * 0.88,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               TextButton(
//                                   child: Container(
//                                     child: Text(
//                                       "forgot password?",
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.w300,
//                                         color: Colors.white,
//                                         fontFamily: 'Inter',
//                                       ),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     // _displayTextInputDialog(context);

//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const forgot1(),
//                                           maintainState: true),
//                                     );
//                                   })
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: ScreenSize.size.height * 0.16,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             //  height: ScreenSize.size.height * 0.05,
//                             width: ScreenSize.size.width * 0.65,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   elevation: 8,
//                                   primary: Color(0xffFFFFFF),
//                                   // side:
//                                   //     BorderSide(color: Colors.white, width: 1),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(5.0))),
//                               child: Text(
//                                 "Log in",
//                                 style: TextStyle(
//                                   fontSize: 22.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: Color(0xff09618E),
//                                   fontFamily: 'Inter',
//                                 ),
//                               ),
//                               onPressed: () async {
//                                 // setState(() {
//                                 //    _isloading=false;
//                                 // });
//                                 // String name = emailController.text;
//                                 // String pass = passwordController.text;
//                                 // // String str = selectedRadio.toString();
//                                 // login1? data = await SmbitData(
//                                 //   name,
//                                 //   pass,
//                                 // );
//                                 // setState(() {
//                                 //   _login1 = data;
//                                 // });
//                                 // login21();
//                                 // login(
//                                 //   emailController.text.toString(),
//                                 //   passwordController.text
//                                 //       .toString(),
//                                 // );
//                                 validate();

//                                 // Product1();
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => const Drawer1(),
//                                 //       maintainState: false),
//                                 // );
//                               },
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: ScreenSize.size.height * 0.04,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'Not have an account?',
//                           style: TextStyle(
//                               fontFamily: 'Montserrat Alternates',
//                               fontSize: 15,
//                               color: Color(0xffFFFFFF)),
//                         ),
//                         InkWell(
//                           child: Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Color(0xffFFFFFF),
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Montserrat Alternates',
//                               fontSize: 18,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.pushNamed(context, '/Registration');
//                           },
//                         ),
//                       ],
//                     ),
//                   ]),
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom),
//                 ),
//               ],
//             ),
//           )
//               // : const CircularProgressIndicator()
//               )
//         ],
//       ),
//     );
//   }

//   Future<void> validate() async {
//     if (formkey.currentState!.validate()) {
//       // setLoginStatus();
//       // String name = emailController.text;
//       // String pass = passwordController.text;
//       // // String str = selectedRadio.toString();
//       // login1? data = await SmbitData(
//       //   name,
//       //   pass,
//       // );
//       login(
//         emailController.text.toString(),
//         passwordController.text.toString(),
//       );
//       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //   content: const Text('ok'),
//       //   backgroundColor: Colors.green.shade300,
//       // ));
//     } else {
//       print("error");
//       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //   content: const Text('error'),
//       //   backgroundColor: Colors.green.shade300,
//       // ));
//     }
//   }

//   showDialogBox() => showCupertinoDialog<String>(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: const Text("No Connection"),
//           content: const Text("Please check your internet connectivity"),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () async {
//                   Navigator.pop(context, 'Cancel');
//                   setState(() => isAlertSet = false);
//                   isDeviceConnected =
//                       await InternetConnectionChecker().hasConnection;
//                   if (!isDeviceConnected) {
//                     showDialogBox();
//                     setState(() => isAlertSet = true);
//                   }
//                 },
//                 child: const Text("OK"))
//           ],
//         ),
//       );
// }
