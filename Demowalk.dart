import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omkar_development/HomePage.dart';
import 'package:omkar_development/login2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class walk extends StatefulWidget {
  const walk({super.key});

  @override
  State<walk> createState() => _walkState();
}

bool? seen21;

class _walkState extends State<walk> {
  final Image1 = [
    Image.asset("assets/images/omkar12 1.png"),
    Image.asset("assets/images/omkar12 1.png"),
    Image.asset("assets/images/omkar12 1.png")
  ];
  final TextUri1 = [
    'When do you need a textual warehouse',
    "Why do you build a textual warehouse?",
    "Ingredients of construction",
  ];
  final TextUri = [
    'For small organizations and startups, they can probably do without a textual warehouse. But at some point, in time, the volume of information to be managed starts to become overwhelming. When an organization reaches the point where they need textual documents to run their business properly and cannot find those documents easily and efficiently, they need a textual warehouse.',
    'The second reason is obvious and the ultimate purpose. The first reason is related to cross-referecing the source of the data and text captured in the textual warehouse. So, the source document reference might be needed for various obvious reasons, like contracts, agreements, court hearingsand medical transcriptions.',
    'The words and phrases that are important to the business form the basis for the design of the textual warehouse. To the database designer who does classical database design, it seems odd that there is no mention or even a reference to processes in the design of the text warehouse. Indeed, the textual warehouse design is very different from classical database design. ',
  ];
  late int selectedRadio;

  final controller = CarouselController();

  bool isLastPage = false;
  int activeIndex = 0;
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    navigateUser1();
    selectedRadio = 0;
    _controller = PageController(initialPage: 0);
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void startTimer() {
    Timer(Duration(seconds: 0), () {
      navigateUser1(); //It will redirect  after 3 seconds
    });
  }

  // void navigateUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var status = prefs.getBool('isLoggedIn') ?? false;
  //   print(status);
  //   if (status) {
  //     Navigator.pushReplacementNamed(context, '/Drawer');
  //   } else {
  //     Navigator.pushReplacementNamed(context, "/Login");
  //   }
  // }
  void navigateUser1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    String? val = prefs.getString("login");
    print("sadfasfasdf${val}");
    if (val != null) {
      var data1;
      Navigator.pushReplacementNamed(context, '/Drawer');
    }
    //  else {
    //   Navigator.pushReplacementNamed(context, "/welcome");
    // }
  }

  @override
  Widget build(BuildContext context) {
    print("fsdfs");

    var ScreenSize = MediaQuery.of(context);
    var queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false, // this is new
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/omkar-logo 1.png",
        ),
        leadingWidth: ScreenSize.size.width,
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: ScreenSize.size.width * 0.20,
                // color: Colors.amber,
                child: currentIndex == activeIndex - 2
                    ? Container(
                        child: Text(""),
                      )
                    : TextButton(
                        // style: ElevatedButton.styleFrom(
                        //     primary: Color(0xff0060AF),
                        //     // side:
                        //     //     BorderSide(color: Colors.white, width: 1),
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.circular(2.0))),
                        child:
                            Text(currentIndex == activeIndex - 2 ? " " : "Skip",
                                style: TextStyle(
                                  fontSize: queryData.size.width * 0.034,
                                  fontWeight: FontWeight.bold,
                                  // color: Color(0xff09618E),
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                )),
                        onPressed: () {
                          // Navigator.popAndPushNamed(
                          //     context, '/Login');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login2()),
                            (Route<dynamic> route) => false,
                          );
                          // Navigator.pushNamed(context, '/Login');
                        },
                        // onPressed: () => controller
                        //     .jumpToPage(activeIndex =
                        //         activeIndex + 2),
                      )),
            SizedBox(
              // color: Colors.amber,
              height: ScreenSize.size.height * 0.03,
              width: ScreenSize.size.width * 0.22,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [buildIndicator()],
                  ),
                ],
              ),
            ),
            Container(
                width: ScreenSize.size.width * 0.20,
                child: TextButton(
                  child: Text(
                    currentIndex == activeIndex - 2 ? "Get start" : "Next",
                    style: TextStyle(
                      fontSize: queryData.size.width * 0.034,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xff09618E),
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                  onPressed: () async {
                    if (currentIndex == activeIndex - 2) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login2()),
                        (Route<dynamic> route) => false,
                      );

                      // Navigator.pushNamed(context, '/Login');
                    }
                    next();
                  },
                ))
          ],
        ),
      ),
      body: Container(
        // color: Colors.amber,
        width: ScreenSize.size.width,
        height: ScreenSize.size.height,
        child: CarouselSlider.builder(
          itemCount: TextUri.length,
          itemBuilder: ((context, index, realIndex) {
            final Image = Image1[index];
            final Text1 = TextUri1[index];
            final Text = TextUri[index];
            return buildImage(TextUri[index], index);
          }),
          carouselController: controller,
          options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1,
              pageSnapping: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
              height: ScreenSize.size.height * 0.75,
              enlargeCenterPage: true,
              reverse: false),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    var queryData = MediaQuery.of(context);
    var ScreenSize = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // color: Colors.green,
              // height: ScreenSize.size.height * 0.27,
              width: ScreenSize.size.width * 0.96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: ScreenSize.size.width * 0.96, child: Image1[index])
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.size.height * 0.02,
            ),
            Container(
              // color: Colors.red,
              // height: ScreenSize.size.height * 0.11,
              width: ScreenSize.size.width * 0.77,
              child: Text(
                TextUri1[index],
                style: TextStyle(
                  fontSize: queryData.size.height * 0.034,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0161AF),
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: ScreenSize.size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.blue,
                  // height: ScreenSize.s,
                  width: ScreenSize.size.width * 0.96,
                  child: Text(
                    TextUri[index],
                    style: TextStyle(
                      fontSize: queryData.size.height * 0.025,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: (index) => controller.animateToPage(index),
        activeIndex: activeIndex,
        count: 3,
        effect: JumpingDotEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Color(0xff0060AF),
            dotColor: Color.fromARGB(255, 176, 206, 231)),
      );
  void animateToSlide(index) => controller.animateToPage(index);
  void next() =>
      controller.nextPage(duration: const Duration(microseconds: 500));

  void previous() {}
}
