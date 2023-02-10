import 'package:flutter/material.dart';
import 'package:omkar_development/servicerequest/serviceRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/TrakingIdModel.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late int selectedRadio;
  var trac;
  late Future<Traking?> status;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    checkLogin1();
    status = SecurityApi4();
    // status = SecurityApi3(id2);
  }

  var user1;
  var data1;

  var id;
  var name;
  var sname;
  var date1;
  var gnum1;
  var descri;
  var stat;
  var satat1;
  void checkLogin1() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val1 = perf.getString("popup1");
    String? val2 = perf.getString("popup2");
    String? val3 = perf.getString("popup3");
    String? val4 = perf.getString("popup4");

    String? val5 = perf.getString("popup5");
    String? val6 = perf.getString("popup6");
    String? val7 = perf.getString("popup7");
    String? val8 = perf.getString("popup8");
    // perf.clear();
    setState(() {
      id = val1;
      name = val2;
      sname = val3;
      gnum1 = val4;
      date1 = val5;
      descri = val6;
      stat = val7;
      satat1 = val8;
    });
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

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                // color: Color(0xff09618E),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // centerTitle: true,
        title: Text("Application Status",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              // color: Color(0xff09618E),
              color: Colors.black,
              fontFamily: 'bold',
            )),

        // leadingWidth: 50,
        backgroundColor: Color(0XFFD9D9D9),
        elevation: 1,
        // foregroundColor: Colors.white,
        // titleSpacing: -10,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: Center(
          child:
              // initialData: true,

              SingleChildScrollView(
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
              shadowColor: Colors.blue[300],
              child: Container(
                width: ScreenSize.size.width * 0.97,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenSize.size.height * 0.00,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 105, 167, 191),
                                color: Color(0xffBBD6EC),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0))),
                            width: ScreenSize.size.width * 0.97,
                            // color: Color.fromARGB(255, 106, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: ScreenSize.size.height * 0.08,
                                      width: ScreenSize.size.width * 0.14,
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                      // child: Image.asset(
                                      //     'assets/images/ic_launcher(1).png')
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Application Id",
                                          style: TextStyle(
                                            letterSpacing: 1.2,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SelectableText(
                                          "${id}",
                                          style: TextStyle(
                                            letterSpacing: 1.2,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: ScreenSize.size.height * 0.01,
                          // ),
                        ],
                      ),

                      // Text(
                    ]),
                    // SizedBox(
                    //   height: ScreenSize.size.height * 0.01,
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.size.height * 0.02,
            ),
            Card(
              // insetPadding: EdgeInsets.fromLTRB(5, 30, 5, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              elevation: 20,
              shadowColor: Colors.blue[300],
              child: Container(
                width: ScreenSize.size.width,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenSize.size.height * 0.00,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0))),
                            width: ScreenSize.size.width * 0.94,
                            // color: Color.fromARGB(255, 106, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // color: Colors.green,
                                      height: ScreenSize.size.height * 0.04,
                                      width: ScreenSize.size.width * 0.80,
                                      child: Text(
                                        "User Name",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      // child: TextFormField(
                                      //   decoration: const InputDecoration(
                                      //     border: UnderlineInputBorder(),
                                      //     labelText: 'Service Name',
                                      //   ),
                                      // ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: ScreenSize.size.height * 0.03,
                                      width: ScreenSize.size.width * 0.80,
                                      child: Text(
                                        "${name}",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      // child: TextFormField(
                                      //   decoration: const InputDecoration(
                                      //     border: UnderlineInputBorder(),
                                      //     labelText: 'Service Name',
                                      //   ),
                                      // ),
                                    ),
                                    Container(
                                      width: ScreenSize.size.width * 0.85,
                                      child: Row(
                                        children: [
                                          IntrinsicWidth(
                                            // stepWidth: 160,
                                            stepHeight:
                                                ScreenSize.size.height * 0.001,
                                            stepWidth:
                                                ScreenSize.size.width * 0.85,
                                            child: Divider(
                                              color: Color(0XFF626262),
                                              thickness: 2,
                                              indent: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   height: ScreenSize.size.height * 0.08,
                                    //   width: ScreenSize.size.width * 0.80,
                                    //   child: DateTimePicker(
                                    //     initialValue: '',
                                    //     firstDate: DateTime(2000),
                                    //     lastDate: DateTime(2100),
                                    //     dateLabelText: 'Date of application',
                                    //     onChanged: (val) => print(val),
                                    //     validator: (val) {
                                    //       print(val);
                                    //       return null;
                                    //     },
                                    //     onSaved: (val) => print(val),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   // color: Colors.green,
                                      //   height: ScreenSize.size.height * 0.04,
                                      //   width: ScreenSize.size.width * 0.80,
                                      //   child: Text(
                                      //     "User Name",
                                      //     style: TextStyle(
                                      //       fontSize: 13.0,
                                      //       fontWeight: FontWeight.w400,
                                      //       color: Colors.black,
                                      //       fontFamily: 'Inter',
                                      //     ),
                                      //   ),
                                      //   // child: TextFormField(
                                      //   //   decoration: const InputDecoration(
                                      //   //     border: UnderlineInputBorder(),
                                      //   //     labelText: 'Service Name',
                                      //   //   ),
                                      //   // ),
                                      // ),
                                      // Container(
                                      //   // color: Colors.amber,
                                      //   height: ScreenSize.size.height * 0.03,
                                      //   width: ScreenSize.size.width * 0.80,
                                      //   child: Text(
                                      //     "${name}",
                                      //     style: TextStyle(
                                      //       fontSize: 13.0,
                                      //       fontWeight: FontWeight.w400,
                                      //       color: Colors.black,
                                      //       fontFamily: 'Inter',
                                      //     ),
                                      //   ),
                                      //   // child: TextFormField(
                                      //   //   decoration: const InputDecoration(
                                      //   //     border: UnderlineInputBorder(),
                                      //   //     labelText: 'Service Name',
                                      //   //   ),
                                      //   // ),
                                      // ),
                                      // Container(
                                      //   width: ScreenSize.size.width * 0.85,
                                      //   child: Row(
                                      //     children: [
                                      //       IntrinsicWidth(
                                      //         // stepWidth: 160,
                                      //         stepHeight:
                                      //             ScreenSize.size.height *
                                      //                 0.001,
                                      //         stepWidth:
                                      //             ScreenSize.size.width * 0.85,
                                      //         child: Divider(
                                      //           color: Color(0XFF626262),
                                      //           thickness: 2,
                                      //           indent: 10,
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      Container(
                                        // color: Colors.green,
                                        height: ScreenSize.size.height * 0.04,
                                        width: ScreenSize.size.width * 0.80,
                                        child: Text(
                                          "Services Name",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        // child: TextFormField(
                                        //   decoration: const InputDecoration(
                                        //     border: UnderlineInputBorder(),
                                        //     labelText: 'Service Name',
                                        //   ),
                                        // ),
                                      ),
                                      Container(
                                        // color: Colors.amber,
                                        height: ScreenSize.size.height * 0.03,
                                        width: ScreenSize.size.width * 0.80,
                                        child: Text(
                                          "${sname}",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        // child: TextFormField(
                                        //   decoration: const InputDecoration(
                                        //     border: UnderlineInputBorder(),
                                        //     labelText: 'Service Name',
                                        //   ),
                                        // ),
                                      ),
                                      Container(
                                        width: ScreenSize.size.width * 0.85,
                                        child: Row(
                                          children: [
                                            IntrinsicWidth(
                                              // stepWidth: 160,
                                              stepHeight:
                                                  ScreenSize.size.height *
                                                      0.041,
                                              stepWidth:
                                                  ScreenSize.size.width * 0.85,
                                              child: Divider(
                                                color: Color(0XFF626262),
                                                thickness: 2,
                                                indent: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                // color: Colors.green,
                                height: ScreenSize.size.height * 0.041,
                                width: ScreenSize.size.width * 0.80,
                                child: Text(
                                  "Date of Application",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                // child: TextFormField(
                                //   decoration: const InputDecoration(
                                //     border: UnderlineInputBorder(),
                                //     labelText: 'Service Name',
                                //   ),
                                // ),
                              ),
                              Container(
                                // color: Colors.amber,
                                height: ScreenSize.size.height * 0.041,
                                width: ScreenSize.size.width * 0.80,
                                child: Row(
                                  children: [
                                    Text(
                                      "${date1}",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${descri}",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                                // child: TextFormField(
                                //   decoration: const InputDecoration(
                                //     border: UnderlineInputBorder(),
                                //     labelText: 'Service Name',
                                //   ),
                                // ),
                              ),
                              Container(
                                width: ScreenSize.size.width * 0.85,
                                child: Row(
                                  children: [
                                    IntrinsicWidth(
                                      // stepWidth: 160,
                                      stepHeight:
                                          ScreenSize.size.height * 0.001,
                                      stepWidth: ScreenSize.size.width * 0.85,
                                      child: Divider(
                                        color: Color(0XFF626262),
                                        thickness: 2,
                                        indent: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   height: ScreenSize.size.height * 0.08,
                              //   width: ScreenSize.size.width * 0.80,
                              //   child: DateTimePicker(
                              //     initialValue: '',
                              //     firstDate: DateTime(2000),
                              //     lastDate: DateTime(2100),
                              //     dateLabelText: 'Date of application',
                              //     onChanged: (val) => print(val),
                              //     validator: (val) {
                              //       print(val);
                              //       return null;
                              //     },
                              //     onSaved: (val) => print(val),
                              //   ),
                              // ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Colors.green,
                                      height: ScreenSize.size.height * 0.041,
                                      width: ScreenSize.size.width * 0.80,
                                      child: Text(
                                        "Gala Number",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      // child: TextFormField(
                                      //   decoration: const InputDecoration(
                                      //     border: UnderlineInputBorder(),
                                      //     labelText: 'Service Name',
                                      //   ),
                                      // ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: ScreenSize.size.height * 0.03,
                                      width: ScreenSize.size.width * 0.80,
                                      child: Text(
                                        "${gnum1}",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      // child: TextFormField(
                                      //   decoration: const InputDecoration(
                                      //     border: UnderlineInputBorder(),
                                      //     labelText: 'Service Name',
                                      //   ),
                                      // ),
                                    ),
                                    Container(
                                      width: ScreenSize.size.width * 0.85,
                                      child: Row(
                                        children: [
                                          IntrinsicWidth(
                                            // stepWidth: 160,
                                            stepHeight:
                                                ScreenSize.size.height * 0.001,
                                            stepWidth:
                                                ScreenSize.size.width * 0.85,
                                            child: Divider(
                                              color: Color(0XFF626262),
                                              thickness: 2,
                                              indent: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // child: Container(
                                //   height: ScreenSize.size.height * 0.08,
                                //   width: ScreenSize.size.width * 0.80,
                                //   child: TextFormField(
                                //     decoration: const InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Gala Number',
                                //     ),
                                //   ),
                                // )
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.04,
                                    width: ScreenSize.size.width * 0.80,
                                    child: Text(
                                      "Application Current Status",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    // child: TextFormField(
                                    //   decoration: const InputDecoration(
                                    //     border: UnderlineInputBorder(),
                                    //     labelText: 'Service Name',
                                    //   ),
                                    // ),
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    height: ScreenSize.size.height * 0.03,
                                    width: ScreenSize.size.width * 0.80,
                                    child: Text(
                                      "${satat1}",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    // child: TextFormField(
                                    //   decoration: const InputDecoration(
                                    //     border: UnderlineInputBorder(),
                                    //     labelText: 'Service Name',
                                    //   ),
                                    // ),
                                  ),
                                  Container(
                                    width: ScreenSize.size.width * 0.85,
                                    child: Row(
                                      children: [
                                        IntrinsicWidth(
                                          // stepWidth: 160,
                                          stepHeight:
                                              ScreenSize.size.height * 0.001,
                                          stepWidth:
                                              ScreenSize.size.width * 0.85,
                                          child: Divider(
                                            color: Color(0XFF626262),
                                            thickness: 2,
                                            indent: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: ScreenSize.size.width * 0.80,
                                    height: ScreenSize.size.height * 0.042,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Remark",
                                          style: TextStyle(
                                            letterSpacing: 1.2,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenSize.size.height * 0.01,
                                  ),
                                  Container(
                                    width: ScreenSize.size.width * 0.80,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: ScreenSize.size.width * 0.80,
                                          child: Text(
                                            "${stat}",
                                            style: TextStyle(
                                              letterSpacing: 1.2,
                                              fontSize: 13.0,
                                              // fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              // fontFamily: 'Inter',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.size.height * 0.01,
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: ScreenSize.size.height * 0.01,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(29, 0, 29, 9),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Remark",
                    //         style: TextStyle(
                    //           letterSpacing: 1.2,
                    //           fontSize: 13.0,
                    //           fontWeight: FontWeight.w700,
                    //           color: Colors.black,
                    //           fontFamily: 'Inter',
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(29, 2, 29, 5),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: ScreenSize.size.width * 0.83,
                    //         child: Text(
                    //           "${stat}",
                    //           style: TextStyle(
                    //             letterSpacing: 1.2,
                    //             fontSize: 13.0,
                    //             // fontWeight: FontWeight.w700,
                    //             color: Colors.black,
                    //             // fontFamily: 'Inter',
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.031,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
