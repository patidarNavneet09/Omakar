// import 'package:flutter/material.dart';
// import 'package:omkar_development/Editprofile.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Drawer.dart';
// import 'editprofile2.dart';

// class Editprofile1 extends StatefulWidget {
//   const Editprofile1({super.key});

//   @override
//   State<Editprofile1> createState() => _Editprofile1State();
// }

// class _Editprofile1State extends State<Editprofile1> {
//   var user11;
//   var email11;
//   void checkLogin112() async {
//     SharedPreferences perf = await SharedPreferences.getInstance();
//     String? val2 = perf.getString("user");
//     String? val3 = perf.getString("email");
//     setState(() {
//       user11 = val2;
//     });
//     setState(() {
//       email11 = val3;
//     });
//     // print("${user1}");
//     if (val2 != null) {}
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkLogin112();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   var ScreenSize = MediaQuery.of(context);
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       elevation: 1,
//   //       backgroundColor: Colors.white,
//   //       leading: Builder(
//   //         builder: (BuildContext context) {
//   //           return IconButton(
//   //             icon: const Icon(
//   //               Icons.arrow_back_ios,
//   //               // Icons.arrow_back,
//   //               color: Color(0xff09618E),
//   //             ),
//   //             onPressed: () {
//   //               Navigator.pop(
//   //                 context,
//   //                 MaterialPageRoute(
//   //                     builder: (context) => Drawer1(), maintainState: false),
//   //               );
//   //               // Navigator.pushReplacement(
//   //               //   context,
//   //               //   MaterialPageRoute(builder: (context) => const Drawer1()),
//   //               // );
//   //             },
//   //             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//   //           );
//   //         },
//   //       ),
//   //       title: Text(
//   //         'Profile',
//   //         style: TextStyle(
//   //           fontSize: 19.0,
//   //           fontWeight: FontWeight.w700,
//   //           color: Color(0xff09618E),
//   //           fontFamily: 'Inter',
//   //         ),
//   //       ),
//   //       centerTitle: true,
//   //       // actions: [
//   //       //   Column(
//   //       //     mainAxisAlignment: MainAxisAlignment.center,
//   //       //     children: [
//   //       //       Row(
//   //       //         children: [
//   //       //           Container(
//   //       //             width: 80,
//   //       //             height: ScreenSize.size.height * 0.05,
//   //       //             color: Color(0xff09618E),
//   //       //             child: IconButton(
//   //       //               icon: Text(
//   //       //                 "Edit",
//   //       //                 style: TextStyle(
//   //       //                     color: Colors.white,
//   //       //                     fontSize: 16,
//   //       //                     fontWeight: FontWeight.w600),
//   //       //               ),
//   //       //               iconSize: 10,
//   //       //               onPressed: () {},
//   //       //             ),
//   //       //           ),
//   //       //         ],
//   //       //       ),
//   //       //     ],
//   //       //   ),
//   //       //   SizedBox(
//   //       //     width: 10,
//   //       //   )
//   //       // ],
//   //     ),
//   //     body: Center(
//   //       child: Container(
//   //         height: ScreenSize.size.height,
//   //         // color: Colors.amber,
//   //         width: ScreenSize.size.width * 0.95,
//   //         child: Column(
//   //           mainAxisAlignment: MainAxisAlignment.start,
//   //           children: [
//   //             SizedBox(height: ScreenSize.size.height * 0.06),
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 SizedBox(
//   //                   // color: Colors.amber,
//   //                   width: ScreenSize.size.width * 0.20,
//   //                   child: Column(
//   //                     children: [
//   //                       CircleAvatar(
//   //                         // backgroundColor: Color.fromARGB(255, 234, 208, 131),
//   //                         radius: 40,
//   //                         child: Icon(Icons.person, color: Colors.white),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //                 Container(
//   //                   // color: Colors.amber,
//   //                   width: ScreenSize.size.width * 0.70,
//   //                   height: ScreenSize.size.height * 0.14,
//   //                   child: Column(
//   //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                     children: [
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           Text(
//   //                             "Name   : ",
//   //                             style: TextStyle(
//   //                               fontWeight: FontWeight.w700,
//   //                               color: Color.fromARGB(255, 73, 150, 188),
//   //                               fontFamily: 'Inter',
//   //                             ),
//   //                           ),
//   //                           Container(
//   //                               // color: Colors.green,
//   //                               width: ScreenSize.size.width * 0.48,
//   //                               // height: ScreenSize.size.height * 0.03,
//   //                               child: Text(
//   //                                 "${user11}",
//   //                                 style: TextStyle(
//   //                                   fontWeight: FontWeight.w700,
//   //                                   color: Color.fromARGB(255, 73, 150, 188),
//   //                                   fontFamily: 'Inter',
//   //                                 ),
//   //                                 textAlign: TextAlign.justify,
//   //                               )),
//   //                         ],
//   //                       ),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           Text(
//   //                             "Email    : ",
//   //                             style: TextStyle(
//   //                               fontWeight: FontWeight.w700,
//   //                               color: Color.fromARGB(255, 73, 150, 188),
//   //                               fontFamily: 'Inter',
//   //                             ),
//   //                           ),
//   //                           Container(
//   //                               // color: Colors.green,
//   //                               width: ScreenSize.size.width * 0.55,
//   //                               // height: ScreenSize.size.height * 0.03,
//   //                               child: Text(
//   //                                 "${email11}",
//   //                                 style: TextStyle(
//   //                                   fontSize: 15,
//   //                                   fontWeight: FontWeight.w700,
//   //                                   color: Color.fromARGB(255, 73, 150, 188),
//   //                                   fontFamily: 'Inter',
//   //                                 ),
//   //                                 textAlign: TextAlign.justify,
//   //                               )),
//   //                         ],
//   //                       ),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           Text(
//   //                             "Phone  : ",
//   //                             style: TextStyle(
//   //                               fontWeight: FontWeight.w700,
//   //                               color: Color.fromARGB(255, 73, 150, 188),
//   //                               fontFamily: 'Inter',
//   //                             ),
//   //                           ),
//   //                           Container(
//   //                               // color: Colors.green,
//   //                               width: ScreenSize.size.width * 0.47,
//   //                               // height: ScreenSize.size.height * 0.03,
//   //                               child: Text(
//   //                                 "1234567890",
//   //                                 style: TextStyle(
//   //                                   fontWeight: FontWeight.w700,
//   //                                   color: Color.fromARGB(255, 73, 150, 188),
//   //                                   fontFamily: 'Inter',
//   //                                 ),
//   //                                 textAlign: TextAlign.justify,
//   //                               )),
//   //                         ],
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 )
//   //               ],
//   //             ),
//   //             SizedBox(
//   //               height: ScreenSize.size.height * 0.05,
//   //             ),
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 MaterialButton(
//   //                     color: Color.fromARGB(255, 70, 133, 164),
//   //                     onPressed: () {
//   //                       Navigator.push(
//   //                         context,
//   //                         MaterialPageRoute(
//   //                             builder: (context) => Updateprofile()),
//   //                       );
//   //                     },
//   //                     child: Text("Edit Profile"))
//   //               ],
//   //             )
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     var ScreenSize = MediaQuery.of(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: Colors.white,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Color(0xff09618E),
//               ),
//               onPressed: () {
//                 Navigator.pop(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => Drawer1(), maintainState: false),
//                 );
//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const Drawer1()),
//                 // );
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//         title: Text(
//           'Profile',
//           style: TextStyle(
//             fontSize: 19.0,
//             fontWeight: FontWeight.w700,
//             color: Color(0xff09618E),
//             fontFamily: 'Inter',
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 80,
//                     height: ScreenSize.size.height * 0.05,
//                     color: Color(0xff09618E),
//                     child: IconButton(
//                       icon: Text(
//                         "Edit",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       iconSize: 10,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Editprofile21()),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: ScreenSize.size.width,
//                     // color: Colors.amber,
//                     height: ScreenSize.size.height / 4,
//                     child: Image.asset(
//                       "assets/images/lorries-outside-a-large-warehouse 2 (1).png",
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: ScreenSize.size.height * 0.580,
//               width: ScreenSize.size.width,
//               // color: Colors.amber,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: ScreenSize.size.height * 0.520,
//                     width: ScreenSize.size.width * 0.86,
//                     color: Color(0xff09618E),
//                     child: Card(
//                       shadowColor: Colors.blue[300],
//                       elevation: 10,
//                       child: Container(
//                         height: ScreenSize.size.height,
//                         // color: Colors.amber,
//                         width: ScreenSize.size.width * 0.95,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(height: ScreenSize.size.height * 0.07),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // SizedBox(
//                                 //   // color: Colors.amber,
//                                 //   width: ScreenSize.size.width * 0.20,
//                                 //   child: Column(
//                                 //     children: [
//                                 //       CircleAvatar(
//                                 //         // backgroundColor: Color.fromARGB(255, 234, 208, 131),
//                                 //         radius: 40,
//                                 //         child: Icon(Icons.person, color: Colors.white),
//                                 //       ),
//                                 //     ],
//                                 //   ),
//                                 // ),
//                                 Container(
//                                   // color: Colors.amber,
//                                   width: ScreenSize.size.width * 0.80,
//                                   height: ScreenSize.size.height * 0.31,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       SizedBox(
//                                         // color: Colors.amber,
//                                         width: ScreenSize.size.width * 0.20,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             CircleAvatar(
//                                               // backgroundColor: Color.fromARGB(255, 234, 208, 131),
//                                               radius: 40,
//                                               child: Icon(Icons.person,
//                                                   color: Colors.white),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           // SizedBox(
//                                           //   width: ScreenSize.size.width * 0.10,
//                                           // ),
//                                           Container(
//                                             // color: Colors.black,
//                                             width: 85,
//                                             child: Text(
//                                               "First Name :",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 color: Color.fromARGB(
//                                                     255, 73, 150, 188),
//                                                 fontFamily: 'Inter',
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             // color: Colors.green,
//                                             width: ScreenSize.size.width * 0.40,
//                                             // height: ScreenSize.size.height * 0.08,
//                                             child: TextFormField(
//                                               textInputAction:
//                                                   TextInputAction.next,
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty ||
//                                                     !RegExp(r'^[a-z,A-Z]+$')
//                                                         .hasMatch(value)) {
//                                                   return "Enter your first name";
//                                                 }
//                                                 return null;
//                                               },
//                                               // autovalidateMode:
//                                               //     AutovalidateMode.onUserInteraction,
//                                               // controller: nameController,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               decoration: InputDecoration(
//                                                 hintText: "Enter your name",
//                                                 // labelText: "First Name",
//                                                 labelStyle: TextStyle(
//                                                   fontSize: 15.0,
//                                                   fontWeight: FontWeight.w300,
//                                                   color: Colors.black,
//                                                   fontFamily: 'Inter',
//                                                 ),

//                                                 // border: OutlineInputBorder(
//                                                 //     borderRadius:
//                                                 //         BorderRadius.circular(
//                                                 //             3),
//                                                 //     borderSide: BorderSide(
//                                                 //         color: Colors.black)),
//                                                 // errorStyle: TextStyle(color: Colors.white),
//                                                 focusedErrorBorder:
//                                                     UnderlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             color:
//                                                                 Colors.black)),
//                                                 // focusedErrorBorder:
//                                                 //     UnderlineInputBorder(
//                                                 //         borderSide: BorderSide(
//                                                 //             color:
//                                                 //                 Colors.black)),
//                                                 errorBorder:
//                                                     UnderlineInputBorder(
//                                                   borderSide: BorderSide(
//                                                       color: Colors.white),
//                                                 ),
//                                                 focusedBorder:
//                                                     OutlineInputBorder(
//                                                   borderSide: BorderSide(
//                                                       color: Colors.black),
//                                                 ),
//                                                 // enabledBorder: OutlineInputBorder(
//                                                 //     borderSide: BorderSide(color: Colors.black)),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             width: ScreenSize.size.width * 0.10,
//                                           ),
//                                           Container(
//                                             // color: Colors.black,
//                                             width: 65,
//                                             child: Text(
//                                               "Email    : ",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 color: Color.fromARGB(
//                                                     255, 73, 150, 188),
//                                                 fontFamily: 'Inter',
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                               // color: Colors.green,
//                                               width:
//                                                   ScreenSize.size.width * 0.48,
//                                               // height: ScreenSize.size.height * 0.03,
//                                               child: Text(
//                                                 "${email11}",
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Color.fromARGB(
//                                                       255, 73, 150, 188),
//                                                   fontFamily: 'Inter',
//                                                 ),
//                                                 textAlign: TextAlign.justify,
//                                               )),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             width: ScreenSize.size.width * 0.10,
//                                           ),
//                                           Container(
//                                             // color: Colors.black,
//                                             width: 65,
//                                             child: Text(
//                                               "Mobile  : ",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 color: Color.fromARGB(
//                                                     255, 73, 150, 188),
//                                                 fontFamily: 'Inter',
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                               // color: Colors.green,
//                                               width:
//                                                   ScreenSize.size.width * 0.48,
//                                               // height: ScreenSize.size.height * 0.03,
//                                               child: Text(
//                                                 "1234567890",
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Color.fromARGB(
//                                                       255, 73, 150, 188),
//                                                   fontFamily: 'Inter',
//                                                 ),
//                                                 textAlign: TextAlign.justify,
//                                               )),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             // SizedBox(
//                             //   height: ScreenSize.size.height * 0.05,
//                             // ),
//                             // Row(
//                             //   mainAxisAlignment: MainAxisAlignment.center,
//                             //   children: [
//                             //     MaterialButton(
//                             //         color: Color.fromARGB(255, 70, 133, 164),
//                             //         onPressed: () {
//                             //           Navigator.push(
//                             //             context,
//                             //             MaterialPageRoute(
//                             //                 builder: (context) =>
//                             //                     Updateprofile()),
//                             //           );
//                             //         },
//                             //         child: Text("Edit Profile"))
//                             //   ],
//                             // )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         // padding:
//         //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       ),
//     );
//   }
// }
