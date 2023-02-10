import 'package:flutter/material.dart';
import 'forgot passwort.dart';

class forgot1 extends StatefulWidget {
  const forgot1({super.key});
  @override
  State<forgot1> createState() => _forgot1State();
}

class _forgot1State extends State<forgot1> {
  @override
  void initState() {
    super.initState();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff09618E),
              ),
              onPressed: () {
                // Scaffold.of(context).openDrawer();
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Container(
          child: Text(
            'Forgot password',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff09618E),
              fontFamily: 'Inter',
            ),
          ),
        ),
        // centerTitle: true,
        leadingWidth: 50,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.size.height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.blue[100],
                // insetPadding: EdgeInsets.fromLTRB(13, 133, 10, 145),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 10,
                child: SizedBox(
                  width: ScreenSize.size.width,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ScreenSize.size.width * 0.70,
                        height: ScreenSize.size.height * 0.20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenSize.size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Its okay! Reset your password',
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff09618E),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize.size.height * 0.04,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.size.width * 0.70,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff0060AF)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      color: Colors.white),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            hintText:
                                                "  Enter your Email/Phone number ",
                                            hintStyle: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff818181),
                                              fontFamily:
                                                  'Montserrat Alternates',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff0060AF),
                                      // side:
                                      //     BorderSide(color: Colors.white, width: 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0))),
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => forgot(),
                                      ),
                                    );
                                  },
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
