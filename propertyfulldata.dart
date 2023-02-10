import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:omkar_development/pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:omkar_development/notification_service.dart';
import '../Constants/app_constants.dart';
import '../model/profileModel.dart';
import '../notification_service.dart';
import '../pdf2.dart';
import '../web.dart';
import 'package:http/http.dart' as http;

class propeertydata extends StatefulWidget {
  final List Text1;
  final List Text2;
  final List Text3;
  final List Text4;
  final List Text5;
  final List Text6;
  final List Text7;
  final List Text8;
  final List Text9;
  final List Text10;
  final List Text11;
  final List Text12;
  const propeertydata(
      {Key? key,
      required this.Text1,
      required this.Text2,
      required this.Text3,
      required this.Text4,
      required this.Text5,
      required this.Text6,
      required this.Text7,
      required this.Text8,
      required this.Text9,
      required this.Text10,
      required this.Text11,
      required this.Text12})
      : super(key: key);

  @override
  State<propeertydata> createState() => _propeertydataState();
}

String remotePDFpath = "";
var pd;
var pd1;
var pdo;

class _propeertydataState extends State<propeertydata> {
  NotificationServices notificationServices = NotificationServices();
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String remotePDFpath1 = "";
  String corruptedPathPDF = "";
  double? _progress;

