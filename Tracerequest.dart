import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:omkar_development/servicerequest/application1.dart';
import 'package:omkar_development/servicerequest/serviceRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Applicationstatus.dart';
import 'Drawer.dart';
import 'Constants/app_constants.dart';
import 'model/TrakingIdModel.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_application_changesnew2/Drawer.dart';
// import 'package:flutter_application_changesnew2/Logout.dart';
// import 'package:flutter_application_changesnew2/Repair/WaterSupplyRepalir.dart';
// import 'package:flutter_application_changesnew2/Security/SecuritySuccesfuly.dart';
// import 'package:flutter_application_changesnew2/Tracerequest/Applicationstatus.dart';

class Trace extends StatefulWidget {
  const Trace({super.key});

  @override
  State<Trace> createState() => _TraceState();
}

var gg;

var data;
// Future<Traking?> SecurityApi3(String id4) async {
//   final response = await Future.wait([
//     http.get(
//         Uri.parse(
//             '${AppConstants.BASE_URL}/service-api/track-status/?tracking_id=$id4'),
//         headers: <String, String>{
//           // HttpHeaders.acceptHeader: 'application/json',
//           // HttpHeaders.contentTypeHeader: 'charset=UTF-8',
//           'Authorization': "Bearer ${id}",
//         })
//   ]);
//   print(response[0].statusCode);
//   // print(response.headers);

//   if (response[0].statusCode == 200) {
//     data = jsonDecode(response[0].statusCode);
//     print(data);
//     print('navneet');
//     return Traking.fromJson(jsonDecode(response[0].body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

class _TraceState extends State<Trace> {
  late Future<Traking> clean;
  final _formKey = GlobalKey<FormState>();
  // var data;
  var id4;
  // Future<Traking?> getDoubleData() async {
  //   //  Traking = <Map<String, dynamic>>[];
  //   var r1 = http.get(
  //       Uri.parse(
  //           '${AppConstants.BASE_URL}/service-api/track-status/?tracking_id='),
  //       headers: <String, String>{
  //         // HttpHeaders.acceptHeader: 'application/json',
  //         // HttpHeaders.contentTypeHeader: 'charset=UTF-8',
  //         'Authorization': "Bearer ${id}",
  //       });

  //   var uri = Uri.parse(
  //       '${AppConstants.BASE_URL}/service-api/track-status/?tracking_id=');
  //   var params = {"tracking_id": id4.toString()};
  //   final newURI = uri.replace(queryParameters: params);

  //   var r2 = http.get(newURI, headers: {
  //     'Authorization': "Bearer ${id}",
  //     HttpHeaders.contentTypeHeader: "application/json",
  //   });
  //   var response = await Future.wait([r1, r2]); // list of Responses

  //   if (response[0].statusCode == 200) {
  //     var data = jsonDecode(response[0].body);
  //     print(data);
  //     print("navneet");
  //     return Traking.fromJson(jsonDecode(response[0].body));
  //   }
  //    if (response[1].statusCode == 200) {
  //     var data = jsonDecode(response[0].body);
  //     print(data);
  //     print("navneet111");
  //     return Traking.fromJson(jsonDecode(response[0].body));
  //   }
  // }

