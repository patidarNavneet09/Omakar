import 'package:flutter/material.dart';
import 'package:omkar_development/servicerequest/application1.dart';
import 'package:overlay_support/overlay_support.dart';
import 'Demo/Demowalk.dart';
import 'Demo/downfile.dart';
import 'login2.dart';
import 'Drawer.dart'; 
import 'HomePage.dart';
import 'RegistrationPage2.dart';
import 'Electrict/ElectricPage.dart';
import 'Security/SecurityPage.dart';
import 'Tracerequest.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return OverlaySupport.global(
        child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/Login': (context) => const Login2(),
        '/home': (context) => const Home(),
        '/Registration': (context) => const Registration2(),
        '/Security': (context) => const Security(),
        '/Drawer': (context) => const Drawer1(),
        '/Electric': (context) => const Electric(),
        "/welcome": (context) => const walk(),
        "/trace": (context) => const Trace(),
        "/App": (context) => const Application1()
      },
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ));
  }
}
