import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omkar_development/Demo/updatedialog.dart';
import 'package:omkar_development/Editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Drawer.dart';
import '../Electrict/ElectrictSuccesfulyPage.dart';
import '../Constants/app_constants.dart';
import '../model/profileModel.dart';
import '../model/securityModel.dart';
// import 'Drawer.dart';

class Editprofile21 extends StatefulWidget {
  const Editprofile21({super.key});

  @override
  State<Editprofile21> createState() => _Editprofile21State();
}

class _Editprofile21State extends State<Editprofile21> {
  @override
  void initState() {
    super.initState();
    // Profile11 = profile();
    // firstName.text = '';
  }

  @override
  void dispose() {
    firstName.dispose();
    super.dispose();
  }

  late Future<Profile> Profile11;
  Future<void> uploadImage() async {
    // var stream = new http.ByteStream(image1!.openRead());
    // stream.cast();

    // var length = await image1!.length();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${id}'
    };
    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   "Authorization":
    //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczOTM4ODcwLCJpYXQiOjE2NzM4NTI0NzAsImp0aSI6IjAyMDg5M2Q2YTA0NjRjZTk5M2Y5YTNjMzZlM2VjOWU4IiwidXNlcl9pZCI6M30.EU_U0r2RtouunbeYjqoBPSlxQ4ptqO5_dkVcXQvbXxM"
    // };
    var uri = Uri.parse("${AppConstants.BASE_URL}/user/profile-update/");

    var request = new http.MultipartRequest('PUT', uri)
      ..headers.addAll(headers);

    request.fields['first_name'] = firstName.text;
    request.fields['last_name'] = lastName.text;
    request.fields['phone'] = _phone.text;
    request.fields['address'] = _address.text;
    // request.files.add(await http.MultipartFile.fromPath(
    //     'image', imageFileList.map((e) => e.path).toString()));
    // request.files.add(http.MultipartFile.fromString(
    //     'image', imageFileList.map((e) => e.path).toList().toString()));
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    // request.files.add(
    //     await http.MultipartFile.fromPath('image', image!.path));

