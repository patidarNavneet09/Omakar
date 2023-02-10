// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:omkar_development/Drawer.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Constants/app_constants.dart';
// import 'forgot1.dart';
// import 'model/loginModel1.dart';
// import 'Demo/forgot2.dart';

// class Login1 extends StatefulWidget {
//   // const Login({super.key});
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   State<Login1> createState() => _Login1State();
// }

// class _Login1State extends State<Login1> {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   bool isAlertSet = false;
//   var _isObscured;
//   final passwordFocusNode1 = FocusNode();
//   @override
//   void initState() {
//     _isObscured = true;
//     selectedRadio = 0;
//     myFocusNode = FocusNode();
//     checkLogin();
//     checkLogin1();
//     // checkLogin31();
//     getConnectivity();
//     // InternetConnectionChecker().onStatusChange.listen((status) {
//     //   final connected = status == InternetConnectionStatus.connected;
//     //   // Do something

//     //   showSimpleNotification(
//     //     Text(
//     //       connected
//     //           ? "Internet connection ready"
//     //           : "Please check your internet connection",
//     //       style: TextStyle(color: Color(connected ? 0xffFFFFFF : 0xffFFFFFF)),
//     //     ),
//     //     background: Color(connected ? 0xff15998E : 0xffFF5C5C),
//     //   );
//     // });

//     super.initState();
//   }

//   void getConnectivity() => subscription = Connectivity()
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

//   var TOKEN;
//   var id;
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

//       try {
//         Response response =
//             await post(Uri.parse("${AppConstants.BASE_URL}/user/rental-login/"),
//                 // headers: <String, String>{
//                 //   HttpHeaders.acceptHeader: 'application/json',
//                 //   HttpHeaders.contentTypeHeader: 'charset=UTF-8',
//                 //   'Authorization': "Bearer $TOKEN "
//                 // },
//                 body: {
//               "email": emailController,
//               "password": passwordController,
//               // "group": 1.toString(),
//             });

//         Navigator.of(context).pop();
//         // print(data["status"]);
//         if (response.statusCode == 200) {
//           email = emailController;
//           data = jsonDecode(response.body.toString());
//           print(data);
//           print(data);
//           if (data["status"] == 401 || data["status"] == 400) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 "${data["response"]}",
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.blue[600],
//             ));
//           }
//           if (data["status"] == 200) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 "${data["response"]}",
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.blue[600],
//             ));
//           }
//           // if (data["status"] == 400) {
//           //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           //     content: Text(
//           //       "${data["response"]}",
//           //       style: TextStyle(color: Colors.white),
//           //     ),
//           //     backgroundColor: Colors.blue[600],
//           //   ));
//           // }

//           pageRoute(
//             data['refresh'],
//             data['username'],
//             data1,
//             data['access'],
//           );
//           // pageRoute1(
//           //   data['refresh'],
//           // );
//           print("Token Login ${data['access']}");
//           print("account succeful");
//         } else {
//           var data = jsonDecode(response.body.toString());
//           print(data[response]);
//           if (response.statusCode == 400) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 "${'${data['response']}'} ",
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.blue[600],
//             ));
//           }
//           print("asdfsad");
//         }
//       } catch (e) {
//         print(e.toString());
//       }
//       return null;
//     }
//   }

//   // http://192.168.0.121:8000/admin-api/login/
//   // http://mayank1412.pythonanywhere.com/admin-api/login/
//   void pageRoute(
//     String refresh,
//     String username,
//     data1,
//     String access1,
//   ) async {
//     SharedPreferences perf = await SharedPreferences.getInstance();
//     await perf.setString(
//       "login",
//       refresh,
//     );
//     print(refresh);
//     await perf.setString(
//       "user",
//       username,
//     );
//     await perf.setString(
//       "access",
//       access1,
//     );
//     await perf.setString(
//       "email",
//       email,
//     );

//     // print("oye....lallaaaa${refresh1}");
//     // Navigator.of(context)
//     //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
//   }

//   void pageRoute1(
//     String refresh1,
//   ) async {
//     SharedPreferences pree = await SharedPreferences.getInstance();
//     await pree.setString(
//       "login12",
//       refresh1,
//     );

//     print("oye....lallaaaa${refresh1}");
//     // Navigator.of(context).pushAndRemoveUntil(
//     //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
//     // Navigator.of(context)
//     //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

