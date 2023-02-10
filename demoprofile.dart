// import 'package:flutter/material.dart';

// import '../Drawer.dart';


// class Editprofile extends StatelessWidget {
//   const Editprofile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var ScreenSize = MediaQuery.of(context);
//     return Scaffold(
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
//         // actions: [
//         //   Container(
//         //     width: 90,
//         //     child: IconButton(
//         //       icon: Text(
//         //         "Edit Profile",
//         //         style: TextStyle(
//         //             color: Colors.black,
//         //             fontSize: 14,
//         //             fontWeight: FontWeight.w600),
//         //       ),
//         //       iconSize: 10,
//         //       onPressed: () {},
//         //     ),
//         //   )
//         // ],
//       ),
//       body: Center(
//         child: Container(
//           height: ScreenSize.size.height,
//           // color: Colors.amber,
//           width: ScreenSize.size.width * 0.95,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: ScreenSize.size.height * 0.06),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     // color: Colors.amber,
//                     // width: ScreenSize.size.width * 0.30,
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Color.fromARGB(255, 234, 208, 131),
//                           radius: 50,
//                           child: Icon(Icons.person),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: ScreenSize.size.height * 0.03),
//                   Container(
//                     // color: Colors.amber,
//                     width: ScreenSize.size.width * 0.80,
//                     height: ScreenSize.size.height * 0.14,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Name   : ",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromARGB(255, 73, 150, 188),
//                                 fontFamily: 'Inter',
//                               ),
//                             ),
//                             Container(
//                                 // color: Colors.green,
//                                 width: ScreenSize.size.width * 0.55,
//                                 // height: ScreenSize.size.height * 0.03,
//                                 child: Text(
//                                   "Navneet patidar",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     color: Color.fromARGB(255, 73, 150, 188),
//                                     fontFamily: 'Inter',
//                                   ),
//                                   textAlign: TextAlign.justify,
//                                 )),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Email    : ",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromARGB(255, 73, 150, 188),
//                                 fontFamily: 'Inter',
//                               ),
//                             ),
//                             Container(
//                                 // color: Colors.green,
//                                 width: ScreenSize.size.width * 0.55,
//                                 // height: ScreenSize.size.height * 0.03,
//                                 child: Text(
//                                   "Navneetpatidar12@gmail.com",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     color: Color.fromARGB(255, 73, 150, 188),
//                                     fontFamily: 'Inter',
//                                   ),
//                                   textAlign: TextAlign.justify,
//                                 )),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Phone  : ",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromARGB(255, 73, 150, 188),
//                                 fontFamily: 'Inter',
//                               ),
//                             ),
//                             Container(
//                                 // color: Colors.green,
//                                 width: ScreenSize.size.width * 0.55,
//                                 // height: ScreenSize.size.height * 0.03,
//                                 child: Text(
//                                   "1122334455",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     color: Color.fromARGB(255, 73, 150, 188),
//                                     fontFamily: 'Inter',
//                                   ),
//                                   textAlign: TextAlign.justify,
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: ScreenSize.size.height * 0.05,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MaterialButton(
//                       color: Color.fromARGB(255, 70, 133, 164),
//                       onPressed: () {},
//                       child: Text("Edit Profile"))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
