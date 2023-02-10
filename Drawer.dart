import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:omkar_development/Electrict/ElectricPage.dart';
import 'package:omkar_development/Logout.dart';
import 'package:omkar_development/Repair/RepairPage.dart';
import 'package:omkar_development/Security/SecurityPage.dart';
import 'package:omkar_development/Water%20Supply/WaterSupplyPage.dart';
import 'package:omkar_development/model/securityModel.dart';
import 'package:omkar_development/propert.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'AboutAap.dart';
import 'Cleaning/CleaningPage.dart';
import 'Notification.dart';
import 'RateAap.dart';
import 'Tracerequest.dart';
import 'Constants/app_constants.dart';
import 'customdrawer.dart';
import 'model/TrakingIdModel.dart';
import 'model/elctricModel.dart';
import 'model/notificationModel.dart';
import 'model/profileModel.dart';
import 'model/propertyModel.dart';
import 'model/repairModel.dart';
import 'model/servicesModel.dart';
import 'model/trakingdetailsModel.dart';
import 'model/waterModel.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({
    Key? key,
  }) : super(key: key);

  @override
  State<Drawer1> createState() => _Drawer1State();
}

var data9;
var data8;
var data;
bool isSuccess = false;
Future<Elec> ElctricApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-service-request/?service_type=Electricity'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
    // print(data);
    print("Electric....api...hit");
    isSuccess = true;
    // data9 = isSuccess;

    // isSuccess = false;
    print("dfsdfsdf222");

    return Elec.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

var id;

Future<Services1> CleaningApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-service-request/?service_type=Cleaning'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("Cleaning....api...hit");
    // var data1 = response.body;
    // var data = jsonDecode(response.body.toString());
    // print(
    //   data['response']["services"][0]['service_uid'],
    // );

    return Services1.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Security1> SecurityApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-service-request/?service_type=Security'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("Security....api...hit");

    return Security1.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Water> waterApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-service-request/?service_type=Water Supply'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("waterApi....api...hit");
    return Water.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Repair1> repairApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-service-request/?service_type=Repair'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("repairApi....api...hit");

    return Repair1.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
