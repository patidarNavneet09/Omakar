import 'package:flutter/material.dart';

import 'Demo/propertyfulldata.dart';
import 'Drawer.dart';
import 'model/propertyModel.dart';

class property extends StatefulWidget {
  const property({Key? key}) : super(key: key);

  @override
  State<property> createState() => _propertyState();
}

class _propertyState extends State<property> {
  late Future<Property> pro;
  var data2;
  @override
  void initState() {
    super.initState();
    pro = propertyapi();
  }

  var pass1;
  var pass2;
  var pass3;
  var pass4;
  var pass5;
  var pass6;
  var pass7;
  var pass8;
  var pass9;
  var pass10;
  var pass11;
  var pass12;
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
        title: Text('Properties ',
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
      body: Center(
        child: Container(
          width: ScreenSize.size.width * 0.99,
          child: FutureBuilder<Property>(
              future: pro,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      snapshot.data!.response.isEmpty == true
                          ? Container(
                              child:
                                  Center(child: Text("No property available")),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data!.response.length,
                              itemBuilder: (BuildContext context, int index) {
                                pd = snapshot
                                    .data!.response[index].agreementValidDoc;
                                pd1 =
                                    snapshot.data!.response[index].gharPattiDoc;
                                 
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenSize.size.height * 0.01,
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      width: ScreenSize.size.width * 0.96,
                                      // height: ScreenSize.size.height * 0.50,
                                      child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.blue,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.01,
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
                                                width: ScreenSize.size.width *
                                                    0.86,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: ScreenSize
                                                                          .size
                                                                          .width *
                                                                      0.60,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Card(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                3,
                                                                                113,
                                                                                143),
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)
                                                                                //set border radius more than 50% of height and width to make circle
                                                                                ),
                                                                            elevation:
                                                                                7,
                                                                            shadowColor:
                                                                                Colors.blue,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(3.0),
                                                                              child: Container(
                                                                                child: Text(
                                                                                  snapshot.data!.response[index].gala.warehouse.company.name,
                                                                                  style: TextStyle(
                                                                                    fontSize: 15.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    // color: Color(0xff09618E),
                                                                                    color: Color.fromARGB(255, 245, 245, 245),
                                                                                    fontFamily: 'Inter',
                                                                                  ),
                                                                                  textAlign: TextAlign.justify,
                                                                                  overflow: TextOverflow.ellipsis,
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
                                                              height: ScreenSize
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width: ScreenSize
                                                                          .size
                                                                          .width *
                                                                      0.02,
                                                                ),
                                                                Container(
                                                                  // color: Colors.green,
                                                                  width: ScreenSize
                                                                          .size
                                                                          .width *
                                                                      0.60,
                                                                  child: Text(
                                                                    "This is provide services...",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
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
                                                            width: ScreenSize
                                                                    .size
                                                                    .width *
                                                                0.20,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                // Container(
                                                                //   width: ScreenSize
                                                                //           .size.width *
                                                                //       0.03,
                                                                // ),
                                                                Container(
                                                                  width: 60,
                                                                  height: 40,
                                                                  child: Card(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            31,
                                                                            139,
                                                                            172),
                                                                    elevation:
                                                                        4,
                                                                    shadowColor:
                                                                        Colors
                                                                            .blue,
                                                                    child:
                                                                        IconButton(
                                                                      // iconSize: 06,
                                                                      onPressed:
                                                                          () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                propeertydata(
                                                                              Text1: [
                                                                                pass1
                                                                              ],
                                                                              Text2: [
                                                                                pass2
                                                                              ],
                                                                              Text3: [
                                                                                pass3
                                                                              ],
                                                                              Text4: [
                                                                                pass4
                                                                              ],
                                                                              Text5: [
                                                                                pass5
                                                                              ],
                                                                              Text6: [
                                                                                pass6
                                                                              ],
                                                                              Text7: [
                                                                                pass7
                                                                              ],
                                                                              Text8: [
                                                                                pass8
                                                                              ],
                                                                              Text9: [
                                                                                pass9
                                                                              ],
                                                                              Text10: [
                                                                                pass10
                                                                              ],
                                                                              Text11: [
                                                                                pass11
                                                                              ],
                                                                                 Text12: [
                                                                                pass12
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          pass1 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .company
                                                                              .name;
                                                                          pass2 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .owner
                                                                              .username;
                                                                          pass3 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .propertyName;
                                                                          pass4 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .propertyType;
                                                                          pass4 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .propertyType;
                                                                          pass5 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .propertyType;
                                                                          pass4 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .warehouse
                                                                              .propertyType;
                                                                          pass5 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gala
                                                                              .galaNumber;
                                                                          pass6 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .agreementType;
                                                                          pass7 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .agreementValidStartDate;
                                                                          pass8 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .agreementValidEndDate;
                                                                          pass9 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gharPattiStartDate;
                                                                          pass10 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gharPattiEndDate;
                                                                          pass11 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .agreementValidDoc;
                                                                                pass12 = snapshot
                                                                              .data!
                                                                              .response[index]
                                                                              .gharPattiDoc;
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            // color: Colors
                                                                            //     .amber,
                                                                            // width: 55,
                                                                            // height:
                                                                            //     10,
                                                                            // child: Icon(
                                                                            //     Icons
                                                                            //         .arrow_forward_ios_outlined,
                                                                            //     color: Color.fromARGB(
                                                                            //         255,
                                                                            //         58,
                                                                            //         165,
                                                                            //         232)),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "view",
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w800,
                                                                                  // color: Color(0xff09618E),
                                                                                  color: Color.fromARGB(255, 237, 225, 225),
                                                                                  fontFamily: 'Inter',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            // child: Image
                                                                            //     .asset(
                                                                            //         "assets/images/icons8-property-64.png"),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.020,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.84,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Divider(
                                                      color: Color.fromARGB(
                                                          255, 139, 133, 133),
                                                      thickness: 2,
                                                      indent: 1,
                                                      endIndent: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.023,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.81,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Details",
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          // color: Color(0xff09618E),
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.023,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.81,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("User Name",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          // color: Color(0xff09618E),
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        )),
                                                    Container(
                                                      // color: Colors.amber,
                                                      width: ScreenSize
                                                              .size.width *
                                                          0.41,
                                                      child: SelectableText(
                                                        snapshot
                                                            .data!
                                                            .response[index]
                                                            .owner
                                                            .username,
                                                        style: TextStyle(
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            // color: Color(0xff09618E),
                                                            color: Colors.black,
                                                            fontFamily: 'Inter',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        textAlign:
                                                            TextAlign.right,
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
                                                height: ScreenSize.size.height *
                                                    0.023,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.81,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Property Name",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          // color: Color(0xff09618E),
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        )),
                                                    Container(
                                                      // color: Colors.amber,
                                                      width: ScreenSize
                                                              .size.width *
                                                          0.41,
                                                      child: SelectableText(
                                                        snapshot
                                                            .data!
                                                            .response[index]
                                                            .gala
                                                            .warehouse
                                                            .propertyName,
                                                        style: TextStyle(
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            // color: Color(0xff09618E),
                                                            color: Colors.black,
                                                            fontFamily: 'Inter',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        textAlign:
                                                            TextAlign.right,
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
                                                height: ScreenSize.size.height *
                                                    0.023,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.81,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Property Type",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          // color: Color(0xff09618E),
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        )),
                                                    Container(
                                                      // color: Colors.amber,
                                                      width: ScreenSize
                                                              .size.width *
                                                          0.41,
                                                      child: SelectableText(
                                                        snapshot
                                                            .data!
                                                            .response[index]
                                                            .gala
                                                            .warehouse
                                                            .propertyType,
                                                        style: TextStyle(
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            // color: Color(0xff09618E),
                                                            color: Colors.black,
                                                            fontFamily: 'Inter',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        textAlign:
                                                            TextAlign.right,
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
                                                height: ScreenSize.size.height *
                                                    0.023,
                                              ),
                                              Container(
                                                width: ScreenSize.size.width *
                                                    0.81,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Gala Number",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          // color: Color(0xff09618E),
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        )),
                                                    Container(
                                                      // color: Colors.amber,
                                                      width: ScreenSize
                                                              .size.width *
                                                          0.41,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SelectableText(
                                                            snapshot
                                                                .data!
                                                                .response[index]
                                                                .gala
                                                                .galaNumber,
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              // color: Color(0xff09618E),
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Inter',
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            // overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenSize.size.height *
                                                    0.02,
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                );
                              }),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
