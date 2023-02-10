// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../model/securityModel.dart';
// import '../model/servicesModel.dart';

// Future<Services1> fetchAlbum() async {
//   final response = await http.get(Uri.parse(
//     'http://192.168.0.121:8000/service-api/get-service-request/?service_type=Cleaning',
//   ));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Services1.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// var G = Response(rentalGala: [], services: []);

// class _MyAppState extends State<MyApp> {
//   late Future<Services1> futureAlbum;
//   // List<Service> services = [];

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   List<Service> _region = [];
//   late List<Service>? services;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Fetch Data Example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Fetch Data Example'),
//           ),
//           body: Center(
//             child: FutureBuilder<Services1?>(
//                 future: futureAlbum,
//                 builder: (context, snapshot) {
//                   for (var item in snapshot.data!.response.services) {
//                     // print(item.subServiceName.toString());
//                     // print(snapshot.data!.response.services.map((e) => e.subServiceName));

//                     // By default, show a loading spinner.
//                     return Text(snapshot.data!.response.services
//                         .map((e) => e.subServiceName)
//                         .toList()
//                         .toString());
//                   }
//                   return Text("gfsdf");
//                 }),
//           ),
//           // body: Center(
//           //   child: Text(futureAlbum[0][0]),
//           // ),
//         ));
//   }
// }