//     // Navigator.of(context).pushAndRemoveUntil(
//     //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
//   }

//   void checkLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // perf.setBool('isLoggedIn', true);
//     String? val = prefs.getString("login");
//     // print("navneet${val}");
//     if (val != null) {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//           '/Drawer',
//           (
//             Route<dynamic> route,
//           ) =>
//               false);
//     }
//   }

//   // var user1;
//   // void checkLogin31() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   // perf.setBool('isLoggedIn', true);
//   //   String? val3 = prefs.getString("access1");
//   //   print("navneet333${val3}");
//   //   setState(() {
//   //     user1 = val3;
//   //   });
//   //   if (val3 != null) {
//   //     Navigator.of(context).pushNamedAndRemoveUntil(
//   //         '/Drawer',
//   //         (
//   //           Route<dynamic> route,
//   //         ) =>
//   //             false);
//   //   }
//   // }

//   void checkLogin1() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // perf.setBool('isLoggedIn', true);
//     String? val1 = prefs.getString("user");
//     // print("navneet${val1}");
//     if (val1 != null) {}
//   }

//   setSelectedRadio(val) {
//     setState(() {
//       selectedRadio = val;
//     });
//   }

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

//   late int selectedRadio;
//   final formkey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   late FocusNode myFocusNode;
//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     // print("ssssssss${user1}");
//     var ScreenSize = MediaQuery.of(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: false, // this is new
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Image.asset(
//           "assets/images/omkar-logo 1.png",
//         ),
//         leadingWidth: ScreenSize.size.width,
//         backgroundColor: Colors.white,
//         elevation: 2,
//         foregroundColor: Colors.white,
//         titleSpacing: 0,
//         actions: [Image.asset("assets/images/Ellipse 27.png")],
//       ),

//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: ScreenSize.size.height * 0.05,
//             ),
//             Stack(
//               children: [
//                 Card(
//                   shadowColor: Colors.blue[200],
//                   borderOnForeground: true,
//                   // elevation: 15,
//                   margin: EdgeInsets.all(0),
//                   child: Container(
//                     width: ScreenSize.size.width,
//                     height: ScreenSize.size.height * 0.82,
//                     decoration: BoxDecoration(
//                       color: Color(0xff45657E),
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25.0),
//                           topRight: Radius.circular(25.0)),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: ScreenSize.size.width,
//                   decoration: BoxDecoration(
//                     color: Color(0xff45657E),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(25.0),
//                         topRight: Radius.circular(25.0)),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Container(
//                       width: ScreenSize.size.width,
//                       decoration: BoxDecoration(
//                         color: Color(0xff45657E),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25.0),
//                             topRight: Radius.circular(25.0)),
//                       ),
//                       child: Center(
//                         child: Form(
//                           key: formkey,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                 height: ScreenSize.size.height * 0.05,
//                               ),
//                               SizedBox(
//                                 // height: ScreenSize.size.height * 0.07,
//                                 width: ScreenSize.size.width * 0.40,
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text(
//                                       "Login",
//                                       style: TextStyle(
//                                         // fontSize: 22.0,
//                                         // fontSize: ScreenSize.size.width * 0.06,
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.w700,
//                                         color: Color(0xffFFFFFF),
//                                         fontFamily: 'Inter',
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     SizedBox(
//                                         height: ScreenSize.size.height * 0.05),
//                                     // Text(
//                                     //   "Create your account",
//                                     //   style: TextStyle(
//                                     //     fontSize: 12.0,
//                                     //     fontWeight: FontWeight.w700,
//                                     //     color: Color(0xffFFFFFF),
//                                     //     fontFamily: 'Inter',
//                                     //   ),
//                                     //   textAlign: TextAlign.center,
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 // height: 580,
//                                 // height: ScreenSize.size.height * 0.69,
//                                 // decoration: BoxDecoration(
//                                 //   color: Color(0xff45657E),
//                                 //   borderRadius: BorderRadius.only(
//                                 //       topLeft: Radius.circular(25.0),
//                                 //       topRight: Radius.circular(25.0)),
//                                 // ),
//                                 // color: Colors.amber,
//                                 // height: ScreenSize.size.height - 147,
//                                 width: ScreenSize.size.width,
//                                 child: Column(
//                                   children: [
//                                     // SizedBox(
//                                     //   height: ScreenSize.size.height * 0.053,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment: MainAxisAlignment.center,
//                                     //   children: [
//                                     //     Text(
//                                     //       "Login",
//                                     //       style: TextStyle(
//                                     //         // fontSize: ScreenSize.size.width * 0.06,
//                                     //         fontSize: 20.0,
//                                     //         fontWeight: FontWeight.w700,
//                                     //         color: Color(0xffFFFFFF),
//                                     //         fontFamily: 'Inter',
//                                     //       ),
//                                     //       textAlign: TextAlign.center,
//                                     //     ),
//                                     //   ],
//                                     // ),
//                                     // SizedBox(
//                                     //   height: ScreenSize.size.height * 0.04,
//                                     // ),
//                                     Container(
//                                       // height: 580,
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                 // color: Colors.amber,
//                                                 // height: 140,
//                                                 width: ScreenSize.size.width *
//                                                     0.98,
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                           // color: Colors.amber,
//                                                           // height: ScreenSize.size.height * 0.085,
//                                                           width: ScreenSize
//                                                                   .size.width *
//                                                               0.95,
//                                                           child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .spaceBetween,
//                                                               children: [
//                                                                 Column(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: [
//                                                                     Container(
//                                                                       // color: Colors.green,
//                                                                       width: ScreenSize
//                                                                               .size
//                                                                               .width *
//                                                                           0.18,
//                                                                       child:
//                                                                           Text(
//                                                                         "Email",
//                                                                         style:
//                                                                             TextStyle(
//                                                                           fontSize:
//                                                                               14.0,
//                                                                           fontWeight:
//                                                                               FontWeight.w500,
//                                                                           color:
//                                                                               Color(0xffFFFFFF),
//                                                                           fontFamily:
//                                                                               'Inter',
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     SizedBox(
//                                                                       height: ScreenSize
//                                                                               .size
//                                                                               .height *
//                                                                           0.04,
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 Container(
//                                                                   height: 82,
//                                                                   // color: Colors.green,
//                                                                   // height:
//                                                                   //     ScreenSize.size.height * 0.085,
//                                                                   width: ScreenSize
//                                                                           .size
//                                                                           .width *
//                                                                       0.70,
//                                                                   child:
//                                                                       TextFormField(
//                                                                     autofocus:
//                                                                         false,
//                                                                     // enabled:

//                                                                     //     true,
//                                                                     // enableInteractiveSelection:
//                                                                     //     true,
//                                                                     toolbarOptions: ToolbarOptions(
//                                                                         copy:
//                                                                             true,
//                                                                         paste:
//                                                                             true,
//                                                                         cut:
//                                                                             true,
//                                                                         selectAll:
//                                                                             true),
//                                                                     controller:
//                                                                         emailController,
//                                                                     textInputAction:
//                                                                         TextInputAction
//                                                                             .next,
//                                                                     validator:
//                                                                         (value) {
//                                                                       if (RegExp(
//                                                                               r"\s")
//                                                                           .hasMatch(
//                                                                               value!)) {
//                                                                         return "Please remove space";
//                                                                       } else if (value
//                                                                           .isEmpty) {
//                                                                         return 'Please enter your address ';
//                                                                       } else if (!RegExp(
//                                                                           // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
//                                                                           r'\S+@\S+\.\S+').hasMatch(value)) {
//                                                                         return "Please enter a valid email";
//                                                                       }
//                                                                     },
//                                                                     // onSaved: ,
//                                                                     // validator: (value) {
//                                                                     //   if (value!.isEmpty) {
//                                                                     //     return " Please enter a email";
//                                                                     //   } else if (!RegExp(
//                                                                     //           // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
//                                                                     //           r'\S+@\S+\.\S+')
//                                                                     //       .hasMatch(value)) {
//                                                                     //     return "Please enter a valid email";
//                                                                     //   }
//                                                                     // },
//                                                                     // autovalidateMode:
//                                                                     //     AutovalidateMode.onUserInteraction,
//                                                                     // controller: nameController,
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .white),
//                                                                     keyboardType:
//                                                                         TextInputType
//                                                                             .text,
//                                                                     decoration:
//                                                                         InputDecoration(
//                                                                       suffixIcon:
//                                                                           Icon(
//                                                                         Icons
//                                                                             .email,
//                                                                         color: Colors
//                                                                             .white,
//                                                                       ),
//                                                                       hintText:
//                                                                           "Enter email",
//                                                                       // labelText: "First Name",
//                                                                       hintStyle:
//                                                                           TextStyle(
//                                                                         fontSize:
//                                                                             12.0,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                         color: Colors
//                                                                             .white,
//                                                                         fontFamily:
//                                                                             'Inter',
//                                                                       ),
//                                                                       errorStyle:
//                                                                           TextStyle(
//                                                                               color: Colors.red),
//                                                                       border: OutlineInputBorder(
//                                                                           borderRadius: BorderRadius.circular(
//                                                                               3),
//                                                                           borderSide:
//                                                                               BorderSide(color: Colors.white)),
//                                                                       // errorStyle: TextStyle(color: Colors.white),
//                                                                       focusedErrorBorder:
//                                                                           OutlineInputBorder(
//                                                                               borderSide: BorderSide(color: Colors.white)),
//                                                                       errorBorder:
//                                                                           OutlineInputBorder(
//                                                                         borderSide:
//                                                                             BorderSide(color: Colors.white),
//                                                                       ),
//                                                                       focusedBorder:
//                                                                           OutlineInputBorder(
//                                                                         borderSide:
//                                                                             BorderSide(color: Colors.white),
//                                                                       ),
//                                                                       enabledBorder:
//                                                                           OutlineInputBorder(
//                                                                               borderSide: BorderSide(color: Colors.white)),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                               ]),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     // SizedBox(
//                                                     //   height: 28,
//                                                     // ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         Container(
//                                                           // color: Colors.green,
//                                                           // height: ScreenSize.size.height * 0.14,
//                                                           width: ScreenSize
//                                                                   .size.width *
//                                                               0.98,
//                                                           child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .spaceAround,
//                                                               children: [
//                                                                 // SizedBox(
//                                                                 //   width: ScreenSize.size.width * 0.03,
//                                                                 // ),
//                                                                 Column(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: [
//                                                                     Container(
//                                                                       // color: Colors.green,
//                                                                       width: ScreenSize
//                                                                               .size
//                                                                               .width *
//                                                                           0.22,
//                                                                       height:
//                                                                           15,
//                                                                       child:
//                                                                           Text(
//                                                                         "Password",
//                                                                         style:
//                                                                             TextStyle(
//                                                                           fontSize:
//                                                                               14.0,
//                                                                           fontWeight:
//                                                                               FontWeight.w500,
//                                                                           color:
//                                                                               Color(0xffFFFFFF),
//                                                                           fontFamily:
//                                                                               'Inter',
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     SizedBox(
//                                                                       height: ScreenSize
//                                                                               .size
//                                                                               .height *
//                                                                           0.03,
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 Container(
//                                                                   // color: Colors.green,
//                                                                   height: 82,
//                                                                   width: ScreenSize
//                                                                           .size
//                                                                           .width *
//                                                                       0.70,
//                                                                   child: Column(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       TextFormField(
//                                                                         toolbarOptions: ToolbarOptions(
//                                                                             copy:
//                                                                                 true,
//                                                                             paste:
//                                                                                 true,
//                                                                             cut:
//                                                                                 true,
//                                                                             selectAll:
//                                                                                 true),
//                                                                         onFieldSubmitted:
//                                                                             (value) {
//                                                                           validate();
//                                                                         },
//                                                                         controller:
//                                                                             passwordController,
//                                                                         textInputAction:
//                                                                             TextInputAction.done,
//                                                                         obscureText:
//                                                                             _isObscured,
//                                                                         focusNode:
//                                                                             passwordFocusNode1,
//                                                                         validator:
//                                                                             (value) {
//                                                                           if (value!
//                                                                               .isEmpty) {
//                                                                             return "Please enter your password";
//                                                                           } else if (value.length <
//                                                                               8) {
//                                                                             return 'Please enter password minimum 8 charecter';
//                                                                           }
//                                                                           return null;
//                                                                         },
//                                                                         // obscureText: true,
//                                                                         // autovalidateMode:
//                                                                         //     AutovalidateMode.onUserInteraction,
//                                                                         // controller: nameController,
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.white),
//                                                                         keyboardType:
//                                                                             TextInputType.text,
//                                                                         decoration:
//                                                                             InputDecoration(
//                                                                           suffixIcon:
//                                                                               IconButton(
//                                                                             onPressed:
//                                                                                 () {
//                                                                               setState(() {
//                                                                                 _isObscured = !_isObscured;
//                                                                               });
//                                                                             },
//                                                                             icon: _isObscured
//                                                                                 ? const Icon(Icons.visibility)
//                                                                                 : const Icon(Icons.visibility_off),
//                                                                             color:
//                                                                                 Colors.white,
//                                                                           ),
//                                                                           hintText:
//                                                                               "Enter password",
//                                                                           // labelText: "First Name",
//                                                                           hintStyle:
//                                                                               TextStyle(
//                                                                             fontSize:
//                                                                                 12.0,
//                                                                             fontWeight:
//                                                                                 FontWeight.w400,
//                                                                             color:
//                                                                                 Colors.white,
//                                                                             fontFamily:
//                                                                                 'Inter',
//                                                                           ),
//                                                                           errorStyle:
//                                                                               TextStyle(color: Colors.red),
//                                                                           border: OutlineInputBorder(
//                                                                               borderRadius: BorderRadius.circular(3),
//                                                                               borderSide: BorderSide(color: Colors.white)),
//                                                                           // errorStyle: TextStyle(color: Colors.white),
//                                                                           focusedErrorBorder:
//                                                                               OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                                                                           errorBorder:
//                                                                               OutlineInputBorder(
//                                                                             borderSide:
//                                                                                 BorderSide(color: Colors.white),
//                                                                           ),
//                                                                           focusedBorder:
//                                                                               OutlineInputBorder(
//                                                                             borderSide:
//                                                                                 BorderSide(color: Colors.white),
//                                                                           ),
//                                                                           enabledBorder:
//                                                                               OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 )
//                                                               ]),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: ScreenSize.size.height * 0.01,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           // color: Colors.amber,
//                                           width: ScreenSize.size.width * 0.88,
//                                           height: 35,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             // crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               // Padding(padding: EdgeInsets.fromLTRB(70, 1, 70, 1)),
//                                               InkWell(
//                                                 child: TextButton(
//                                                   onPressed: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder: (BuildContext
//                                                             context) {
//                                                           return Forgot2();
//                                                         });
//                                                   },
//                                                   child: Center(
//                                                     child: Text(
//                                                       'Forgot password ?',
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontSize: 16,
//                                                         fontFamily: 'Inter',
//                                                         color: Colors.white,
//                                                         decoration:
//                                                             TextDecoration
//                                                                 .underline,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: ScreenSize.size.height * 0.11,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           // color: Colors.amber,
//                                           width: ScreenSize.size.width * 0.73,
//                                           child: Column(
//                                             children: <Widget>[
//                                               ElevatedButton(
//                                                 child: Text(
//                                                   "   Log in   ",
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 16,
//                                                     fontFamily: 'Inter',
//                                                     color: Color(0xff09618E),
//                                                   ),
//                                                 ),
//                                                 onPressed: () {
//                                                   validate();
//                                                 },
//                                                 style: ElevatedButton.styleFrom(
//                                                   primary: Colors.white,
//                                                   onPrimary: Color(0xff09618E),
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             32.0),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: ScreenSize.size.height * 0.04,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Text(
//                                           'Not have an account?  ',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 16,
//                                             fontFamily: 'Inter',
//                                             color: Color(0xffFFFFFF),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           child: Text(
//                                             'Sign Up',
//                                             style: TextStyle(
//                                               color: Color(0xffFFFFFF),
//                                               fontWeight: FontWeight.w500,
//                                               fontFamily: 'Inter',
//                                               fontSize: 18,
//                                               decoration:
//                                                   TextDecoration.underline,
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             Navigator.pushNamed(
//                                                 context, '/Registration');
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 padding: EdgeInsets.only(
//                                     bottom: MediaQuery.of(context)
//                                         .viewInsets
//                                         .bottom),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
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
//       if (isDeviceConnected = await InternetConnectionChecker().hasConnection) {
//         print(isDeviceConnected);
//         login(
//           emailController.text.toString(),
//           passwordController.text.toString(),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: const Text('Please Check Internet Connection'),
//           backgroundColor: Color.fromARGB(255, 20, 117, 169),
//         ));
//       }
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

//   void showDialogBox() => showCupertinoDialog<String>(
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
