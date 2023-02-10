// import 'package:flutter/material.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';

// class down extends StatefulWidget {
//   const down({Key? key}) : super(key: key);

//   @override
//   State<down> createState() => _downState();
// }

// class _downState extends State<down> {
//   TextEditingController url = TextEditingController();
//   double? _progress;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("dowoad any file"),
//             SizedBox(
//               height: 20,
//             ),
//             // TextField(
//             //   toolbarOptions: ToolbarOptions(
//             //       copy: true, paste: true, cut: true, selectAll: true),
//             //   controller: url,
//             //   decoration: const InputDecoration(label: Text("Url*")),
//             // ),
//             SizedBox(
//               height: 20,
//             ),
//             _progress != null
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () {
//                       FileDownloader.downloadFile(
//                           url:
//                               "http://3.7.154.128:8000/media/Leave_and_License/priyanka%20-%20ayan%20shaikh%20(b6603cda-ab0e-4167-b74e-ef455cb161e4)/aggreement_valid_doc/sample.pdf",
//                           onProgress: (name, progress) {
//                             setState(() {
//                               _progress = progress;
//                             });
//                           },
//                           // name: "PANDA",
//                           onDownloadCompleted: (value) {
//                             if (value != null) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text(
//                                   "file downloaded - ${value}",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 backgroundColor: Colors.blue[600],
//                               ));
//                               print("navneet");
//                             }
//                             print('path $value');
//                             setState(() {
//                               _progress = null;
//                             });
//                           });
//                     },
//                     child: const Text("download"))
//           ],
//         ),
//       ),
//     );
//   }
// }
