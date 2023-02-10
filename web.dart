// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});

//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }

// class _WebViewAppState extends State<WebViewApp> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse(
//             'http://3.7.154.128:8000/media/Leave_and_License/priyanka%20-%20ayan%20shaikh%20(b6603cda-ab0e-4167-b74e-ef455cb161e4)/aggreement_valid_doc/sample.pdf'),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//       ),
//       body: WebViewWidget(
//         layoutDirection: TextDirection.ltr,
//         controller: controller,
//       ),
//     );
//   }
// }
