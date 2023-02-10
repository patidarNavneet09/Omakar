// import 'dart:async';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:omkar_development/HomePage.dart';
// import 'package:omkar_development/LogInPage2.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'login2.dart';
// import 'Drawer.dart';
// import 'LogInPage.dart';

// class Welcomecer extends StatefulWidget {
//   const Welcomecer({super.key});

//   @override
//   State<Welcomecer> createState() => _WelcomecerState();
// }

// var data4;
// var data6;
// bool? seen1;

// class _WelcomecerState extends State<Welcomecer> {
//   final Image1 = [
//     Image.asset("assets/images/omkar12 1.png"),
//     Image.asset("assets/images/omkar12 1.png"),
//     Image.asset("assets/images/omkar12 1.png")
//   ];
//   final TextUri1 = [
//     'When do you need a textual warehouse',
//     "Why do you build a textual warehouse?",
//     "Ingredients of construction",
//   ];
//   final TextUri = [
//     'For small organizations and startups, they can probably do without a textual warehouse. But at some point, in time, the volume of information to be managed starts to become overwhelming. When an organization reaches the point where they need textual documents to run their business properly and cannot find those documents easily and efficiently, they need a textual warehouse.',
//     'The second reason is obvious and the ultimate purpose. The first reason is related to cross-referecing the source of the data and text captured in the textual warehouse. So, the source document reference might be needed for various obvious reasons, like contracts, agreements, court hearingsand medical transcriptions.',
//     'The words and phrases that are important to the business form the basis for the design of the textual warehouse. To the database designer who does classical database design, it seems odd that there is no mention or even a reference to processes in the design of the text warehouse. Indeed, the textual warehouse design is very different from classical database design. ',
//   ];
//   late int selectedRadio;

//   final controller = CarouselController();

//   bool isLastPage = false;
//   bool _selected = false;
//   int activeIndex = 0;
//   int currentIndex = 0;
//   late PageController _controller;

//   @override
//   void initState() {
//     super.initState();
//     navigateUser55();
//     navigateUser1();
//     navigateUser2();
//     // checkFirstSeen();
//     selectedRadio = 0;
//     _controller = PageController(initialPage: 0);
//   }

//   setSelectedRadio(val) {
//     setState(() {
//       selectedRadio = val;
//     });
//   }

//   void startTimer() {
//     Timer(Duration(seconds: 0), () {
//       navigateUser1();
//       navigateUser2();
//       // checkFirstSeen(); //It will redirect  after 3 seconds
//     });
//   }

//   // void navigateUser() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   var status = prefs.getBool('isLoggedIn') ?? false;
//   //   print(status);
//   //   if (status) {
//   //     Navigator.pushReplacementNamed(context, '/Drawer');
//   //   } else {
//   //     Navigator.pushReplacementNamed(context, "/Login");
//   //   }
//   // }
//   void navigateUser1() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     SharedPreferences pree = await SharedPreferences.getInstance();
//     var status = prefs.getBool('isLoggedIn') ?? false;
//     // seen = await prefs.setBool("seenon", true);
//     String? val1 = pree.getString("login12");
//     String? val = prefs.getString("login");
//     print("pppppp${val1}");
//     print("sadfasfasdf${val}");
//     print("pppppp${val1}");
//     if (val != null) {
//       var data1;
//       print("kkkkkkkkkkkkkkkkkkkkkkkk");
//       Navigator.pushReplacementNamed(context, '/Drawer');
//     } else if (val1 != null) {
//       print("fsdfsdf123");
//       Navigator.pushReplacementNamed(context, "/Login");
//     }
//   }

//   void navigateUser2() async {
//     SharedPreferences pree = await SharedPreferences.getInstance();

//     String? val1 = pree.getString("login12");

//     print("pppppp${val1}");

//     print("pppppp${val1}");
//     if (val1 != null) {
//       print("fsdfsdf123");
//       Navigator.pushReplacementNamed(context, "/Login");
//     }
//   }

//   void navigateUser55() async {
//     SharedPreferences pree125 = await SharedPreferences.getInstance();

//     seen = await pree125.getBool("seenon2") ?? false;

