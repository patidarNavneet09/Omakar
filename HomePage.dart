// ignore_for_file: non_constant_identifier_names

import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:omkar_development/Welcomcerser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool? seen;

class _HomeState extends State<Home> {
  // late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  @override
  void initState() {
    // getConnectivity();
    super.initState();
    // Timer(const Duration(seconds: 2),
    //     () => Navigator.popAndPushNamed(context, '/welcome')
    //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     //     builder: (BuildContext context) => const Welcomecer()))
    //     );
    startTimer();
  }

  // getConnectivity() => subscription = Connectivity()
  //         .onConnectivityChanged
  //         .listen((ConnectivityResult result) async {
  //       isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected && isAlertSet == false) {
  //         showDialogBox();
  //         setState(() => isAlertSet = true);
  //       }
  //     });
  @override
  void dispose() {
    // subscription.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  // bool seen = false;
  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences pree = await SharedPreferences.getInstance();
    SharedPreferences pree1 = await SharedPreferences.getInstance();
    String? val1 = pree.getString("login12");
    String? val = prefs.getString("login");
    seen = await pree1.getBool("seenon") ?? false;

    if (val != null) {
      // print("sdfgsdfg${status}");
      Navigator.pushReplacementNamed(context, '/Drawer');
    }
    print("sagsafgsadfg000000");
    print("qqqq222${val}");
    print("pppppp111${val1}");
    // Navigator.pushReplacementNamed(context, "/welcome");
    if (seen == false) {
      Navigator.pushReplacementNamed(context, "/welcome");
      seen = await pree1.setBool("seenon", true);
      print(seen);
      // seen = true;
    } else if (val == null) {
      Navigator.pushReplacementNamed(context, "/Login");
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 67,
        actions: [
          Row(
            children: [
              Container(
                child: Image.asset('assets/images/Ellipse 27.png'),
              ),
            ],
          ),
        ],
      ),
      body: SizedBox(
        height: ScreenSize.size.height,
        width: ScreenSize.size.width,
        child: Center(
          child: Image.asset('assets/images/omkar-logo.png'),
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text("No Connection"),
          content: const Text("Please check your internet connectivity"),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text("OK"))
          ],
        ),
      );
}