    var response = await http.Response.fromStream(await request.send());
    final body = json.decode(response.body);
    print(body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      pageRoute(data['response'], body);
    } else {
      print('11111Faild uploaded');
    }
  }

  void pageRoute(String response, data1) async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    await perf.setString(
      "popup1",
      response,
    );
    showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return updateprofiledialog();
        });
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  }

  File? image;
  File? selectedImage1;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String base64Image = "";

  Future<void> chooseImage1(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      ;
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    print("dfasdjfkla;dsjfa${image.path}");
    if (image != null) {
      setState(() {
        selectedImage1 = File(image.path);

        base64Image = base64Encode(selectedImage1!.readAsBytesSync());
      });
    }
  }

  TextEditingController firstName = new TextEditingController()
    ..text = "navneet";
  TextEditingController lastName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Drawer1(), maintainState: false),
                  );
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
            'Edit Profile',
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w700,
              // color: Color(0xff09618E),
              color: Colors.black,
              fontFamily: 'Inter',
            ),
          ),
          // centerTitle: true,
          // actions: [
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         children: [
          //           Container(
          //             width: 80,
          //             height: 40,
          //             color: Color(0xff09618E),
          //             child: IconButton(
          //               icon: Text(
          //                 "Edit",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.w600),
          //               ),
          //               iconSize: 10,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => Updateprofile()),
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          //   SizedBox(
          //     width: 10,
          //   )
          // ],
        ),
        body: Form(
          key: formkey,
          child: FutureBuilder<Profile>(
              future: Profile11,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              // Container(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Container(
                              //         width: ScreenSize.size.width,
                              //         // color: Colors.amber,
                              //         height: ScreenSize.size.height / 4,
                              //         child: Image.asset(
                              //           "assets/images/lorries-outside-a-large-warehouse 2 (1).png",
                              //           fit: BoxFit.cover,
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                height: ScreenSize.size.height * 0.05,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // height: 470,
                                    width: ScreenSize.size.width * 0.86,
                                    // color: Color(0xff09618E),
                                    child: Card(
                                        shadowColor: Colors.blue[300],
                                        elevation: 10,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: ScreenSize.size.height *
                                                  0.030,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  height: 115,
                                                  width: 110,
                                                  child: Column(
                                                    children: [
                                                      // CircleAvatar(
                                                      //   // backgroundColor: Color.fromARGB(255, 234, 208, 131),
                                                      //   radius: 40,
                                                      //   child: Icon(Icons.person,
                                                      //       color: Colors.white),
                                                      // ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage1(
                                                              "Gallery");
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              // color: Colors.black,
                                                              height: 115,
                                                              width: 110,
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 40,
                                                                // backgroundColor: Color.fromARGB(255, 234, 208, 131),

                                                                // height: ScreenSize.size.height * 0.18,
                                                                // width: ScreenSize.size.width * 0.28,
                                                                // decoration: BoxDecoration(
                                                                //     borderRadius: BorderRadius.circular(10),
                                                                //     // color: Color.fromARGB(255, 247, 237, 231),
                                                                //     color: Colors.grey[300]),
                                                                child: selectedImage1 !=
                                                                        null
                                                                    ? CircleAvatar(
                                                                        radius:
                                                                            57,
                                                                        backgroundImage:
                                                                            Image.file(
                                                                          selectedImage1!,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ).image,
                                                                      )
                                                                    : Container(
                                                                        child: IconButton(
                                                                            onPressed: () {
                                                                              chooseImage1("Camera");
                                                                            },
                                                                            icon: Icon(Icons.person),
                                                                            iconSize: 50,
                                                                            color: Colors.white),
                                                                      ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 115,
                                                              width: 110,
                                                              // color: Colors.amber,
                                                              child: InkWell(
                                                                // overlayColor:
                                                                //     MaterialStateProperty
                                                                //         .all(
                                                                //             Colors.white),
                                                                // splashFactory: NoSplash
                                                                //     .splashFactory,
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                120.0,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            margin:
                                                                                EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 20,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  "Upload image",
                                                                                  style: TextStyle(
                                                                                    fontSize: 20.0,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 20,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: <Widget>[
                                                                                    OutlinedButton.icon(
                                                                                        onPressed: () {
                                                                                          Navigator.pop(context);
                                                                                          chooseImage1("camera");
                                                                                        },
                                                                                        icon: Icon(Icons.camera),
                                                                                        label: Text("camera")),
                                                                                    OutlinedButton.icon(
                                                                                      onPressed: () {
                                                                                        Navigator.pop(context);
                                                                                        chooseImage1("Gallery");
                                                                                      },
                                                                                      icon: Icon(Icons.image),
                                                                                      label: Text("Gallery"),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      });
                                                                  // showModalBottomSheet(
                                                                  //     shape: const RoundedRectangleBorder(
                                                                  //         borderRadius: BorderRadius.vertical(
                                                                  //             top: Radius
                                                                  //                 .circular(
                                                                  //                     25.0))),
                                                                  //     context: context,
                                                                  //     builder: ((builder) =>
                                                                  //         bottomSheet()));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: ScreenSize
                                                                          .size
                                                                          .height *
                                                                      0.15,
                                                                  width: ScreenSize
                                                                          .size
                                                                          .width *
                                                                      0.24,
                                                                  // color: Colors.amber,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .camera_alt,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            94,
                                                                            121,
                                                                            175),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // CircleAvatar(
                                                //   radius: 40,
                                                //   child: Icon(
                                                //     Icons.person,
                                                //     size: 50,
                                                //   ),
                                                // )
                                              ],
                                            ),
                                            SizedBox(
                                              height: ScreenSize.size.height *
                                                  0.020,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        // color: Colors.pink,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // SizedBox(
                                                            //   width: ScreenSize.size.width * 0.10,
                                                            // ),
                                                            Container(
                                                              // color: Colors.black,
                                                              width: 85,
                                                              // height: 18,
                                                              child: Text(
                                                                "First name : ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          73,
                                                                          150,
                                                                          188),
                                                                  fontFamily:
                                                                      'Inter',
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              // color: Colors.green,
                                                              width: ScreenSize
                                                                      .size
                                                                      .width *
                                                                  0.50,
                                                              height: 40,
                                                              child: Center(
                                                                child:
                                                                    TextFormField(
                                                                  // controller: firstName,
                                                                  controller: firstName
                                                                    ..text = snapshot
                                                                        .data!
                                                                        .response
                                                                        .firstName,
                                                                  // controller: firstName,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  // initialValue:
                                                                  //     "navneet",
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        !RegExp(r'^[a-z,A-Z]+$')
                                                                            .hasMatch(value)) {
                                                                      return "Please enter first name";
                                                                    }
                                                                    return value.length >
                                                                            25
                                                                        ? 'Character must be less than 25 characters'
                                                                        : null;
                                                                  },
                                                                  // validator: (value) {
                                                                  //   if (value == null ||
                                                                  //       value.isEmpty ||
                                                                  //       !RegExp(r'^[a-z,A-Z]+$')
                                                                  //           .hasMatch(
                                                                  //               value)) {
                                                                  //     return "Enter your first name";
                                                                  //   }
                                                                  //   return null;
                                                                  // },
                                                                  // autovalidateMode:
                                                                  //     AutovalidateMode.onUserInteraction,
                                                                  // controller: nameController,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        " Enter your first name",
                                                                    // labelText: "First Name",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Inter',
                                                                    ),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    // errorStyle: TextStyle(color: Colors.white),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.white),
                                                                    ),
                                                                    // focusedBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                    // enabledBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // SizedBox(
                                                            //   width: ScreenSize.size.width * 0.10,
                                                            // ),
                                                            Container(
                                                              // color: Colors.black,
                                                              width: 85,
                                                              // height: 18,
                                                              child: Text(
                                                                "Last name : ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          73,
                                                                          150,
                                                                          188),
                                                                  fontFamily:
                                                                      'Inter',
                                                                ),
                                                              ),
                                                            ),
                                                            // Container(
                                                            //     // color: Colors.green,
                                                            //     width:
                                                            //         ScreenSize.size.width * 0.48,
                                                            //     // height: ScreenSize.size.height * 0.03,
                                                            //     child: Text(
                                                            //       "${"user11"}",
                                                            //       style: TextStyle(
                                                            //         fontWeight: FontWeight.w700,
                                                            //         color: Color.fromARGB(
                                                            //             255, 73, 150, 188),
                                                            //         fontFamily: 'Inter',
                                                            //       ),
                                                            //       textAlign: TextAlign.justify,
                                                            //     )),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              // color: Colors.green,
                                                              width: ScreenSize
                                                                      .size
                                                                      .width *
                                                                  0.50,
                                                              height: 40,
                                                              child: Center(
                                                                child:
                                                                    TextFormField(
                                                                  controller: lastName
                                                                    ..text = snapshot
                                                                        .data!
                                                                        .response
                                                                        .lastName,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        !RegExp(r'^[a-z,A-Z]+$')
                                                                            .hasMatch(value)) {
                                                                      return "Please enter last name";
                                                                    }
                                                                    return value.length >
                                                                            25
                                                                        ? 'Character must be less than 25 characters'
                                                                        : null;
                                                                  },
                                                                  // validator: (value) {
                                                                  //   if (value == null ||
                                                                  //       value.isEmpty ||
                                                                  //       !RegExp(r'^[a-z,A-Z]+$')
                                                                  //           .hasMatch(
                                                                  //               value)) {
                                                                  //     return "Enter your last name";
                                                                  //   }
                                                                  //   return null;
                                                                  // },
                                                                  // autovalidateMode:
                                                                  //     AutovalidateMode.onUserInteraction,
                                                                  // controller: nameController,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        " Enter your last name",
                                                                    // labelText: "First Name",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Inter',
                                                                    ),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    // errorStyle: TextStyle(color: Colors.white),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.white),
                                                                    ),
                                                                    // focusedBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                    // enabledBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // SizedBox(
                                                            //   width: ScreenSize.size.width * 0.10,
                                                            // ),
                                                            Container(
                                                              // color: Colors.black,
                                                              width: 85,
                                                              // height: 18,
                                                              child: Text(
                                                                "Mobile no. : ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          73,
                                                                          150,
                                                                          188),
                                                                  fontFamily:
                                                                      'Inter',
                                                                ),
                                                              ),
                                                            ),
                                                            // Container(
                                                            //     // color: Colors.green,
                                                            //     width:
                                                            //         ScreenSize.size.width * 0.48,
                                                            //     // height: ScreenSize.size.height * 0.03,
                                                            //     child: Text(
                                                            //       "${"user11"}",
                                                            //       style: TextStyle(
                                                            //         fontWeight: FontWeight.w700,
                                                            //         color: Color.fromARGB(
                                                            //             255, 73, 150, 188),
                                                            //         fontFamily: 'Inter',
                                                            //       ),
                                                            //       textAlign: TextAlign.justify,
                                                            //     )),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              // color: Colors.green,
                                                              width: ScreenSize
                                                                      .size
                                                                      .width *
                                                                  0.50,
                                                              height: 40,
                                                              child: Center(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _phone
                                                                    ..text = snapshot
                                                                        .data!
                                                                        .response
                                                                        .phone,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  validator:
                                                                      (value) {
                                                                    String
                                                                        patttern =
                                                                        r'(^(?:[+0]9)?[0-9]$)';
                                                                    String
                                                                        patttern1 =
                                                                        r'(^(?:[+0]9)?[0-9]{4,14}$)';
                                                                    RegExp
                                                                        regExp =
                                                                        new RegExp(
                                                                            patttern);
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        !RegExp(patttern1)
                                                                            .hasMatch(value)) {
                                                                      return (value == null ||
                                                                              value.isEmpty ||
                                                                              !RegExp(patttern1).hasMatch(value))
                                                                          ? 'Please enter mobile number '
                                                                          : 'Character must be less than 14 characters';
                                                                    }
                                                                    // if (value == null ||
                                                                    //     value.isEmpty ||
                                                                    //     !RegExp(patttern)
                                                                    //         .hasMatch(value)) {
                                                                    //   return 'Please enter mobile number ';
                                                                    // }
                                                                    return value.length ==
                                                                            14
                                                                        ? 'Character must be less than 14 characters'
                                                                        : null;
                                                                  },
                                                                  // validator: (value) {
                                                                  //   if (value == null ||
                                                                  //       value.isEmpty ||
                                                                  //       !RegExp(r'^[a-z,A-Z]+$')
                                                                  //           .hasMatch(
                                                                  //               value)) {
                                                                  //     return "Enter your mobile number";
                                                                  //   }
                                                                  //   return null;
                                                                  // },
                                                                  // autovalidateMode:
                                                                  //     AutovalidateMode.onUserInteraction,
                                                                  // controller: nameController,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  // keyboardType:
                                                                  //     TextInputType
                                                                  //         .text,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        " Enter your mobile number",
                                                                    // labelText: "First Name",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Inter',
                                                                    ),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    // errorStyle: TextStyle(color: Colors.white),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.white),
                                                                    ),
                                                                    // focusedBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                    // enabledBorder:
                                                                    //     UnderlineInputBorder(
                                                                    //         borderSide:
                                                                    //             BorderSide(
                                                                    //                 color: Colors
                                                                    //                     .black)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment.center,
                                                  //   crossAxisAlignment:
                                                  //       CrossAxisAlignment.start,
                                                  //   children: [
                                                  //     Container(
                                                  //       height: 50,
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment.center,
                                                  //         crossAxisAlignment:
                                                  //             CrossAxisAlignment.center,
                                                  //         children: [
                                                  //           // SizedBox(
                                                  //           //   width: ScreenSize.size.width * 0.10,
                                                  //           // ),
                                                  //           Container(
                                                  //             // color: Colors.black,
                                                  //             width: 85,
                                                  //             child: Row(
                                                  //               mainAxisAlignment:
                                                  //                   MainAxisAlignment.end,
                                                  //               children: [
                                                  //                 Text(
                                                  //                   "Email  id : ",
                                                  //                   style: TextStyle(
                                                  //                     fontWeight:
                                                  //                         FontWeight.w700,
                                                  //                     color:
                                                  //                         Color.fromARGB(
                                                  //                             255,
                                                  //                             73,
                                                  //                             150,
                                                  //                             188),
                                                  //                     fontFamily: 'Inter',
                                                  //                   ),
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //           Container(
                                                  //             decoration: BoxDecoration(
                                                  //                 border: Border.all(
                                                  //                     color:
                                                  //                         Colors.black)),
                                                  //             // color: Colors.green,
                                                  //             width:
                                                  //                 ScreenSize.size.width *
                                                  //                     0.50,
                                                  //             height: 40,
                                                  //             child: TextFormField(
                                                  //               textInputAction:
                                                  //                   TextInputAction.next,
                                                  //               validator: (value) {
                                                  //                 if (value!.isEmpty) {
                                                  //                   return "Enter a email address";
                                                  //                 } else if (!RegExp(
                                                  //                         r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                  //                     .hasMatch(value)) {
                                                  //                   return "Please enter a valid email address";
                                                  //                 }
                                                  //               },
                                                  //               // autovalidateMode:
                                                  //               //     AutovalidateMode.onUserInteraction,
                                                  //               // controller: nameController,
                                                  //               style: TextStyle(
                                                  //                   color: Colors.black),
                                                  //               keyboardType:
                                                  //                   TextInputType.text,
                                                  //               decoration:
                                                  //                   InputDecoration(
                                                  //                       hintText:
                                                  //                           " Enter your email address ",
                                                  //                       // labelText: "First Name",
                                                  //                       labelStyle:
                                                  //                           TextStyle(
                                                  //                         fontSize: 15.0,
                                                  //                         fontWeight:
                                                  //                             FontWeight
                                                  //                                 .w300,
                                                  //                         color: Colors
                                                  //                             .black,
                                                  //                         fontFamily:
                                                  //                             'Inter',
                                                  //                       ),
                                                  //                       border:
                                                  //                           InputBorder
                                                  //                               .none,
                                                  //                       // errorStyle: TextStyle(color: Colors.white),
                                                  //                       focusedErrorBorder:
                                                  //                           UnderlineInputBorder(
                                                  //                               borderSide: BorderSide(
                                                  //                                   color: Colors
                                                  //                                       .black)),
                                                  //                       errorBorder:
                                                  //                           UnderlineInputBorder(
                                                  //                         borderSide: BorderSide(
                                                  //                             color: Colors
                                                  //                                 .white),
                                                  //                       ),
                                                  //                       focusedBorder:
                                                  //                           InputBorder
                                                  //                               .none
                                                  //                       // enabledBorder: OutlineInputBorder(
                                                  //                       //     borderSide: BorderSide(color: Colors.black)),
                                                  //                       ),
                                                  //             ),
                                                  //           ),
                                                  //           // Container(
                                                  //           //     // color: Colors.green,
                                                  //           //     width:
                                                  //           //         ScreenSize.size.width * 0.48,
                                                  //           //     // height: ScreenSize.size.height * 0.03,
                                                  //           //     child: Text(
                                                  //           //       "${"email11"}",
                                                  //           //       style: TextStyle(
                                                  //           //         fontSize: 15,
                                                  //           //         fontWeight: FontWeight.w700,
                                                  //           //         color: Color.fromARGB(
                                                  //           //             255, 73, 150, 188),
                                                  //           //         fontFamily: 'Inter',
                                                  //           //       ),
                                                  //           //       textAlign: TextAlign.justify,
                                                  //           //     )),
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  Container(
                                                    height: 40,
                                                    // color: Colors.amber,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        // SizedBox(
                                                        //   width: ScreenSize.size.width * 0.10,
                                                        // ),
                                                        Container(
                                                          // color: Colors.black,
                                                          width: 85,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "Address :  ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          73,
                                                                          150,
                                                                          188),
                                                                  fontFamily:
                                                                      'Inter',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          // color: Colors.green,
                                                          width: ScreenSize
                                                                  .size.width *
                                                              0.50,
                                                          height: 40,
                                                          // color: Colors.green,

                                                          child: TextFormField(
                                                            controller: _address
                                                              ..text = snapshot
                                                                  .data!
                                                                  .response
                                                                  .address,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            // validator: (value) {
                                                            //   if (value!.isEmpty) {
                                                            //     return "Enter a Address";
                                                            //   }
                                                            // },
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "Please enter your address ";
                                                              }
                                                              return null;
                                                            },
                                                            // autovalidateMode:
                                                            //     AutovalidateMode.onUserInteraction,
                                                            // controller: nameController,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  " Enter your address",
                                                              // labelText: "First Name",
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Inter',
                                                              ),

                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              // errorStyle: TextStyle(color: Colors.white),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black)),
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,

                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              // enabledBorder: OutlineInputBorder(
                                                              //     borderSide: BorderSide(color: Colors.black)),
                                                            ),
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   height:
                                                        //       ScreenSize.size.height * 0.05,
                                                        // )
                                                        // Container(
                                                        //     // color: Colors.green,
                                                        //     width:
                                                        //         ScreenSize.size.width * 0.48,
                                                        //     // height: ScreenSize.size.height * 0.03,
                                                        //     child: Text(
                                                        //       "1234567890",
                                                        //       style: TextStyle(
                                                        //         fontWeight: FontWeight.w700,
                                                        //         color: Color.fromARGB(
                                                        //             255, 73, 150, 188),
                                                        //         fontFamily: 'Inter',
                                                        //       ),
                                                        //       textAlign: TextAlign.justify,
                                                        //     )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        ScreenSize.size.height *
                                                            0.05,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: MaterialButton(
                                                          color:
                                                              Color(0xff09618E),
                                                          onPressed: () {
                                                            // selectedImage1!;
                                                            // validate();
                                                            uploadImage();
                                                          },
                                                          child: Text("Update",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        ScreenSize.size.height *
                                                            0.05,
                                                  ),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment.center,
                                                  //   children: [
                                                  //     MaterialButton(
                                                  //         color: Color.fromARGB(
                                                  //             255, 70, 133, 164),
                                                  //         onPressed: () {
                                                  //           Navigator.push(
                                                  //             context,
                                                  //             MaterialPageRoute(
                                                  //                 builder: (context) =>
                                                  //                     Updateprofile()),
                                                  //           );
                                                  //         },
                                                  //         child: Text("Edit Profile"))
                                                  //   ],
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ])),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  );
                }
                return Center(child: const CircularProgressIndicator());
              }),
        ));
  }

  Future<void> validate() async {
    if (formkey.currentState!.validate()) {
      // setLoginStatus();
      // String name = emailController.text;
      // String pass = passwordController.text;
      // // String str = selectedRadio.toString();
      // login1? data = await SmbitData(
      //   name,
      //   pass,
      // );

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: const Text('ok'),
      //   backgroundColor: Colors.green.shade300,
      // ));
    } else {
      print("error");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: const Text('error'),
      //   backgroundColor: Colors.green.shade300,
      // ));
    }
  }
}
