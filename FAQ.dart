import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import 'Drawer.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFFD9D9D9),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => Drawer1(), maintainState: false),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            // color: Color(0xff09618E),
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
        elevation: 1,
        title: Text('FAQ',
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w700,
              // color: Color(0xff09618E),
              color: Colors.black,
            )),
      ),
      // body: Center(
      //   child: ListView.builder(
      //       itemCount: 1,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Column(children: [
      //               GFAccordion(
      //                 collapsedIcon: Icon(
      //                   Icons.keyboard_arrow_down_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 expandedIcon: Icon(
      //                   Icons.keyboard_arrow_up,
      //                   color: Colors.white,
      //                 ),
      //                 titleBorderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(6),
      //                   topRight: Radius.circular(6),
      //                   bottomLeft: Radius.circular(0),
      //                   bottomRight: Radius.circular(0),
      //                 ),
      //                 contentBorderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 // contentBorderRadius: BorderRadius.circular(3),
      //                 collapsedTitleBackgroundColor:
      //                     Color.fromARGB(255, 121, 178, 225),
      //                 expandedTitleBackgroundColor:
      //                     Color.fromARGB(255, 90, 159, 216),
      //                 contentBackgroundColor:
      //                     Color.fromARGB(255, 172, 206, 233),
      //                 title:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
      //                 textStyle: TextStyle(color: Colors.white),
      //                 content:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
      //               ),
      //               GFAccordion(
      //                 collapsedIcon: Icon(
      //                   Icons.keyboard_arrow_down_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 expandedIcon: Icon(
      //                   Icons.keyboard_arrow_up,
      //                   color: Colors.white,
      //                 ),
      //                 titleBorderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(6),
      //                   topRight: Radius.circular(6),
      //                   bottomLeft: Radius.circular(0),
      //                   bottomRight: Radius.circular(0),
      //                 ),
      //                 contentBorderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 // contentBorderRadius: BorderRadius.circular(3),
      //                 collapsedTitleBackgroundColor:
      //                     Color.fromARGB(255, 121, 178, 225),
      //                 expandedTitleBackgroundColor:
      //                     Color.fromARGB(255, 90, 159, 216),
      //                 contentBackgroundColor:
      //                     Color.fromARGB(255, 172, 206, 233),
      //                 title:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
      //                 textStyle: TextStyle(color: Colors.white),
      //                 content:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
      //               ),
      //               GFAccordion(
      //                 collapsedIcon: Icon(
      //                   Icons.keyboard_arrow_down_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 expandedIcon: Icon(
      //                   Icons.keyboard_arrow_up,
      //                   color: Colors.white,
      //                 ),
      //                 titleBorderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(6),
      //                   topRight: Radius.circular(6),
      //                   bottomLeft: Radius.circular(0),
      //                   bottomRight: Radius.circular(0),
      //                 ),
      //                 contentBorderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 // contentBorderRadius: BorderRadius.circular(3),
      //                 collapsedTitleBackgroundColor:
      //                     Color.fromARGB(255, 121, 178, 225),
      //                 expandedTitleBackgroundColor:
      //                     Color.fromARGB(255, 90, 159, 216),
      //                 contentBackgroundColor:
      //                     Color.fromARGB(255, 172, 206, 233),
      //                 title:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
      //                 textStyle: TextStyle(color: Colors.white),
      //                 content:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
      //               ),
      //               GFAccordion(
      //                 collapsedIcon: Icon(
      //                   Icons.keyboard_arrow_down_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 expandedIcon: Icon(
      //                   Icons.keyboard_arrow_up,
      //                   color: Colors.white,
      //                 ),
      //                 titleBorderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(6),
      //                   topRight: Radius.circular(6),
      //                   bottomLeft: Radius.circular(0),
      //                   bottomRight: Radius.circular(0),
      //                 ),
      //                 contentBorderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 // contentBorderRadius: BorderRadius.circular(3),
      //                 collapsedTitleBackgroundColor:
      //                     Color.fromARGB(255, 121, 178, 225),
      //                 expandedTitleBackgroundColor:
      //                     Color.fromARGB(255, 90, 159, 216),
      //                 contentBackgroundColor:
      //                     Color.fromARGB(255, 172, 206, 233),
      //                 title:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
      //                 textStyle: TextStyle(color: Colors.white),
      //                 content:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
      //               ),
      //               GFAccordion(
      //                 collapsedIcon: Icon(
      //                   Icons.keyboard_arrow_down_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 expandedIcon: Icon(
      //                   Icons.keyboard_arrow_up,
      //                   color: Colors.white,
      //                 ),
      //                 titleBorderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(6),
      //                   topRight: Radius.circular(6),
      //                   bottomLeft: Radius.circular(0),
      //                   bottomRight: Radius.circular(0),
      //                 ),
      //                 contentBorderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 // contentBorderRadius: BorderRadius.circular(3),
      //                 collapsedTitleBackgroundColor:
      //                     Color.fromARGB(255, 121, 178, 225),
      //                 expandedTitleBackgroundColor:
      //                     Color.fromARGB(255, 90, 159, 216),
      //                 contentBackgroundColor:
      //                     Color.fromARGB(255, 172, 206, 233),
      //                 title:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
      //                 textStyle: TextStyle(color: Colors.white),
      //                 content:
      //                     "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
      //               ),
      //             ]));
      //       }),
      // ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ScreenSize.size.height,
              width: ScreenSize.size.width,
              // color: Colors.amber,
              child: Center(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         width: ScreenSize.size.width,
                        //         // color: Colors.amber,
                        //         height: ScreenSize.size.height / 3,
                        //         child: Image.asset(
                        //           "assets/images/lorries-outside-a-large-warehouse 2 (1).png",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        GFAccordion(
                       
                          collapsedIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          expandedIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          titleBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          contentBorderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          // contentBorderRadius: BorderRadius.circular(3),
                          collapsedTitleBackgroundColor:
                              Color.fromARGB(255, 121, 178, 225),
                          expandedTitleBackgroundColor:
                              Color.fromARGB(255, 90, 159, 216),
                          contentBackgroundColor:
                              Color.fromARGB(255, 172, 206, 233),
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
                          textStyle: TextStyle(color: Colors.white),
                          content:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
                        ),
                        GFAccordion(
                          collapsedIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          expandedIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          titleBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          contentBorderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          // contentBorderRadius: BorderRadius.circular(3),
                          collapsedTitleBackgroundColor:
                              Color.fromARGB(255, 121, 178, 225),
                          expandedTitleBackgroundColor:
                              Color.fromARGB(255, 90, 159, 216),
                          contentBackgroundColor:
                              Color.fromARGB(255, 172, 206, 233),
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
                          textStyle: TextStyle(color: Colors.white),
                          content:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
                        ),
                        GFAccordion(
                          collapsedIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          expandedIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          titleBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          contentBorderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          // contentBorderRadius: BorderRadius.circular(3),
                          collapsedTitleBackgroundColor:
                              Color.fromARGB(255, 121, 178, 225),
                          expandedTitleBackgroundColor:
                              Color.fromARGB(255, 90, 159, 216),
                          contentBackgroundColor:
                              Color.fromARGB(255, 172, 206, 233),
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
                          textStyle: TextStyle(color: Colors.white),
                          content:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
                        ),
                        GFAccordion(
                          collapsedIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          expandedIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          titleBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          contentBorderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          // contentBorderRadius: BorderRadius.circular(3),
                          collapsedTitleBackgroundColor:
                              Color.fromARGB(255, 121, 178, 225),
                          expandedTitleBackgroundColor:
                              Color.fromARGB(255, 90, 159, 216),
                          contentBackgroundColor:
                              Color.fromARGB(255, 172, 206, 233),
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
                          textStyle: TextStyle(color: Colors.white),
                          content:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
                        ),
                        GFAccordion(
                          collapsedIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          expandedIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          titleBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          contentBorderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          // contentBorderRadius: BorderRadius.circular(3),
                          collapsedTitleBackgroundColor:
                              Color.fromARGB(255, 121, 178, 225),
                          expandedTitleBackgroundColor:
                              Color.fromARGB(255, 90, 159, 216),
                          contentBackgroundColor:
                              Color.fromARGB(255, 172, 206, 233),
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry?",
                          textStyle: TextStyle(color: Colors.white),
                          content:
                              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic type setting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..",
                        ),
                      ]);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
