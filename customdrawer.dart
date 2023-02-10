import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AboutAap.dart';
import 'AboutAap1.dart';
import 'Constants/app_constants.dart';
import 'Demo/editprofile21.dart';
import 'Drawer.dart';
import 'Profile.dart';
import 'FAQ.dart';
import 'Logout.dart';
import 'RateAap.dart';
import 'model/profileModel.dart';
import 'package:http/http.dart' as http;

class drawer extends StatefulWidget {
  drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

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
    print("profile....api...hit");
    // setState(() {
    //   Profile11 = Profile.fromJson(data) as Future<Profile>;
    // });
    // print(data['response']);
    // print(data['response']['last_name']);
    // print(data['response']['phone']);
    // pageRoute(data['response']['first_name'], data['response']['last_name'],
    //     data['response']['phone'], data['response']['address'], data);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class _drawerState extends State<drawer> {
  late Future<Profile> Profile11;
  // Future<Profile> profile() async {
  //   final response = await http.get(
  //       Uri.parse('${AppConstants.BASE_URL}/user/profile-get/'),
  //       headers: <String, String>{
  //         HttpHeaders.acceptHeader: 'application/json',
  //         HttpHeaders.contentTypeHeader: 'charset=UTF-8',
  //         'Authorization': "Bearer ${id}",
  //       });

  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     print("profile....api...hit");
  //     // setState(() {
  //     //   Profile11 = Profile.fromJson(data) as Future<Profile>;
  //     // });
  //     // print(data['response']);
  //     // print(data['response']['last_name']);
  //     // print(data['response']['phone']);
  //     pageRoute(data['response']['first_name'], data['response']['last_name'],
  //         data['response']['phone'], data['response']['address'], data);
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Profile.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  void pageRoute(
      String name, String last, String phone, String address, data) async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    await perf.setString(
      "name",
      name,
    );
    await perf.setString(
      "last",
      last,
    );
    await perf.setString(
      "phone",
      phone,
    );
    await perf.setString(
      "address",
      address,
    );
    // showDialog(
    //     barrierDismissible: false,
    //     useRootNavigator: false,
    //     useSafeArea: true,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return updateprofiledialog();
    //     });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Editprofile22()),
    );
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  }

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late DateTime today;
  var data1;
  var data;
  late Future<Profile> profile12;
  // get drawer => null;
  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    checkLogin1();
    profile12 = profile();
  }

  void checkLogin() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val = perf.getString("login");
    // print("navneet${val}");
    if (val != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);
    }
  }

  var user1;
  var email1;
// com.example.omkar_development
  void checkLogin1() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val2 = perf.getString("user");
    String? val3 = perf.getString("email");
    setState(() {
      user1 = val2;
    });
    setState(() {
      email1 = val3;
    });
    // print("${user1}");
    if (val2 != null) {}
  }

  // late Future<Login2> post;
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Electricity',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String? selectedValue;
  String dropdownValue = 'City';

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Container(
      width: ScreenSize.size.width * 0.70,
      height: ScreenSize.size.height,
      child: Drawer(
        width: ScreenSize.size.width * 0.70,
        // column holds all the widgets in the drawer
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: [
                  FutureBuilder<Profile>(
                      future: profile12,
                      builder: (context, snapshot) {
                        // print("${AppConstants.BASE_URL}"
                        //     "${snapshot.data!.response.profile}");
                        if (snapshot.hasData) {
                          // print(items3);
                          // print(
                          //     snapshot.data!.response.profile.isEmpty == true);
                          return Container(
                            // height: ScreenSize.size.height * 0.25,
                            // color: Color.fromARGB(255, 154, 203, 243),
                            height: 174,
                            child: DrawerHeader(
                              
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 154, 203, 243),
                                  
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      height: 76,
                                      child: CircleAvatar(
                                          radius: 42,
                                          child: Stack(
                                            children: [
                                              snapshot.data!.response.profile ==
                                                      null
                                                  ? CircleAvatar(
                                                      radius: 38.0,
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 30,
                                                      ),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    )
                                                  : CircleAvatar(
                                                      radius: 42.0,
                                                      foregroundImage: NetworkImage(
                                                          "${AppConstants.BASE_URL}"
                                                          "${snapshot.data!.response.profile}"),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 05,
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      // height: ScreenSize.size.height * 0.045,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(snapshot
                                                    .data!.response.firstName),
                                                SizedBox(
                                                  width: ScreenSize.size.width *
                                                      0.01,
                                                ),
                                                Text(snapshot
                                                    .data!.response.lastName),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            child: Text(
                                              "${email1}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: ScreenSize.size.height * 0.035,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                // profile();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Editprofile22()),
                                                );
                                              },
                                              icon: Icon(Icons.edit))
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        }
                        return Container(
                          height: 173,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 154, 203, 243),
                          ),
                          // height: ScreenSize.size.height * 0.25,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }),
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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Drawer1()),
                          (Route<dynamic> route) => false);
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     '/Drawer',
                      //     (
                      //       Route<dynamic> route,
                      //     ) =>
                      //         false);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => Drawer1(),
                      //       maintainState: false),
                      // );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FAQ()),
                      );
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
                  // ListTile(
                  //   tileColor: Color(0xff66849D),
                  //   minLeadingWidth: 0,
                  //   minVerticalPadding: 0,
                  //   contentPadding: EdgeInsets.only(left: 11),
                  //   leading: Icon(
                  //     Icons.settings,
                  //     color: Colors.white,
                  //   ),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => FAQ()),
                  //     // );
                  //     // Navigator.pushReplacement(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //       builder: (context) => Repair(),
                  //     //       maintainState: false),
                  //     // );
                  //   },
                  //   title: Text(
                  //     'Setting ',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.white,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Divider(),
                        // ListTile(
                        //     leading: Icon(Icons.settings),
                        //     title: Text('Settings')),
                        ListTile(
                          // minLeadingWidth: 0.1,
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 140,
                                  child: Image.asset(
                                      "assets/images/omkar-logo.png")),
                              // SizedBox(
                              //   height: ScreenSize.size.height * 0.01,
                              // ),
                              // Container(
                              //   child: Text('Version v.01'),
                              // )
                            ],
                          ),
                          //     title: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('Version v.01'),
                          //   ],
                          // )
                        )
                      ],
                    ))))
          ],
        ),
      ),
    );
  }
}
