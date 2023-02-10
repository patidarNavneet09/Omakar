import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../Drawer.dart';

class Updateprofile2 extends StatefulWidget {
  const Updateprofile2({super.key});

  @override
  State<Updateprofile2> createState() => _Updateprofile2State();
}

class _Updateprofile2State extends State<Updateprofile2> {
  File? image;
  File? selectedImage1;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String base64Image = "";

  Future getImage() async {
    final PickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (PickedFile != null) {
      image = File(PickedFile.path);
    } else {
      print("No image selected");
    }
  }

  Future<void> chooseImage1(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    print("dfasdjfkla;dsjfa${selectedImage1}");
    if (image != null) {
      setState(() {
        selectedImage1 = File(image.path);

        base64Image = base64Encode(selectedImage1!.readAsBytesSync());
      });
    }
  }

  Future<void> uploadImage() async {
    var stream = http.ByteStream(selectedImage1!.openRead());
    stream.cast();

    var length = await selectedImage1!.length();

    var uri = Uri.parse("http/");

    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title";
    var multiport = new http.MultipartFile('image', stream, length);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('image upload');
    } else {
      print("faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var ScreenSize = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0XFFD9D9D9),
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
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Drawer1(), maintainState: false),
                // );
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Drawer1()),
                // );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          ' Edit Profile',
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
            // color: Color(0xff09618E),
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
        // actions: [
        //   Container(
        //     width: 90,
        //     child: IconButton(
        //       icon: Text(
        //         "Edit Profile",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 14,
        //             fontWeight: FontWeight.w600),
        //       ),
        //       iconSize: 10,
        //       onPressed: () {},
        //     ),
        //   )
        // ],
      ),
      body: Center(
          child: Container(
        // color: Colors.amber,
        height: ScreenSize.size.height,
        width: ScreenSize.size.width,
        // ignore: sort_child_properties_last
        child: ListView(scrollDirection: Axis.vertical, children: [
          SizedBox(
            height: ScreenSize.size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.amber,
                // width: ScreenSize.size.width * 0.30,
                child: Column(
                  children: [
                    // CircleAvatar(
                    //     backgroundColor: Color.fromARGB(255, 234, 208, 131),
                    //     radius: 50,
                    //     child: image == null
                    //         ? Icon(Icons.person)
                    //         : Container(
                    //             child: Center(
                    //               child: Image.file(
                    //                 File(image!.path).absolute,
                    //                 height: 100,
                    //                 width: 100,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           )),
                    GestureDetector(
                      onTap: () {
                        chooseImage1("Gallery");
                      },
                      child: Stack(
                        children: [
                          Container(
                            // color: Colors.amber,
                            height: 115,
                            child: CircleAvatar(
                              radius: 50,
                              // backgroundColor: Color.fromARGB(255, 234, 208, 131),

                              // height: ScreenSize.size.height * 0.18,
                              // width: ScreenSize.size.width * 0.28,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     // color: Color.fromARGB(255, 247, 237, 231),
                              //     color: Colors.grey[300]),
                              child: selectedImage1 != null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: Image.file(
                                        selectedImage1!,
                                        fit: BoxFit.cover,
                                      ).image,
                                    )
                                  : Container(
                                      child: IconButton(
                                          onPressed: () {
                                            chooseImage1("Gallery");
                                          },
                                          icon: Icon(Icons.person),
                                          iconSize: 40,
                                          color: Colors.white),
                                    ),
                            ),
                          ),
                          Container(
                            height: ScreenSize.size.height * 0.16,
                            width: 100,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenSize.size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.amber,
                width: ScreenSize.size.width * 0.89,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ScreenSize.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Name   : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 73, 150, 188),
                            fontFamily: 'Inter',
                          ),
                        ),
                        // SizedBox(
                        //   // color: Colors.green,
                        //   width: ScreenSize.size.width * 0.60,
                        //   // height: ScreenSize.size.height * 0.08,
                        //   child: TextFormField(
                        //     textInputAction: TextInputAction.next,
                        //     autovalidateMode:
                        //         AutovalidateMode.onUserInteraction,
                        //     validator: (value) {
                        //       if (value == null ||
                        //           value.isEmpty ||
                        //           !RegExp(r'^[a-z,A-Z]+$').hasMatch(value)) {
                        //         return "Enter your first name";
                        //       }
                        //       return null;
                        //     },
                        //     // autovalidateMode:
                        //     //     AutovalidateMode.onUserInteraction,
                        //     // controller: nameController,
                        //     style: TextStyle(color: Colors.black),

                        //     decoration: InputDecoration(
                        //       // labelText: "First Name",
                        //       hintText: "Enter your name",
                        //       labelStyle: TextStyle(
                        //         fontSize: 15.0,
                        //         fontWeight: FontWeight.w300,
                        //         color: Colors.black,
                        //         fontFamily: 'Inter',
                        //       ),

                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(3),
                        //           borderSide: BorderSide(color: Colors.black)),
                        //       // errorStyle: TextStyle(color: Colors.white),
                        //       focusedErrorBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(color: Colors.black)),
                        //       errorBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.white),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.black),
                        //       ),
                        //       // enabledBorder: OutlineInputBorder(
                        //       //     borderSide: BorderSide(color: Colors.black)),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          // color: Colors.green,
                          width: ScreenSize.size.width * 0.60,
                          // height: ScreenSize.size.height * 0.08,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^[a-z,A-Z]+$').hasMatch(value)) {
                                return "Enter your first name";
                              }
                              return null;
                            },
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            // controller: nameController,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              // labelText: "First Name",
                              labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontFamily: 'Inter',
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(color: Colors.black)),
                              // errorStyle: TextStyle(color: Colors.white),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Email    : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 73, 150, 188),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(
                          // color: Colors.green,
                          width: ScreenSize.size.width * 0.60,
                          // height: ScreenSize.size.height * 0.08,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a email address";
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                            },
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            // controller: nameController,
                            style: TextStyle(color: Colors.black),

                            decoration: InputDecoration(
                              // labelText: "First Name",
                              // helperText: "Enter your Email Address",
                              hintText: "Enter your email address",
                              labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontFamily: 'Inter',
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(color: Colors.black)),
                              // errorStyle: TextStyle(color: Colors.white),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Phone   : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 73, 150, 188),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(
                          // color: Colors.green,
                          width: ScreenSize.size.width * 0.60,
                          // height: ScreenSize.size.height * 0.08,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a phone number";
                              } else if (!RegExp(
                                      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                  .hasMatch(value)) {
                                return "Please enter a correct phone number";
                              }
                            },
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            // controller: nameController,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              // labelText: "First Name",
                              labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontFamily: 'Inter',
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(color: Colors.black)),
                              // errorStyle: TextStyle(color: Colors.white),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize.size.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            color: Color.fromARGB(255, 70, 133, 164),
                            onPressed: () {
                              // selectedImage1!;
                            },
                            child: Text("Update"))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      )),
    );
  }
}