//     // Navigator.pushReplacementNamed(context, "/welcome");
//     if (seen == false) {
//       SystemNavigator.pop();

//       // seen = true;
//     }
//   }
//   // Future checkFirstSeen() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bool _seen = (prefs.getBool('isLoggedIn') ?? false);
//   //   Navigator.pop(context);
//   //   if (_seen) {
//   //     Navigator.pushReplacementNamed(context, '/Drawer');
//   //     print("navneetoye ${_seen}");
//   //   } else {
//   //     await prefs.setBool('seen', true);
//   //     Navigator.of(context).pushReplacement(
//   //         new MaterialPageRoute(builder: (context) => new Welcomecer()));
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     navigateUser55();
//     var ScreenSize = MediaQuery.of(context);
//     var queryData = MediaQuery.of(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
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
//       body: SingleChildScrollView(
//         // physics: NeverScrollableScrollPhysics(
//         //     parent: AlwaysScrollableScrollPhysics()),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(),
//               ),
//               height: ScreenSize.size.height - 82,
//               width: ScreenSize.size.width,
//               child: SingleChildScrollView(
//                   physics: NeverScrollableScrollPhysics(),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: ScreenSize.size.height * 0.92,
//                         width: ScreenSize.size.width * 0.97,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: ScreenSize.size.width * 0.97,
//                                   child: CarouselSlider.builder(
//                                     itemCount: TextUri.length,
//                                     itemBuilder: ((context, index, realIndex) {
//                                       final Image = Image1[index];
//                                       final Text1 = TextUri1[index];
//                                       final Text = TextUri[index];
//                                       return buildImage(TextUri[index], index);
//                                     }),
//                                     carouselController: controller,
//                                     options: CarouselOptions(
//                                         initialPage: 0,
//                                         viewportFraction: 1,
//                                         pageSnapping: true,
//                                         enableInfiniteScroll: false,
//                                         onPageChanged: (index, reason) =>
//                                             setState(() => activeIndex = index),
//                                         height: ScreenSize.size.height * 0.75,
//                                         enlargeCenterPage: true,
//                                         reverse: false),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Container(
//                                     width: ScreenSize.size.width * 0.20,
//                                     // color: Colors.amber,
//                                     child: currentIndex == activeIndex - 2
//                                         ? Container(
//                                             child: Text(""),
//                                           )
//                                         : TextButton(
//                                             // style: ElevatedButton.styleFrom(
//                                             //     primary: Color(0xff0060AF),
//                                             //     // side:
//                                             //     //     BorderSide(color: Colors.white, width: 1),
//                                             //     shape: RoundedRectangleBorder(
//                                             //         borderRadius:
//                                             //             BorderRadius.circular(2.0))),
//                                             child: Text(
//                                                 currentIndex == activeIndex - 2
//                                                     ? " "
//                                                     : "skip",
//                                                 style: TextStyle(
//                                                   fontSize:
//                                                       queryData.size.width *
//                                                           0.034,
//                                                   fontWeight: FontWeight.w500,
//                                                   // color: Color(0xff09618E),
//                                                   color: Colors.black,
//                                                   fontFamily: 'Inter',
//                                                 )),
//                                             onPressed: () {
//                                               // Navigator.popAndPushNamed(
//                                               //     context, '/Login');
//                                               Navigator.pushNamed(
//                                                   context, '/Login');
//                                               Navigator.pushReplacement(
//                                                   context,
//                                                   new MaterialPageRoute(
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           Login2()));
//                                             },
//                                             // onPressed: () => controller
//                                             //     .jumpToPage(activeIndex =
//                                             //         activeIndex + 2),
//                                           )),
//                                 SizedBox(
//                                   // color: Colors.amber,
//                                   height: ScreenSize.size.height * 0.03,
//                                   width: ScreenSize.size.width * 0.22,
//                                   child: ListView(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [buildIndicator()],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   width: ScreenSize.size.width * 0.07,
//                                 // ),
//                                 // Container(
//                                 //     child: ElevatedButton(
//                                 //   style: ElevatedButton.styleFrom(
//                                 //       primary: Color(0xff0060AF),
//                                 //       // side:
//                                 //       //     BorderSide(color: Colors.white, width: 1),
//                                 //       shape: RoundedRectangleBorder(
//                                 //           borderRadius:
//                                 //               BorderRadius.circular(2.0))),
//                                 //   child: Text(
//                                 //     currentIndex == 2 ? "Previous" : "Previous",
//                                 //     style: TextStyle(fontSize: 11),
//                                 //   ),
//                                 //   onPressed: () => controller.jumpToPage(2),
//                                 //   // onPressed: () => controller.jumpToPage(
//                                 //   //     activeIndex = activeIndex - 1),
//                                 // )),
//                                 Container(
//                                     width: ScreenSize.size.width * 0.20,
//                                     child: TextButton(
//                                       // style: ElevatedButton.styleFrom(
//                                       //     primary: Color(0xff0060AF),
//                                       //     // side:
//                                       //     //     BorderSide(color: Colors.white, width: 1),
//                                       //     shape: RoundedRectangleBorder(
//                                       //         borderRadius:
//                                       //             BorderRadius.circular(2.0))),
//                                       child: Text(
//                                         currentIndex == activeIndex - 2
//                                             ? "get start"
//                                             : "next",
//                                         style: TextStyle(
//                                           fontSize:
//                                               queryData.size.width * 0.034,
//                                           fontWeight: FontWeight.w500,
//                                           // color: Color(0xff09618E),
//                                           color: Colors.black,
//                                           fontFamily: 'Inter',
//                                         ),
//                                       ),
//                                       onPressed: () async {
//                                         if (currentIndex == activeIndex - 2) {
//                                           // Navigator.pushNamed(
//                                           //     context, '/Login');
//                                           // Navigator.pushReplacement(
//                                           //   context,
//                                           //   MaterialPageRoute(
//                                           //       builder: (context) => Login1()),
//                                           // );    setState(() {

