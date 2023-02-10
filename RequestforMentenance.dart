import 'package:flutter/material.dart';

class RequestMentanence extends StatefulWidget {
  const RequestMentanence({super.key});

  @override
  State<RequestMentanence> createState() => _RequestMentanenceState();
}

class _RequestMentanenceState extends State<RequestMentanence> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Container(
          width: ScreenSize.size.width * 0.43,
          // color: Colors.amber,
          child: Image.asset(
            "assets/images/omkar-logo 1.png",
          ),
        ),

        leadingWidth: 50,
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.white,
        titleSpacing: -10,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: Container(
        // color: Colors.amber,
        height: ScreenSize.size.height,
        width: ScreenSize.size.width,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenSize.size.width * 0.97,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your Name",
                          style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0060AF),
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          height: ScreenSize.size.height * 0.07,
                          width: ScreenSize.size.width * 0.96,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                                // labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))
                                // enabledBorder: UnderlineInputBorder(
                                //     borderSide: BorderSide(
                                //         color: Colors.white)),
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your Email Address",
                          style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0060AF),
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          height: ScreenSize.size.height * 0.07,
                          width: ScreenSize.size.width * 0.96,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                                // labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))
                                // enabledBorder: UnderlineInputBorder(
                                //     borderSide: BorderSide(
                                //         color: Colors.white)),
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
        ]),
      ),
    );
  }
}

//  Row(
//           Color.fromARGB(255, 180, 52, 52)    mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Your Name",
//                               style: TextStyle(
//                                 letterSpacing: 1.2,
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xff0060AF),
//                                 fontFamily: 'Inter',
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               // color: Colors.amber,
//                               height: ScreenSize.size.height * 0.07,
//                               width: ScreenSize.size.width * 0.96,
//                               child: TextFormField(
//                                 style: TextStyle(color: Colors.white),
//                                 decoration: InputDecoration(
//                                     suffixIcon: Icon(
//                                       Icons.person_outline,
//                                       color: Colors.white,
//                                     ),
//                                     // labelText: "Email",
//                                     labelStyle: TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.white,
//                                       fontFamily: 'Inter',
//                                     ),
//                                     focusedBorder: UnderlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Colors.white),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Colors.white),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.blue))
//                                     // enabledBorder: UnderlineInputBorder(
//                                     //     borderSide: BorderSide(
//                                     //         color: Colors.white)),
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