// Future<Traking> SecurityApi1() async {
//   final response = await http.get(Uri.parse(
//       'http://192.168.0.121:8000/service-api/track-status/?'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Traking.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
Future<Profile> profile() async {
  final response = await http.get(
      Uri.parse('${AppConstants.BASE_URL}/user/profile-get/'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Trakingdetails> trakingapi() async {
  final response = await http.get(
      Uri.parse('${AppConstants.BASE_URL}/service-api/get-rental-all-request/'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("traking....api...hit");
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Trakingdetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Notificarion> notifiApi() async {
  final response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL}/service-api/get-rental-notification/'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("noti....api...hit");
    data = jsonDecode(response.body.toString());
    // print(data);

    // print("ramesh");
    isSuccess = false;
    data8 = isSuccess;

    return Notificarion.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Property> propertyapi() async {
  final response = await http.get(
      Uri.parse('${AppConstants.BASE_URL}/service-api/get-rental-properties/'),
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'charset=UTF-8',
        'Authorization': "Bearer ${id}",
      });

  if (response.statusCode == 200) {
    print("property....api...hit");
    data = jsonDecode(response.body.toString());
    // print(data);
    isSuccess = false;
    return Property.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class _Drawer1State extends State<Drawer1> {
  var data;
  var count;

  // Future<void> notifiApi() async {
  //   final response = await http.get(
  //       Uri.parse(
  //           '${AppConstants.BASE_URL}/service-api/get-rental-notification/'),
  //       headers: <String, String>{
  //         HttpHeaders.acceptHeader: 'application/json',
  //         HttpHeaders.contentTypeHeader: 'charset=UTF-8',
  //         'Authorization': "Bearer ${id}",
  //       });

  //   if (response.statusCode == 200) {
  //     print("noti....api...hit");

  //     data = jsonDecode(response.body.toString());
  //     // print(data['response'].length);
  //     count = data['response'].length;

  //     // {
  //     //   for (var i = 0; i <= data['response'].length; i++) {
  //     //     add();
  //     //   }
  //     // }
  //     // return Notificarion.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    checkLogin1();

    // clean = CleaningApi();
    // clean = SecurityApi3(id.toString());
    // futureAlbum1 = SecurityApi();
  }

  var user1;

  var email1;
// com.example.omkar_development
  void checkLogin1() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val2 = perf.getString("user");
    String? val3 = perf.getString("email");
    String? val5 = perf.getString("access");
    setState(() {
      user1 = val2;
      id = val5;
    });
    setState(() {
      email1 = val3;
    });
    // setState(() {
    //   id = val5;
    // });
    print("opppppp${id}");
    if (val2 != null) {}
  }

  var data1;

  var email = "";
  var Response;

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late DateTime today;
  late Future<Traking> clean;
  late Future<Security1> futureAlbum1;

  void checkLogin() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val = perf.getString("login");
    // print("navneet${val}");
    if (val != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);
    }
  }

  var user3;
  void checkLogin7() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val6 = perf.getString("access");
    print("navneet${val6}");
    token = val6;
  }

  // late Future<Login2> post;
  String dropdownvalue = 'Item 1';

 
  var items = [
    'Electricity',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? selectedValue;
  String dropdownValue = 'City';
  int counter = 0;

  void add() {
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    // notifiApi();
    // print(count);
    var ScreenSize = MediaQuery.of(context);
    var ScreenSize1 = MediaQuery.of(context).textScaleFactor;
    var queryData = MediaQuery.of(context);
    return Scaffold(
      drawer: drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              // icon: const Icon(
              //   Icons.menu,
              //   color: Colors.black,
              // ),
              icon: Image.asset("assets/images/Vector (5).png"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Container(
          width: ScreenSize.size.width * 0.43,
          // color: Colors.amber,
          child: Image.asset(
            "assets/images/omkar-logo 1.png",
          ),
        ),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Color(0xff09618E),
                  ),
                  onPressed: () {
                    notifiApi();
                    setState(() {
                      counter = 0;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NOtification(),
                      ),
                    );
                  }),
              // count != 0
              //     ? new Positioned(
              //         right: 4,
              //         top: 5,
              //         child: CircleAvatar(
              //           backgroundColor: Colors.red,
              //           radius: 10,
              //           child: Text(
              //             "0",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 14,
              //             ),
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //       )
              //     : new Container()
            ],
          ),
        ],
        // actions: [
        //   Stack(
        //     children: [
        //       Container(
        //         child: Text("fgasdf"),
        //         color: Colors.amber,
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => NOtification(),
        //             ),
        //           );
        //         },
        //         icon: Icon(
        //           Icons.notifications,
        //           color: Color(0xff09618E),
        //         ),
        //       ),
        //     ],
        //   )
        // ],
        leadingWidth: 50,
        backgroundColor: Color(0XFFD9D9D9),
        elevation: 1,
        // foregroundColor: Colors.white,
        // titleSpacing: -10,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // SizedBox(
            //   height: ScreenSize.size.height,
            //   width: ScreenSize.size.width,
            //   child: Image.asset("assets/images/10893 3 (1).png",
            //       fit: BoxFit.cover),
            // ),
            Container(
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       child: Row(
                  //         children: [
                  //           Builder(builder: (context) {
                  //             return IconButton(
                  //               onPressed: () =>
                  //                   Scaffold.of(context).openDrawer(),
                  //               icon: Icon(Icons.menu),
                  //             );
                  //           }),
                  //           Container(
                  //             // color: Colors.amber,
                  //             height: ScreenSize.size.height * 0.09,
                  //             width: ScreenSize.size.width * 0.40,
                  //             child: Image.asset(
                  //                 'assets/images/omkar-logo 1.png'),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: ScreenSize.size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Services',

                                style: TextStyle(
                                  fontSize: 18,
                                  // fontSize: queryData.size.height * 0.025,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0060Af),
                                ),
                                // color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xffE4EFF9),
                        // height: 120,
                        // height: ScreenSize.size.height * 0.20,
                        width: ScreenSize.size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     color: Color(0xffA3582E),
                              //     child: MaterialButton(
                              //       // enableFeedback: false,
                              //       highlightElevation: 0,
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             // Icon(
                              //             //   Icons.electric_bolt_outlined,
                              //             //   color: Colors.white,
                              //             //   size: 50,
                              //             // ),
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.08,
                              //               child: Image.asset(
                              //                   "assets/images/healthicons_electricity-outline (1).png"),
                              //             ),
                              //             Text(
                              //               'Electricity',
                              //               style: TextStyle(
                              //                 fontSize: 15,
                              //                 fontFamily: 'Lato',
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         // data = "services";
                              //         // print(data);
                              //         //  Navigator.popAndPushNamed(
                              //         //   context, '/Electric');
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const Electric(),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xffA3582E),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.10,
                              //               child: Image.asset(
                              //                   "assets/images/healthicons_electricity-outline (1).png"),
                              //             ),
                              //             SizedBox(
                              //               height:
                              //                   ScreenSize.size.height * 0.01,
                              //             ),
                              //             Text(
                              //               'Electricity',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.width * 0.03,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         ElctricApi();
                              //         // data = "services";
                              //         // print(data);
                              //         //  Navigator.popAndPushNamed(
                              //         //   context, '/Electric');
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const Electric(),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xffA3582E),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/healthicons_electricity-outline (1).png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Electricity',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Electric(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     color: Color(0xff7E2994),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.08,
                              //               child: Image.asset(
                              //                   "assets/images/material-symbols_cleaning-bucket-outline-rounded (1).png"),
                              //             ),
                              //             Text(
                              //               'Cleaning',
                              //               style: TextStyle(
                              //                 fontSize: 15,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         data = "services";
                              //         // print(data);
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const Cleaning(),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xff7E2994),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.10,
                              //               child: Image.asset(
                              //                   "assets/images/material-symbols_cleaning-bucket-outline-rounded (1).png"),
                              //             ),
                              //             Text(
                              //               'Cleaning',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.height * 0.018,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const Cleaning(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xff7E2994),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.10,
                              //               child: Image.asset(
                              //                   "assets/images/material-symbols_cleaning-bucket-outline-rounded (1).png"),
                              //             ),
                              //             SizedBox(
                              //               height:
                              //                   ScreenSize.size.height * 0.014,
                              //             ),
                              //             Text(
                              //               'Cleaning',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.width * 0.03,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         data = "services";
                              //         // print(data);
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const Cleaning(),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xff7E2994),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/material-symbols_cleaning-bucket-outline-rounded (1).png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Cleaning',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      data = "services";
                                      // print(data);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Cleaning(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     surfaceTintColor: Colors.amber,
                              //     elevation: 7,
                              //     // color: Colors.green,
                              //     color: Color(0xff35459A),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.08,
                              //               child: Icon(
                              //                 Icons.security_outlined,
                              //                 color: Colors.white,
                              //                 size: 50,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Security',
                              //               style: TextStyle(
                              //                 fontSize: 15,
                              //                 fontFamily: 'Lato',
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const Security(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xff35459A),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.12,
                              //               child: Icon(
                              //                 Icons.security_outlined,
                              //                 color: Colors.white,
                              //                 size:
                              //                     ScreenSize.size.height * 0.09,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Security',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.width * 0.03,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const Security(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xff35459A),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Icon(
                                              Icons.security_outlined,
                                              color: Colors.white,
                                              size:
                                                  ScreenSize.size.height * 0.07,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Security',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Security(),
                                            maintainState: false),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xff35459A),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.12,
                              //               child: Icon(
                              //                 Icons.security_outlined,
                              //                 color: Colors.white,
                              //                 size: 50,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Security',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.height * 0.023,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const Security(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Colors.blueGrey,
                              //     color: Colors.green,
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Icon(
                              //               Icons.water_drop,
                              //               color: Colors.white,
                              //               // size: 30,
                              //             ),
                              //             Text(
                              //               'Water Supply',
                              //               style: TextStyle(
                              //                 fontSize: 15,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const WaterSupply(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Colors.green,
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.12,
                              //               child: Icon(
                              //                 Icons.water_drop,
                              //                 color: Colors.white,
                              //                 size:
                              //                     ScreenSize.size.height * 0.09,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Water Supply',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.width * 0.03,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const WaterSupply(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Colors.green,
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Icon(
                                              Icons.water_drop,
                                              color: Colors.white,
                                              size:
                                                  ScreenSize.size.height * 0.07,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Water Supply',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WaterSupply(),
                                            maintainState: false),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Colors.green,
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.12,
                              //               child: Icon(
                              //                 Icons.water_drop,
                              //                 color: Colors.white,
                              //                 size: 50,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Water Supply',
                              //               style: TextStyle(
                              //                 fontSize:
                              //                     queryData.size.height * 0.022,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const WaterSupply(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color.fromARGB(255, 110, 221, 195),
                              //     color: Color(0xff9A3566),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.12,
                              //               child: Icon(
                              //                 Icons.home_repair_service_sharp,
                              //                 color: Colors.white,
                              //                 size: 50,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Repair',
                              //               style: TextStyle(
                              //                 // fontSize: 15,
                              //                 fontSize:
                              //                     queryData.size.width * 0.03,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //                 fontFamily: 'Lato',
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const Repair(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xff9A3566),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Icon(
                                              Icons.home_repair_service_sharp,
                                              color: Colors.white,
                                              size:
                                                  ScreenSize.size.height * 0.07,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Repair',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Repair(),
                                            maintainState: false),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: ScreenSize.size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Trace Application Status',
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontSize: queryData.size.height * 0.025,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0060Af),
                                  fontFamily: 'Lato',
                                ),
                                // color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xffE4EFF9),
                        // height: ScreenSize.size.height * 0.21,
                        width: ScreenSize.size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     color: Color(0xff298D94),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.172,
                              //         // width: ScreenSize.size.width * 0.25,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.07,
                              //               child: Image.asset(
                              //                   "assets/images/Vector (3).png"),
                              //             ),
                              //             SizedBox(
                              //               height:
                              //                   ScreenSize.size.height * 0.01,
                              //             ),
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   // color: Colors.amber,
                              //                   width: ScreenSize.size.width *
                              //                       0.23,
                              //                   // height: 34,
                              //                   child: Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.center,
                              //                     children: [
                              //                       Text(
                              //                         'Track Requested\nServices Status',
                              //                         style: TextStyle(
                              //                           // fontSize:15
                              //                           fontSize: queryData
                              //                                   .size.width *
                              //                               0.03,
                              //                           fontWeight:
                              //                               FontWeight.w500,
                              //                           color: Colors.white,
                              //                         ),
                              //                         textAlign:
                              //                             TextAlign.center,
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) => Trace(),
                              //               maintainState: false),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xff298D94),
                                  child: MaterialButton(
                                    child: Container(
                                      // color: Colors.amber,
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/Vector (3).png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.01,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Container(
                                                //   // width: 94,
                                                //   // color: Colors.amber,
                                                //   // width: 101,
                                                //   child:
                                                Text(
                                                  'Track Requested\nServices Status',
                                                  style: TextStyle(
                                                    fontSize: 12 * ScreenSize1,
                                                    // fontSize: queryData
                                                    //         .size.height *
                                                    //     0.014,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Trace(),
                                            maintainState: false),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // Card(
                              //   child: Container(
                              //     color: Colors.blue,
                              //     height: ScreenSize.size.height * 0.17,
                              //     width: ScreenSize.size.width * 0.29,
                              //     child: Text("fgsdfg"),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: ScreenSize.size.width,
                      //       color: Colors.white,
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(12.0),
                      //         child: Text(
                      //           'Maintenance',
                      //           style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w600,
                      //             color: Color(0xff0060Af),
                      //           ),
                      //           // color: Colors.black),
                      //           textAlign: TextAlign.start,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   color: Color.fromARGB(255, 255, 250, 250),
                      //   height: ScreenSize.size.height * 0.21,
                      //   width: ScreenSize.size.width,
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       children: [
                      //         Card(
                      //           elevation: 7,
                      //           color: Colors.amber,
                      //           child: MaterialButton(
                      //             child: Container(
                      //               height: ScreenSize.size.height * 0.17,
                      //               width: ScreenSize.size.width * 0.25,
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Container(
                      //                     height: ScreenSize.size.height * 0.07,
                      //                     child: Image.asset(
                      //                         "assets/images/1-1.png"),
                      //                   ),
                      //                   SizedBox(
                      //                     height: ScreenSize.size.height * 0.01,
                      //                   ),
                      //                   Text(
                      //                     'Floor',
                      //                     style: TextStyle(
                      //                       fontSize: 15,
                      //                       fontWeight: FontWeight.w600,
                      //                       color: Colors.white,
                      //                     ),
                      //                     textAlign: TextAlign.start,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             onPressed: () {},
                      //           ),
                      //         ),
                      //         Card(
                      //           elevation: 7,
                      //           color: Color.fromARGB(255, 171, 9, 63),
                      //           child: MaterialButton(
                      //             child: Container(
                      //               height: ScreenSize.size.height * 0.17,
                      //               width: ScreenSize.size.width * 0.25,
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Container(
                      //                     height: ScreenSize.size.height * 0.07,
                      //                     child: Image.asset(
                      //                         "assets/images/1-2.png"),
                      //                   ),
                      //                   SizedBox(
                      //                     height: ScreenSize.size.height * 0.01,
                      //                   ),
                      //                   Text(
                      //                     'Roof',
                      //                     style: TextStyle(
                      //                       fontSize: 15,
                      //                       fontWeight: FontWeight.w600,
                      //                       color: Colors.white,
                      //                     ),
                      //                     textAlign: TextAlign.start,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             onPressed: () {},
                      //           ),
                      //         ),
                      //         // Card(
                      //         //   child: Container(
                      //         //     color: Colors.blue,
                      //         //     height: ScreenSize.size.height * 0.17,
                      //         //     width: ScreenSize.size.width * 0.29,
                      //         //     child: Text("fgsdfg"),
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: ScreenSize.size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Contract',
                                style: TextStyle(
                                  // fontSize: 18,
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0060Af),
                                ),
                                // color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // color: Color.fromARGB(255, 255, 250, 250),
                        color: Color(0xffE4EFF9),
                        // height: ScreenSize.size.height * 0.21,
                        width: ScreenSize.size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Color(0xff9A3566),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/icons8-property-64.png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'Property',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      propertyapi();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => property(),
                                            maintainState: false),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Colors.blueGrey,
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/1-3.png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    child: Text(
                                                      'View Contract',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Trace(),
                                      //       maintainState: false),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  color: Colors.lightGreen,
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.172,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // color: Colors.amber,
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/1-4.png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        // color: Colors.amber,
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.23,
                                                        // height: 34,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Renew Contract',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                // fontSize: queryData
                                                                //         .size
                                                                //         .width *
                                                                //     0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      CleaningApi();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Trace(),
                                      //       maintainState: false),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     // color: Color(0xff298D94),
                              //     color: Colors.lightGreen,
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.07,
                              //               child: Image.asset(
                              //                   "assets/images/1-4.png"),
                              //             ),
                              //             SizedBox(
                              //               height:
                              //                   ScreenSize.size.height * 0.01,
                              //             ),
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 Column(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.center,
                              //                   children: [
                              //                     Container(
                              //                       // color: Colors.amber,
                              //                       // width: 101,
                              //                       width:
                              //                           ScreenSize.size.width *
                              //                               0.23,
                              //                       child: Text(
                              //                         'Renew Contract',
                              //                         style: TextStyle(
                              //                           // fontSize: 14,
                              //                           // fontSize: 14,
                              //                           fontSize: queryData
                              //                                   .size.height *
                              //                               0.018,
                              //                           fontFamily: "Lato",
                              //                           fontWeight:
                              //                               FontWeight.w600,
                              //                           color: Colors.white,
                              //                         ),
                              //                         textAlign:
                              //                             TextAlign.center,
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         // Navigator.push(
                              //         //   context,
                              //         //   MaterialPageRoute(
                              //         //       builder: (context) => Trace(),
                              //         //       maintainState: false),
                              //         // );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // Card(
                              //   child: Container(
                              //     color: Colors.blue,
                              //     height: ScreenSize.size.height * 0.17,
                              //     width: ScreenSize.size.width * 0.29,
                              //     child: Text("fgsdfg"),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   color: Color.fromARGB(255, 255, 250, 250),
                      //   height: ScreenSize.size.height * 0.21,
                      //   width: ScreenSize.size.width,
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(2.0),
                      //           child: Card(
                      //             elevation: 7,
                      //             color: Colors.blueGrey,
                      //             child: MaterialButton(
                      //               child: Container(
                      //                 // height: ScreenSize.size.height * 0.17,
                      //                 width: ScreenSize.size.width * 0.25,
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   children: [
                      //                     Container(
                      //                       height:
                      //                           ScreenSize.size.height * 0.07,
                      //                       child: Image.asset(
                      //                           "assets/images/1-3.png"),
                      //                     ),
                      //                     SizedBox(
                      //                       height:
                      //                           ScreenSize.size.height * 0.01,
                      //                     ),
                      //                     Container(
                      //                       // color: Colors.amber,
                      //                       width: ScreenSize.size.width * 0.25,
                      //                       child: Text(
                      //                         'View Contract',
                      //                         style: TextStyle(
                      //                           // fontSize: 15,
                      //                           fontWeight: FontWeight.w600,
                      //                           color: Colors.white,
                      //                         ),
                      //                         textAlign: TextAlign.start,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               onPressed: () {},
                      //             ),
                      //           ),
                      //         ),

                      //         // Padding(
                      //         //   padding: const EdgeInsets.all(2.0),
                      //         //   child: Card(
                      //         //     elevation: 7,
                      //         //     color: Colors.lightGreen,
                      //         //     child: MaterialButton(
                      //         //       child: Container(
                      //         //         // height: ScreenSize.size.height * 0.17,
                      //         //         width: ScreenSize.size.width * 0.26,
                      //         //         child: Column(
                      //         //           mainAxisAlignment:
                      //         //               MainAxisAlignment.center,
                      //         //           children: [
                      //         //             Container(
                      //         //               height:
                      //         //                   ScreenSize.size.height * 0.07,
                      //         //               child: Image.asset(
                      //         //                   "assets/images/1-4.png"),
                      //         //             ),
                      //         //             SizedBox(
                      //         //               height:
                      //         //                   ScreenSize.size.height * 0.01,
                      //         //             ),
                      //         //             Container(
                      //         //               color: Colors.amber,
                      //         //               width: 101,
                      //         //               child: Text(
                      //         //                 'Renew Contract',
                      //         //                 style: TextStyle(
                      //         //                   // fontSize: 14,
                      //         //                   fontWeight: FontWeight.w600,
                      //         //                   color: Colors.white,
                      //         //                 ),
                      //         //                 textAlign: TextAlign.justify,
                      //         //               ),
                      //         //             ),
                      //         //             // Container(
                      //         //             //   color: Colors.amber,
                      //         //             //   width: 103,
                      //         //             //   child: Text(
                      //         //             //     'Renew Contract',
                      //         //             //     style: TextStyle(
                      //         //             //       // fontSize: 14,
                      //         //             //       fontWeight: FontWeight.w600,
                      //         //             //       color: Colors.white,
                      //         //             //     ),
                      //         //             //     textAlign: TextAlign.justify,
                      //         //             //   ),
                      //         //             // ),
                      //         //           ],
                      //         //         ),
                      //         //       ),
                      //         //       onPressed: () {},
                      //         //     ),
                      //         //   ),
                      //         // ),
                      //         // Card(
                      //         //   child: Container(
                      //         //     color: Colors.blue,
                      //         //     height: ScreenSize.size.height * 0.17,
                      //         //     width: ScreenSize.size.width * 0.29,
                      //         //     child: Text("fgsdfg"),
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: ScreenSize.size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Leave Request',
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontSize: queryData.size.height * 0.025,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0060Af),
                                ),
                                // color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // color: Color.fromARGB(255, 255, 250, 250),
                        color: Color(0xffE4EFF9),
                        // height: ScreenSize.size.height * 0.21,
                        width: ScreenSize.size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 7,
                                  // color: Color(0xff298D94),
                                  color: Color.fromARGB(255, 113, 103, 186),
                                  child: MaterialButton(
                                    child: Container(
                                      height: ScreenSize.size.height * 0.17,
                                      width: ScreenSize.size.width * 0.24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height:
                                                ScreenSize.size.height * 0.07,
                                            child: Image.asset(
                                                "assets/images/pepicons_leave (1).png"),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    // width: 101,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.23,
                                                    child: Text(
                                                      'Leave',
                                                      style: TextStyle(
                                                        // fontSize: 14,
                                                        fontSize: 12,
                                                        // fontSize: queryData
                                                        //         .size.width *
                                                        //     0.03,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Trace(),
                                      //       maintainState: false),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Card(
                              //     elevation: 7,
                              //     color: Color.fromARGB(255, 113, 103, 186),
                              //     child: MaterialButton(
                              //       child: Container(
                              //         height: ScreenSize.size.height * 0.17,
                              //         width: ScreenSize.size.width * 0.23,
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               height:
                              //                   ScreenSize.size.height * 0.07,
                              //               child: Image.asset(
                              //                   "assets/images/pepicons_leave (1).png"),
                              //             ),
                              //             SizedBox(
                              //               height:
                              //                   ScreenSize.size.height * 0.01,
                              //             ),
                              //             Text(
                              //               'Leave',
                              //               style: TextStyle(
                              //                 fontSize:
                              //                     queryData.size.height * 0.023,
                              //                 fontFamily: 'Lato',
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.white,
                              //               ),
                              //               textAlign: TextAlign.start,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer12() {
    Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 154, 203, 243),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 38,
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "${user1}",
                              ),
                            ),
                            Container(
                              child: Text("${email1}"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    )),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Drawer1(),
                          maintainState: false),
                    );
                  },
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.apps,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutAap()),
                    );
                  },
                  title: Text(
                    'About App',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Share.share("com.example.omkar_development");
                  },
                  title: Text(
                    'Share App',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rate()),
                    );
                  },
                  title: Text(
                    'Rate App',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Repair(),
                    //       maintainState: false),
                    // );
                  },
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff66849D),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.only(left: 11),
                  leading: Icon(
                    Icons.logout_sharp,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    // final SharedPreferences prefs = await prefs;
                    // prefs.setBool("isLoggedIn", false);
                    // showSimpleNotification(Text("You are logged Out"),
                    // background: Colors.red);
                    showDialog(
                        useRootNavigator: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Logout();
                        });
                  },
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          // This container holds the align

          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      // ListTile(
                      //     leading: Icon(Icons.settings),
                      //     title: Text('Settings')),
                      ListTile(
                          // minLeadingWidth: 0.1,
                          // title: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     // Container(
                          //     //     width: 140,
                          //     //     child: Image.asset(
                          //     //         "assets/images/omkar-logo.png")),
                          //     // Container(
                          //     //   child: Text('Version v.01'),
                          //     // )
                          //   ],
                          // ),
                          title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Version v.01'),
                        ],
                      ))
                    ],
                  ))))
        ],
      ),
    );
  }
}