//                                           // seen = true;

//                                           SharedPreferences pree1 =
//                                               await SharedPreferences
//                                                   .getInstance();
                                         
//    seen = await pree1.setBool("seenon", true);
//                                           Navigator.of(context)
//                                               .pushAndRemoveUntil(
//                                                   MaterialPageRoute(
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           Login2()),
//                                                   (Route route) =>
//                                                       route == null);

//                                           // Navigator.pushReplacement(
//                                           //     context,
//                                           //     new MaterialPageRoute(
//                                           //         builder:
//                                           //             (BuildContext context) =>
//                                           //                 Login1()));
//                                         }
//                                         next();
//                                       },
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildImage(String urlImage, int index) {
//     var queryData = MediaQuery.of(context);
//     var ScreenSize = MediaQuery.of(context);
//     return SingleChildScrollView(
//       physics: NeverScrollableScrollPhysics(),
//       child: Container(
//         child: Column(
//           children: [
//             Container(
//               // color: Colors.green,
//               height: ScreenSize.size.height * 0.32,
//               width: ScreenSize.size.width * 0.96,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                       width: ScreenSize.size.width * 0.96, child: Image1[index])
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   // color: Colors.amber,s
//                   height: ScreenSize.size.height * 0.12,
//                   width: ScreenSize.size.width * 0.77,
//                   child: Text(
//                     TextUri1[index],
//                     style: TextStyle(
//                       fontSize: 28.0,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xff0161AF),
//                       fontFamily: 'Inter',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               TextUri[index],
//               style: TextStyle(
//                 fontSize: queryData.size.width * 0.044,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.black,
//                 fontFamily: 'Inter',
//               ),
//               // textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         onDotClicked: (index) => controller.animateToPage(index),
//         activeIndex: activeIndex,
//         count: 3,
//         effect: JumpingDotEffect(
//             dotWidth: 10,
//             dotHeight: 10,
//             activeDotColor: Color(0xff0060AF),
//             dotColor: Color.fromARGB(255, 176, 206, 231)),
//       );
//   void animateToSlide(index) => controller.animateToPage(index);
//   void next() =>
//       controller.nextPage(duration: const Duration(microseconds: 500));

//   void previous() {}
// }
