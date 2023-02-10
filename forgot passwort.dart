import 'package:flutter/material.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  late int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  TextEditingController newpassword = TextEditingController();
  TextEditingController comfirmpassword = TextEditingController();
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
                Icons.arrow_back_ios,
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
          // width: ScreenSize.size.width * 0.43,
          // color: Colors.amber,
          child: Text(
            'Reset your password',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff09618E),
              fontFamily: 'Inter',
            ),
          ),
        ),
        centerTitle: true,
        leadingWidth: 50,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.blue[100],
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
                        height: ScreenSize.size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenSize.size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.size.width * 0.70,
                                  child: Text(
                                    'We have send a four digit code on your phone/email address',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff09618E),
                                      fontFamily: 'Inter',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize.size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.size.width * 0.70,
                                  // height: ScreenSize.size.height * 0.08,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff0060AF)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      // color: Color.fromARGB(255, 247, 237, 231),
                                      color: Colors.white),
                                  // height:  ScreenSize.size.height*0.20,
                                  child: Form(
                                    // key: _formkey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "  Four digit code ",
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
                            SizedBox(
                              height: ScreenSize.size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.size.width * 0.70,
                                  // height: ScreenSize.size.height * 0.08,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff0060AF)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      // color: Color.fromARGB(255, 247, 237, 231),
                                      color: Colors.white),
                                  // height:  ScreenSize.size.height*0.20,
                                  child: Form(
                                    // key: _formkey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: newpassword,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "please enter a password";
                                            } else if (value.length < 8) {
                                              return "Please enter password minimum 8 charecter ";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "  New  password ",
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
                            SizedBox(
                              height: ScreenSize.size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.size.width * 0.70,
                                  // height: ScreenSize.size.height * 0.08,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff0060AF)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      // color: Color.fromARGB(255, 247, 237, 231),
                                      color: Colors.white),
                                  // height:  ScreenSize.size.height*0.20,
                                  child: Form(
                                    // key: _formkey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: comfirmpassword,
                                          validator: (val) {
                                            if (val!.isEmpty)
                                              return 'Please enter confrim password';
                                            if (val != newpassword.text)
                                              return 'Your password  not match';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "  Comfirm password ",
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
                                    "Reset password",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      '/Login',
                                      // (
                                      //   Route<dynamic> route,
                                      // ) =>
                                      //     false
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