  Future<Traking> SecurityApi3(String id4) async {
    final response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/service-api/track-status/?tracking_id=$id4'),
        headers: <String, String>{
          // HttpHeaders.acceptHeader: 'application/json',
          // HttpHeaders.contentTypeHeader: 'charset=UTF-8',
          'Authorization': "Bearer ${id}",
        });
    print(response.request);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);

      pageRoute(
          data['response']['tracking_id'],
          data['response']['user__username'],
          data['response']['request_sub_service__sub_service_name'],
          data['response']['gala__gala_number'],
          data['response']['service_request_date__date'],
          data['response']['service_request_date__time'],
          data['response']['description'],
          data['response']['status'],
          data);

      return Traking.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  var user1;
  var id3;
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
    // print("opppppp${id}");
    if (val2 != null) {}
  }

  void pageRoute(
      String id,
      String username,
      String sub_service_name,
      String gala_number,
      String request_date__date,
      String request_date__time,
      String description,
      String status,
      data) async {
    SharedPreferences perf1 = await SharedPreferences.getInstance();
    SharedPreferences perf2 = await SharedPreferences.getInstance();
    SharedPreferences perf3 = await SharedPreferences.getInstance();
    SharedPreferences perf4 = await SharedPreferences.getInstance();
    SharedPreferences perf5 = await SharedPreferences.getInstance();
    SharedPreferences perf6 = await SharedPreferences.getInstance();
    SharedPreferences perf7 = await SharedPreferences.getInstance();
    SharedPreferences perf8 = await SharedPreferences.getInstance();
    await perf1.setString(
      "popup1",
      id,
    );
    await perf2.setString(
      "popup2",
      username,
    );
    await perf3.setString(
      "popup3",
      sub_service_name,
    );
    await perf4.setString(
      "popup4",
      gala_number,
    );
    await perf5.setString(
      "popup5",
      request_date__date,
    );
    await perf6.setString(
      "popup6",
      request_date__time,
    );
    await perf7.setString(
      "popup7",
      description,
    );
    await perf8.setString(
      "popup8",
      status,
    );
    //  perf.clear();

    print(id);
    print(username);
    print(sub_service_name);
    print(gala_number);
    print(request_date__date);
    print(request_date__time);
    print(description);
    print(status);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Application(),
      ),
    );
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  }
  // void pageRoute(String refresh, data) async {
  //   SharedPreferences perf = await SharedPreferences.getInstance();
  //   await perf.setString(
  //     "login",
  //     refresh,
  //   );
  //   // print();
  //   // Navigator.of(context)
  //   //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

  //   // Navigator.of(context).pushAndRemoveUntil(
  //   //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  // }

  // var status;
  late int selectedRadio;
  // late Future<Traking> clean;
  late Future<Traking> futureAlbum1;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    checkLogin1();
    id3 = _Contro;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  String dropdownvalue = '31';
  String dropdownvalue1 = '34';
  String dropdownvalue2 = '37';
  String dropdownvalue3 = '40';

  // List of items in our dropdown menu
  var items = [
    '31',
    '32',
    '33',
  ];
  var items1 = [
    '34',
    '35',
    '36',
  ];
  var items2 = [
    '37',
    '38',
    '39',
  ];
  var items3 = [
    '40',
    '41',
    '42',
  ];
  TextEditingController _Contro = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // print(id2);
    // print(
    //     'http://192.168.0.121:8000/service-api/track-status/?tracking_id={$_Contro}');
    var ScreenSize = MediaQuery.of(context);
    var ScreenSize1 = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Drawer1()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // centerTitle: true,
        title: Text('Track status',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontFamily: 'Inter',
            )),

        // leadingWidth: 50,
        backgroundColor: Color(0XFFD9D9D9),
        elevation: 1,
        // foregroundColor: Colors.white,
        // titleSpacing: -01,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: Container(
        width: ScreenSize.size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // ignore: sort_child_properties_last
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Container(
                //       // color: Colors.amber,
                //       height: ScreenSize.size.height * 0.09,
                //       width: ScreenSize.size.width * 0.40,
                //       child: Image.asset('assets/images/omkar-logo 1.png'),
                //     ),
                //   ],
                // ),

                Card(
                  // insetPadding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  elevation: 10,
                  child: Container(
                    width: ScreenSize.size.width * 0.95,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: ScreenSize.size.height * 0.00,
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffBBD6EC),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0))),
                                width: ScreenSize.size.width * 0.95,
                                height: ScreenSize.size.height * 0.06,
                                // color: Color.fromARGB(255, 106, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(
                                    //   Icons.image_outlined,
                                    //   size: 30,
                                    //   color: Color.fromARGB(255, 15, 14, 14),
                                    // ),
                                    Container(
                                        height: ScreenSize.size.height * 0.06,
                                        width: 30,
                                        child: Image.asset(
                                            "assets/images/order-tracking.png")),
                                    Container(
                                      width: ScreenSize.size.width * 0.776,
                                      // color: Colors.amber,
                                      child: Text(
                                        'View & Track Applied Services',
                                        style: TextStyle(
                                          fontSize: 18 * ScreenSize1,
                                          // fontSize:
                                          //     ScreenSize.size.height * 0.025,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenSize.size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.87,
                                        height: ScreenSize.size.height * 0.10,
                                        // color: Colors.amber,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.87,
                                                  child: Text(
                                                    "Here you can Track the current application applied by you. You can know the status of the application here",
                                                    style: TextStyle(
                                                      // letterSpacing: 1.2,
                                                      // fontSize: 12.0,
                                                      fontSize:
                                                          14 * ScreenSize1,
                                                      // fontSize: ScreenSize
                                                      //         .size.height *
                                                      //     0.020,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                      fontFamily: 'Inter',
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width: ScreenSize.size.width *
                                                //       0.020,
                                                // ),
                                              ],
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

                          // Text(
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: ScreenSize.size.width * 0.70,
                              // color: Colors.amber,
                              height: ScreenSize.size.height * 0.04,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      // color: Colors.amber,
                                      height: ScreenSize.size.height * 0.04,
                                      width: ScreenSize.size.width * 0.55,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0XFFBBD6EC),
                                            // side:
                                            //     BorderSide(color: Colors.white, width: 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        4.0))),
                                        child: Container(
                                          width: ScreenSize.size.width * 0.55,
                                          child: Center(
                                            child: Text(
                                              "APPLICATION RECORDS",
                                              style: TextStyle(
                                                // fontSize: 14.0,
                                                fontSize: 14 * ScreenSize1,
                                                fontWeight: FontWeight.w300,
                                                color: Color.fromARGB(
                                                    255, 12, 12, 12),
                                                fontFamily: 'Inter',
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  serviceRequest(),
                                            ),
                                          );
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (BuildContext context) {
                                          //       return Application();
                                          //     });
                                        },
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.size.height * 0.03,
                ),
                Container(
                  width: ScreenSize.size.width * 0.97,
                  child: Row(
                    children: [
                      IntrinsicWidth(
                        // stepWidth: 160,
                        stepWidth: ScreenSize.size.width * 0.44,
                        child: Divider(
                          color: Color(0XFF626262),
                          thickness: 2,
                          indent: 10,
                        ),
                      ),
                      Text(
                        "  OR",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0XFF000000),
                            fontFamily: "Inter"),
                      ),
                      IntrinsicWidth(
                        stepWidth: ScreenSize.size.width * 0.44,
                        child: Divider(
                          color: Color(0XFF626262),
                          thickness: 2,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  // insetPadding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  elevation: 10,
                  child: Container(
                    width: ScreenSize.size.width * 0.95,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: ScreenSize.size.height * 0.00,
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffBBD6EC),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0))),
                                width: ScreenSize.size.width * 0.95,
                                height: ScreenSize.size.height * 0.06,
                                // color: Color.fromARGB(255, 106, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Icon(
                                    //   Icons.image_outlined,
                                    //   size: 30,
                                    //   color: Color.fromARGB(255, 15, 14, 14),
                                    // ),
                                    Container(
                                        height: ScreenSize.size.height * 0.06,
                                        width: 30,
                                        child: Image.asset(
                                            "assets/images/order-tracking.png")),
                                    // Container(
                                    //     height: ScreenSize.size.height * 0.06,
                                    //     width: 30,
                                    //     child: Image.asset(
                                    //         "assets/images/tracking.png")),
                                    Container(
                                      width: ScreenSize.size.width * 0.776,
                                      // color: Colors.amber,
                                      child: Text(
                                        'View & Track Applied Services',
                                        style: TextStyle(
                                          fontSize: 18 * ScreenSize1,
                                          // fontSize: 12.0,
                                          // fontSize:
                                          //     ScreenSize.size.height * 0.025,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: Color.fromARGB(255, 69, 80, 94),
                              //       borderRadius: BorderRadius.only(
                              //           topLeft: Radius.circular(8.0),
                              //           topRight: Radius.circular(8.0))),
                              //   width: ScreenSize.size.width * 0.945,

                              //   // color: Color.fromARGB(255, 106, 0, 0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text(
                              //         'view & Track Applied Services',
                              //         style: TextStyle(
                              //           fontSize: 15.0,
                              //           fontWeight: FontWeight.w700,
                              //           color: Color.fromARGB(255, 178, 181, 182),
                              //           fontFamily: 'Inter',
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                height: ScreenSize.size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.87,
                                        // height: ScreenSize.size.height * 0.06,
                                        // color: Colors.amber,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.87,
                                                  child: Text(
                                                    "Enter the Application Number generated from any Omkar Services Segment to know its status",
                                                    style: TextStyle(
                                                      fontSize:
                                                          14 * ScreenSize1,
                                                      // letterSpacing: 1.2,
                                                      // fontSize: 12.0,
                                                      // fontSize: ScreenSize
                                                      //         .size.height *
                                                      //     0.020,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                      fontFamily: 'Inter',
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
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
                        ]),
                        SizedBox(
                          height: ScreenSize.size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.87,
                                // height: ScreenSize.size.height * 0.10,
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: _Contro,
                                  cursorHeight: 10,
                                  // obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 20, 121, 203),
                                        )),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 20, 121, 203),
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color.fromARGB(255, 20, 121, 203),
                                    )),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                    focusColor: Colors.black,
                                    labelText: 'Enter Tracking id',
                                    // hintText: 'Enter Password',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter traking id';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.amber,
                              height: ScreenSize.size.height * 0.05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      height: ScreenSize.size.height * 0.04,
                                      width: ScreenSize.size.width * 0.36,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffBBD6EC),
                                            // side:
                                            //     BorderSide(color: Colors.white, width: 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        4.0))),
                                        child: Text(
                                          "GET STATUS",
                                          style: TextStyle(
                                            // fontSize: 14.0,
                                            fontSize: 14 * ScreenSize1,
                                            // fontSize:
                                            //     ScreenSize.size.height * 0.020,
                                            fontWeight: FontWeight.w300,
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              id4 = _Contro.text.toString();
                                            });
                                            SecurityApi3(id4);
                                            // postdata21(
                                            //   _controller.text.toString(),
                                            // );
                                            // uploadImage();
                                            // showDialog(
                                            //     useRootNavigator: true,
                                            //     context: context,
                                            //     builder: (BuildContext
                                            //         context) {
                                            //       return ElectricSuccesfuly();
                                            //     });
                                            _formKey.currentState!.save();
                                          }

                                          // getDoubleData();

                                          // SecurityApi3();
                                          // checkLogin1();
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => Application1(),
                                          //   ),
                                          // );
                                          // if (response[0].statusCode == 200) {
                                          //   Navigator.pushNamed(context, "/App",
                                          //       arguments: {gg = 1});
                                          // }
                                          // SecurityApi1(
                                          //   _Contro.text.toString(),
                                          // );
                                          //                              Navigator.push(
                                          // context,
                                          // MaterialPageRoute(
                                          //   builder: (context) => Application(),
                                          // ),
                                          // );
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (BuildContext context) {
                                          //       return Application();
                                          //     });
                                        },
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
        ),
      ),
    );
  }
}
   // var uri = Uri.parse(
    //     '${AppConstants.BASE_URL}/service-api/track-status/?tracking_id=');
    // var params = {"tracking_id": id4};
    // final newURI = uri.replace(queryParameters: params);

    // var response = await http.get(newURI, headers: {
    //   'Authorization': "Bearer ${id}",
    //   HttpHeaders.contentTypeHeader: "application/json",

    // });