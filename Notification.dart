import 'dart:ui';

import 'package:flutter/material.dart';

import 'Drawer.dart';
import 'model/notificationModel.dart';
// import 'package:flutter_application_changesnew2/Drawer.dart';

class NOtification extends StatefulWidget {
  const NOtification({Key? key}) : super(key: key);

  @override
  State<NOtification> createState() => _NOtificationState();
}

class _NOtificationState extends State<NOtification> {
  late Future<Notificarion> notifi;
  @override
  void initState() {
    super.initState();
    notifi = notifiApi();
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Drawer1()));
                },
              );
            },
          ),
          // centerTitle: true,
          title: Text('Notification',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                // color: Color(0xff09618E),
                color: Colors.black,
                fontFamily: 'Inter',
              )),

          // leadingWidth: 50,
          backgroundColor: Color(0XFFD9D9D9),
          elevation: 1,
          // foregroundColor: Colors.white,
          // titleSpacing: -10,
          // actions: [Image.asset("assets/images/Ellipse 27.png")],
        ),
        body: Center(
          child: Container(
            width: ScreenSize.size.width * 0.98,
            child: FutureBuilder<Notificarion>(
                future: notifi,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        snapshot.data!.response.isEmpty == true
                            ? Container(
                                child: Center(
                                    child: Text("No notification available")),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data!.response.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    // color: Colors.green,
                                    width: ScreenSize.size.width * 0.97,
                                    // padding: EdgeInsets.symmetric(
                                    //   horizontal: 5.0,
                                    // ),
                                    child: Card(
                                      elevation: 3,
                                      shadowColor: Colors.blue,
                                      child: Container(
                                        width: ScreenSize.size.width * 0.60,
                                        height: ScreenSize.size.height * 0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(snapshot.data!
                                                    .response[index].getStatus)
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(snapshot
                                                    .data!
                                                    .response[index]
                                                    .getDateTime)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        )
        // : Center(child: Text('Loading...'))
        );
  }
}