  @override
  void initState() {
    super.initState();
    notificationServices.notificationsPlugin;
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
    createFileOfPdfUrl1().then((f) {
      setState(() {
        remotePDFpath1 = f.path;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    notificationServices.notificationsPlugin.cancel(0);
    notificationServices.notificationsPlugin.cancelAll();
  }

  var data;
  var data1;
  var prodelete;


  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();

    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "${AppConstants.BASE_URL}$pd";
      // print("ppppppp${url}");
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      // print("Download files");
      // print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> createFileOfPdfUrl1() async {
    Completer<File> completer = Completer();

    try {
      final url = "${AppConstants.BASE_URL}$pd1";
      // print("qqqqqq${url}");
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      // print("Download files");
      // print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                // color: Color(0xff09618E),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // centerTitle: true,
        title: Text('View property ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              // color: Color(0xff09618E),
              color: Colors.black,
              fontFamily: 'Inter',
            )),

        // leadingWidth: 50,
        backgroundColor: Color(0XFFD9D9D9),
        elevation: 3,
        // foregroundColor: Colors.white,
        // titleSpacing: -10,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.size.height * 0.01,
            ),
            Center(
              child: Container(
                // color: Colors.amber,
                width: ScreenSize.size.width * 0.96,
                // height: ScreenSize.size.height * 0.50,
                child: Card(
                    elevation: 5,
                    shadowColor: Colors.blue,
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenSize.size.height * 0.01,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       width: ScreenSize.size.width * 0.05,
                        //     ),
                        //     Card(
                        //       color: Color.fromARGB(255, 58, 165, 232),
                        //       elevation: 4,
                        //       shadowColor: Colors.blue,
                        //       child: SizedBox(
                        //         width: ScreenSize.size.width * 0.11,
                        //         height: ScreenSize.size.height * 0.04,
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               width: ScreenSize.size.width * 0.08,
                        //               height: ScreenSize.size.height * 0.034,
                        //               child: Image.asset(
                        //                   "assets/images/icons8-property-64.png"),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Container(
                          width: ScreenSize.size.width * 0.86,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: ScreenSize.size.width * 0.60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Card(
                                                      color: Color.fromARGB(
                                                          255, 3, 113, 143),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)
                                                          //set border radius more than 50% of height and width to make circle
                                                          ),
                                                      elevation: 7,
                                                      shadowColor: Colors.blue,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Container(
                                                          child: Text(
                                                            widget.Text1[0]
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              // color: Color(0xff09618E),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      245,
                                                                      245,
                                                                      245),
                                                              fontFamily:
                                                                  'Inter',
                                                            ),
                                                            textAlign: TextAlign
                                                                .justify,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
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
                                      SizedBox(
                                        height: ScreenSize.size.height * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: ScreenSize.size.width * 0.02,
                                          ),
                                          Container(
                                            // color: Colors.green,
                                            width: ScreenSize.size.width * 0.60,
                                            child: Text(
                                              "This is provide services...",
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )
                                      // SizedBox(
                                      //   height:
                                      //       ScreenSize.size.height *
                                      //           0.01,
                                      // ),
                                      // Container(
                                      //   width:
                                      //       ScreenSize.size.width *
                                      //           0.47,
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment
                                      //             .center,
                                      //     children: [
                                      //       Text(
                                      //         "This is provide services...",
                                      //         style: TextStyle(
                                      //           fontSize: 12.0,
                                      //           fontWeight:
                                      //               FontWeight.w400,
                                      //           // color: Color(0xff09618E),
                                      //           color: Colors.black,
                                      //           fontFamily: 'Inter',
                                      //         ),
                                      //         textAlign:
                                      //             TextAlign.justify,
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ]),
                                Column(
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      width: ScreenSize.size.width * 0.20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: ScreenSize.size.width * 0.05,
                                          ),
                                          // Card(
                                          //   color:
                                          //       Color.fromARGB(255, 58, 165, 232),
                                          //   elevation: 4,
                                          //   shadowColor: Colors.blue,
                                          //   child: SizedBox(
                                          //     width: 45,
                                          //     height: 33,
                                          //     child: Column(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.center,
                                          //       children: [
                                          //         GestureDetector(
                                          //           onTap: () {
                                          //             //                                 Navigator.push(
                                          //             //   context,
                                          //             //   MaterialPageRoute(
                                          //             //     builder: (context) =>
                                          //             //         serviceRequest(),
                                          //             //   ),
                                          //             // );
                                          //             // setState(
                                          //             //     () {
                                          //             //   var pass1 = snapshot
                                          //             //       .data!
                                          //             //       .response[
                                          //             //           index]
                                          //             //       .gala;
                                          //             //   var pass2 = snapshot
                                          //             //       .data!
                                          //             //       .response[
                                          //             //           index]
                                          //             //       .owner;
                                          //             //   var pass3 = snapshot
                                          //             //       .data!
                                          //             //       .response[index];
                                          //             // });
                                          //             // print(snapshot
                                          //             //     .data!
                                          //             //     .response[
                                          //             //         index]
                                          //             //     .gala);
                                          //             // print(snapshot
                                          //             //     .data!
                                          //             //     .response[
                                          //             //         index]
                                          //             //     .owner);
                                          //             // print(snapshot
                                          //             //         .data!
                                          //             //         .response[
                                          //             //     index]);
                                          //           },
                                          //           child: Container(
                                          //             width: 45,
                                          //             height: 30,
                                          //             // child: Icon(
                                          //             //     Icons
                                          //             //         .arrow_forward_ios_outlined,
                                          //             //     color: Color.fromARGB(
                                          //             //         255,
                                          //             //         58,
                                          //             //         165,
                                          //             //         232)),
                                          //             child: Image.asset(
                                          //                 "assets/images/icons8-property-64.png"),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.020,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.84,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Divider(
                                color: Color.fromARGB(255, 139, 133, 133),
                                thickness: 2,
                                indent: 1,
                                endIndent: 1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.023,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Details",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w800,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User Name",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: SelectableText(
                                  widget.Text2[0].toString(),
                                  // snapshot.data!.response[index]
                                  //     .owner.firstName,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      // color: Color(0xff09618E),
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: ScreenSize.size.width * 0.81,
                        //   child: Row(
                        //     mainAxisAlignment:
                        //         MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text("User Name",
                        //           style: TextStyle(
                        //             fontSize: 12.0,
                        //             fontWeight: FontWeight.w400,
                        //             // color: Color(0xff09618E),
                        //             color: Colors.black,
                        //             fontFamily: 'Inter',
                        //           )),
                        //       Text(
                        //           snapshot.data!.response[index]
                        //               .userUsername,
                        //           style: TextStyle(
                        //             fontSize: 12.0,
                        //             fontWeight: FontWeight.w400,
                        //             // color: Color(0xff09618E),
                        //             color: Colors.black,
                        //             fontFamily: 'Inter',
                        //           )),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Property Name",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: SelectableText(
                                  widget.Text3[0].toString(),
                                  // snapshot
                                  //     .data!
                                  //     .response[index]
                                  //     .gala
                                  //     .warehouse
                                  //     .propertyName,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      // color: Color(0xff09618E),
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: ScreenSize.size.width * 0.81,
                        //   child: Row(
                        //     mainAxisAlignment:
                        //         MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text("Property Name",
                        //           style: TextStyle(
                        //             fontSize: 12.0,
                        //             fontWeight: FontWeight.w400,
                        //             // color: Color(0xff09618E),
                        //             color: Colors.black,
                        //             fontFamily: 'Inter',
                        //           )),
                        //       Container(
                        //         width:
                        //             ScreenSize.size.width * 0.51,
                        //         child: Text(
                        //             "ghiudfhgiisdfhuighdsfhghsdhffgadfgasdfasdfasdfasdf",
                        //             // snapshot.data!.response[index]
                        //             //     .galaWarehousePropertyName,
                        //             style: TextStyle(
                        //               fontSize: 12.0,
                        //               fontWeight: FontWeight.w400,
                        //               // color: Color(0xff09618E),
                        //               color: Colors.black,
                        //               fontFamily: 'Inter',
                        //             )),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Property Type",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: SelectableText(
                                  // snapshot
                                  widget.Text4[0].toString(),
                                  //     .data!
                                  //     .response[index]
                                  //     .gala
                                  //     .warehouse
                                  //     .propertyType,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      // color: Color(0xff09618E),
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: ScreenSize.size.width * 0.81,
                        //   child: Row(
                        //     mainAxisAlignment:
                        //         MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text("Property Type",
                        //           style: TextStyle(
                        //             fontSize: 12.0,
                        //             fontWeight: FontWeight.w400,
                        //             // color: Color(0xff09618E),
                        //             color: Colors.black,
                        //             fontFamily: 'Inter',
                        //           )),
                        //       Text(
                        //           snapshot.data!.response[index]
                        //               .galaWarehousePropertyType,
                        //           style: TextStyle(
                        //             fontSize: 12.0,
                        //             fontWeight: FontWeight.w400,
                        //             // color: Color(0xff09618E),
                        //             color: Colors.black,
                        //             fontFamily: 'Inter',
                        //           )),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gala Number",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SelectableText(
                                      widget.Text5[0].toString(),
                                      // snapshot
                                      //     .data!
                                      //     .response[index]
                                      //     .gala
                                      //     .galaNumber,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        // color: Color(0xff09618E),
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                      textAlign: TextAlign.left,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("agreement_type",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SelectableText(
                                      widget.Text6[0].toString(),
                                      // snapshot
                                      //     .data!
                                      //     .response[index]
                                      //     .gala
                                      //     .galaNumber,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        // color: Color(0xff09618E),
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                      textAlign: TextAlign.left,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("agreement valid start date",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.Text7[0].year
                                              .toString()
                                              .padLeft(4, '0'),
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text7[0].month.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text7[0].day.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("agreement valid end date",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.Text8[0].year
                                              .toString()
                                              .padLeft(4, '0'),
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text8[0].month.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text8[0].day.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.016,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("agreement valid document",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                // width: ScreenSize.size.width * 0.41,
                                // width: ScreenSize.size.width * 0.24,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      height: 30,
                                      child: IconButton(
                                        hoverColor: Colors.transparent,
                                        // splashColor: Colors.transparent,
                                        // focusColor: Colors.transparent,
                                        iconSize: 20,
                                        onPressed: () {
                                          print(remotePDFpath);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PDFScreen(
                                                  path: remotePDFpath),
                                            ),
                                          );
                                        },
                                        // icon: Icon(
                                        //   Icons.remove_red_eye,
                                        //   color: Color(0xff0060AF),
                                        // )
                                        icon: Image.asset(
                                            "assets/images/eye.png"),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: 30,
                                      child: IconButton(
                                          hoverColor: Colors.transparent,
                                          // splashColor: Colors.transparent,
                                          // focusColor: Colors.transparent,
                                          iconSize: 20,
                                          onPressed: () {
                                            FileDownloader.downloadFile(
                                                url:
                                                    "${AppConstants.BASE_URL}${pd}",
                                                onProgress: (name, progress) {
                                                  setState(() {
                                                    _progress = progress;
                                                  });
                                                },
                                                // name: "PANDA",
                                                onDownloadCompleted: (value) {
                                                  setState(() {
                                                    data = value;
                                                  });

                                                  notificationServices
                                                      .Showotification(
                                                          title:
                                                              "File Downloaded",
                                                          body: "${data}");
                                                  if (value != null) {
                                                    // ScaffoldMessenger.of(
                                                    //         context)
                                                    //     .showSnackBar(SnackBar(
                                                    //   content: Text(
                                                    //     "file downloaded - ${value}",
                                                    //     style: TextStyle(
                                                    //         color:
                                                    //             Colors.white),
                                                    //   ),
                                                    //   backgroundColor:
                                                    //       Colors.blue[600],
                                                    // ));
                                                    print("navneet");
                                                  }
                                                  print('path $value');
                                                  setState(() {
                                                    _progress = null;
                                                  });
                                                });
                                          },
                                          // icon: Icon(
                                          //   Icons.arrow_downward_sharp,
                                          //   color: Color(0xff0060AF),
                                          // )
                                          icon: Image.asset(
                                              "assets/images/Vector.png")),
                                    )
                                    // Text(
                                    //   widget.Text9[0].year
                                    //       .toString()
                                    //       .padLeft(4, '0'),
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                    // Text(
                                    //   "-${widget.Text9[0].month.toString().padLeft(2, '0')}",
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                    // Text(
                                    //   "-${widget.Text9[0].day.toString().padLeft(2, '0')}",
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.013,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ghar patti start date",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.Text9[0].year
                                              .toString()
                                              .padLeft(4, '0'),
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text9[0].month.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text9[0].day.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.028,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ghar patti start date",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                width: ScreenSize.size.width * 0.41,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.Text10[0].year
                                              .toString()
                                              .padLeft(4, '0'),
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text10[0].month.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "-${widget.Text10[0].day.toString().padLeft(2, '0')}",
                                          // snapshot
                                          //     .data!
                                          //     .response[index]
                                          //     .gala
                                          //     .galaNumber,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            // color: Color(0xff09618E),
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.016,
                        ),
                        Container(
                          width: ScreenSize.size.width * 0.81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("ghar patti document",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    // color: Color(0xff09618E),
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  )),
                              Container(
                                // color: Colors.amber,
                                // width: ScreenSize.size.width * 0.41,
                                // width: ScreenSize.size.width * 0.20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      height: 30,
                                      child: IconButton(
                                        hoverColor: Colors.transparent,
                                        // splashColor: Colors.transparent,
                                        // focusColor: Colors.transparent,
                                        iconSize: 20,
                                        onPressed: () {
                                          print(remotePDFpath1);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PDFScreen1(
                                                  path1: remotePDFpath1),
                                            ),
                                          );
                                        },
                                        icon: Image.asset(
                                            "assets/images/eye.png"),
                                        // icon: Icon(
                                        //   Icons.remove_red_eye,
                                        //   color: Color(0xff0060AF),
                                        // )
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: 30,
                                      child: IconButton(
                                          hoverColor: Colors.transparent,
                                          // splashColor: Colors.transparent,
                                          // focusColor: Colors.transparent,
                                          iconSize: 30,
                                          onPressed: () {
                                            FileDownloader.downloadFile(
                                                url:
                                                    "${AppConstants.BASE_URL}${pd1}",
                                                onProgress: (name, progress) {
                                                  setState(() {
                                                    _progress = progress;
                                                    // print(progress.toString());
                                                  });
                                                },
                                                // name: "PANDA",
                                                onDownloadCompleted: (value) {
                                                  setState(() {
                                                    data1 = value;
                                                  });
                                                  notificationServices
                                                      .Showotification(
                                                          title:
                                                              "File Downloaded",
                                                          body: "${data1}");
                                                  if (value != null) {
                                                    // ScaffoldMessenger.of(
                                                    //         context)
                                                    //     .showSnackBar(SnackBar(
                                                    //   content: Text(
                                                    //     "file downloaded - ${value}",
                                                    //     style: TextStyle(
                                                    //         color:
                                                    //             Colors.white),
                                                    //   ),
                                                    //   backgroundColor:
                                                    //       Colors.blue[600],
                                                    // ));
                                                    // print(_progress);
                                                  }
                                                  print('path $value');
                                                  setState(() {
                                                    _progress = null;
                                                  });
                                                });
                                          },
                                          icon: Image.asset(
                                              "assets/images/Vector.png")),
                                    )
                                    // Text(
                                    //   widget.Text9[0].year
                                    //       .toString()
                                    //       .padLeft(4, '0'),
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                    // Text(
                                    //   "-${widget.Text9[0].month.toString().padLeft(2, '0')}",
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                    // Text(
                                    //   "-${widget.Text9[0].day.toString().padLeft(2, '0')}",
                                    //   // snapshot
                                    //   //     .data!
                                    //   //     .response[index]
                                    //   //     .gala
                                    //   //     .galaNumber,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     // color: Color(0xff09618E),
                                    //     color: Colors.black,
                                    //     fontFamily: 'Inter',
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    //   // overflow: TextOverflow.ellipsis,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.size.height * 0.02,
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: ScreenSize.size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
