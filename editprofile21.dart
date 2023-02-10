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

class Editprofile22 extends StatefulWidget {
  const Editprofile22({super.key});

  @override
  State<Editprofile22> createState() => _Editprofile22State();
}

class _Editprofile22State extends State<Editprofile22> {
  // var name;
  // var last;
  // var phone;
  // var address;
  // late TextEditingController firstName1;
  // late TextEditingController _phone;
  // late TextEditingController _address;
  @override
  void initState() {
    super.initState();
    Profile11 = profile();
    // firstName.text = '';
    // navigateUser21();
    // firstName1 = TextEditingController(text: "$name");
    // lastName = TextEditingController(text: last);
    // _phone = TextEditingController(text: phone);
    // _address = TextEditingController(text: address);
  }

  @override
  void dispose() {
    // myFocusNode.dispose();
    super.dispose();
  }

  final passwordFocusNode1 = FocusNode();
  // late FocusNode myFocusNode;
  late Future<Profile> Profile11;

  void pageRoute(String response, data1) async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    await perf.setString(
      "popup1",
      response,
    );

    showDialog(
        // barrierDismissible: false,
        // useRootNavigator: false,
        // useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 5), () {
            Navigator.pop(context);
          });
          return updateprofiledialog();
        });
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  }

  // void navigateUser21() async {
  //   SharedPreferences perf = await SharedPreferences.getInstance();

  //   String? val1 = perf.getString("name");
  //   String? val2 = perf.getString("last");
  //   String? val3 = perf.getString("phone");

  //   String? val4 = perf.getString("address");
  //   setState(() {
  //     name = val1;
  //     last = val2;
  //     phone = val3;
  //     address = val4;
  //   });
  // }

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

      imageFileList.add(image);
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      imageFileList.add(image);
    }
    print("dfasdjfkla;dsjfa${image.path}");
    if (image != null) {
      setState(() {
        selectedImage1 = File(image.path);

        base64Image = base64Encode(selectedImage1!.readAsBytesSync());
        print(imageFileList);
      });
    }
  }

  List<XFile> imageFileList = [];
  // TextEditingController firstName1 = TextEditingController();

  // TextEditingController lastName = TextEditingController();
  // TextEditingController _phone = TextEditingController();
  // TextEditingController _address = TextEditingController();

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

    var request = new http.MultipartRequest('PATCH', uri)
      ..headers.addAll(headers);

    request.fields['first_name'] = firstName1.text;
    request.fields['last_name'] = lastName.text;
    request.fields['phone'] = _phone.text;
    request.fields['address'] = _address.text;

    // request.files.add(await http.MultipartFile.fromPath(
    //     'image', Null));
    // request.files.add(http.MultipartFile.fromString(
    //     'image', imageFileList.map((e) => e.path).toList().toString()));

    var data;
    var err;
    if (data == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    }

    {
      for (var i = 0; i < imageFileList.length; i++) {
        print(i);
        request.files.add(await http.MultipartFile.fromPath(
            'profile', imageFileList[i].path));
        print("uploaded ${imageFileList.map((e) => e.path)}");
      }
    }
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });

    // request.files.add(
    //     await http.MultipartFile.fromPath('image', image!.path));

    // var response = await http.Response.fromStream(await request.send());

    var response = await http.Response.fromStream(await request.send());
    final body = json.decode(response.body);
    data = body['status'];
    err = body['response'];
    print(body['response'].toString());
    print(body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      pageRoute(data['response'], body);
    } else {
      print('11111Faild uploaded');
    }
  }

  TextEditingController textController = TextEditingController();
  TextEditingController firstName1 = TextEditingController()..text;
  TextEditingController lastName = TextEditingController()..text;
  TextEditingController _phone = TextEditingController()..text;
  TextEditingController _address = TextEditingController()..text;

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
                // TextEditingController firstName1 = TextEditingController()
                //   ..text = snapshot.data!.response.firstName;

                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                                  0.020,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  height: 83,
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
                                                              height: 80,
                                                              width: 110,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        161,
                                                                        189,
                                                                        223),
                                                                radius: 20,
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
                                                                            38,
                                                                        backgroundImage:
                                                                            Image.file(
                                                                          selectedImage1!,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ).image,
                                                                      )
                                                                    // ? CircleAvatar(
                                                                    //     radius:
                                                                    //         38.0,
                                                                    //     foregroundImage: NetworkImage(
                                                                    //         "${AppConstants.BASE_URL}"
                                                                    //         "${snapshot.data!.response.profile}"),
                                                                    //     backgroundColor:
                                                                    //         Colors.transparent,
                                                                    //   )
                                                                    : Container(
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                selectedImage1 == true
                                                                                    ? CircleAvatar(
                                                                                        radius: 38.0,
                                                                                        child: Icon(
                                                                                          Icons.person,
                                                                                          size: 30,
                                                                                        ),
                                                                                        backgroundColor: Colors.transparent,
                                                                                      )
                                                                                    : Stack(
                                                                                        children: [
                                                                                          snapshot.data!.response.profile == null
                                                                                              ? CircleAvatar(
                                                                                                  radius: 38.0,
                                                                                                  child: Icon(
                                                                                                    Icons.person,
                                                                                                    size: 30,
                                                                                                  ),
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                )
                                                                                              : Stack(
                                                                                                  children: [
                                                                                                    CircleAvatar(
                                                                                                      radius: 46.0,
                                                                                                      foregroundImage: NetworkImage("${AppConstants.BASE_URL}"
                                                                                                          "${snapshot.data!.response.profile}"),
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                    ),
                                                                                                    // Container(
                                                                                                    //   color: Colors.amber,
                                                                                                    //   // radius: 38.0,
                                                                                                    //   child: GestureDetector(
                                                                                                    //     onTap: (() {
                                                                                                    //       deleteAlbum();
                                                                                                    //     }),
                                                                                                    //     child: Positioned(
                                                                                                    //       left: 90,
                                                                                                    //       child: Icon(
                                                                                                    //         Icons.remove,
                                                                                                    //         size: 30,
                                                                                                    //       ),
                                                                                                    //     ),
                                                                                                    //   ),
                                                                                                    //   // backgroundColor: Colors.transparent,
                                                                                                    // ),
                                                                                                  ],
                                                                                                )
                                                                                        ],
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 82,
                                                              width: 103,
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
                                                                                100.0,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            margin:
                                                                                EdgeInsets.symmetric(
                                                                              horizontal: 10,
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
                                                                                // Row(
                                                                                //   children: [
                                                                                //     Container(
                                                                                //         // color: Colors.amber,
                                                                                //         width: ScreenSize.size.width * 0.90,
                                                                                //         height: 50,
                                                                                //         child: ListTile(
                                                                                //           onTap: () {

                                                                                //           },
                                                                                //           textColor: Colors.red,
                                                                                //           iconColor: Colors.red,
                                                                                //           // tileColor: Color.fromARGB(255, 104, 99, 99),
                                                                                //           title: Text("Delete Profile picture"),
                                                                                //           trailing: Icon(Icons.delete),
                                                                                //         ))
                                                                                //   ],
                                                                                // ),
                                                                                SizedBox(
                                                                                  height: 10,
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
                                                                                ),
                                                                                // deleteAlbum();
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
                                                  Container(
                                                    // color: Colors.amber,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.79,
                                                    child: Text(
                                                      "First Name  ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 73, 150, 188),
                                                        fontFamily: 'Inter',
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        // decoration: BoxDecoration(
                                                        //     border: Border.all(
                                                        //         color: Colors
                                                        //             .black)),
                                                        // color: Colors.green,
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.79,
                                                        height: 66,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                height: 66,
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      firstName1
                                                                        ..text = snapshot
                                                                            .data!
                                                                            .response
                                                                            .firstName
                                                                        ..selection =
                                                                            TextSelection.fromPosition(TextPosition(offset: firstName1.text.length)),
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      snapshot
                                                                          .data!
                                                                          .response
                                                                          .firstName = newValue;
                                                                    });
                                                                  },
                                                                  // enabled: true,
                                                                  // enableInteractiveSelection:
                                                                  //     true,
                                                                  // toolbarOptions:
                                                                  //     ToolbarOptions(
                                                                  //         copy: true,
                                                                  //         paste: true,
                                                                  //         cut: true,
                                                                  //         selectAll: true),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  // controller: firstName1
                                                                  //   ..text
                                                                  //   ..selection = TextSelection
                                                                  //       .collapsed(
                                                                  //           offset: firstName1
                                                                  //               .text
                                                                  //               .runes
                                                                  //               .length),
                                                                  // controller: firstName1
                                                                  //   ..selection = TextSelection
                                                                  //       .collapsed(
                                                                  //           offset: firstName1
                                                                  //               .text
                                                                  //               .length),

                                                                  // selectionControls: firstName.fromPosition(TextPosition(offset: firstName.text.length)),
                                                                  // controller: firstName
                                                                  //   ..text = snapshot
                                                                  //       .data!
                                                                  //       .response
                                                                  //       .firstName,

                                                                  // readOnly: false,
                                                                  // autocorrect: false,
                                                                  // autofocus: false,
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
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),

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
                                                                    focusColor:
                                                                        Colors
                                                                            .black,

                                                                    border: UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.black)),
                                                                    // errorStyle: TextStyle(color: Colors.white),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // SizedBox(
                                                  //   height: 14,
                                                  // ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.79,
                                                        child: Text(
                                                          "Last Name  ",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    73,
                                                                    150,
                                                                    188),
                                                            fontFamily: 'Inter',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        // decoration: BoxDecoration(
                                                        //     border: Border.all(
                                                        //         color: Colors
                                                        //             .black)),
                                                        // color: Colors.green,
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.79,
                                                        height: 66,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                height: 66,
                                                                child:
                                                                    TextFormField(
                                                                  // enabled: true,
                                                                  // enableInteractiveSelection:
                                                                  //     true,
                                                                  // toolbarOptions:
                                                                  //     ToolbarOptions(
                                                                  //         copy: true,
                                                                  //         paste: true,
                                                                  //         cut: true,
                                                                  //         selectAll: true),

                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  controller:
                                                                      lastName
                                                                        ..text = snapshot
                                                                            .data!
                                                                            .response
                                                                            .lastName
                                                                        ..selection =
                                                                            TextSelection.fromPosition(TextPosition(offset: lastName.text.length)),
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      snapshot
                                                                          .data!
                                                                          .response
                                                                          .lastName = newValue;
                                                                    });
                                                                  },

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
                                                                    focusColor:
                                                                        Colors
                                                                            .black,

                                                                    border: UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.black)),
                                                                    // errorStyle: TextStyle(color: Colors.white),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 14,
                                                  // ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.79,
                                                        child: Text(
                                                          "Mobile Number  ",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    73,
                                                                    150,
                                                                    188),
                                                            fontFamily: 'Inter',
                                                          ),
                                                        ),
                                                      )
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
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            // decoration: BoxDecoration(
                                                            //     border: Border.all(
                                                            //         color: Colors
                                                            //             .black)),
                                                            // color: Colors.green,
                                                            width: ScreenSize
                                                                    .size
                                                                    .width *
                                                                0.79,
                                                            height: 66,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                    height: 66,
                                                                    child:
                                                                        TextFormField(
                                                                      // enabled: true,
                                                                      // enableInteractiveSelection:
                                                                      //     true,
                                                                      // toolbarOptions:
                                                                      //     ToolbarOptions(
                                                                      //         copy: true,
                                                                      //         paste: true,
                                                                      //         cut: true,
                                                                      //         selectAll: true),
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                      // autocorrect: false,
                                                                      // autofocus: false,
                                                                      // enableSuggestions: false,
                                                                      controller:
                                                                          _phone
                                                                            ..text =
                                                                                snapshot.data!.response.phone
                                                                            ..selection =
                                                                                TextSelection.fromPosition(TextPosition(offset: _phone.text.length)),
                                                                      onChanged:
                                                                          (newValue) {
                                                                        setState(
                                                                            () {
                                                                          snapshot
                                                                              .data!
                                                                              .response
                                                                              .phone = newValue;
                                                                        });
                                                                      },
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
                                                                            new RegExp(patttern);
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty ||
                                                                            !RegExp(patttern1).hasMatch(value)) {
                                                                          return (value == null || value.isEmpty || !RegExp(patttern1).hasMatch(value))
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
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
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
                                                                              FontWeight.w300,
                                                                          color:
                                                                              Colors.black,
                                                                          fontFamily:
                                                                              'Inter',
                                                                        ),
                                                                        border:
                                                                            UnderlineInputBorder(),
                                                                        // errorStyle: TextStyle(color: Colors.white),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 14,
                                                  // ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: ScreenSize
                                                                .size.width *
                                                            0.79,
                                                        child: Text(
                                                          "Address  ",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    73,
                                                                    150,
                                                                    188),
                                                            fontFamily: 'Inter',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  Container(
                                                    // decoration: BoxDecoration(
                                                    //     border: Border.all(
                                                    //         color:
                                                    //             Colors.black)),
                                                    // color: Colors.green,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.79,
                                                    height: 66,
                                                    // color: Colors.green,

                                                    child: TextFormField(
                                                      // enabled: true,
                                                      // enableInteractiveSelection: true,
                                                      // toolbarOptions: ToolbarOptions(
                                                      //     copy: true,
                                                      //     paste: true,
                                                      //     cut: true,
                                                      //     selectAll: true),
                                                      // onFieldSubmitted: (value) {
                                                      //   validate();
                                                      // },
                                                      // focusNode: passwordFocusNode1,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      controller: _address
                                                        ..text = snapshot.data!
                                                            .response.address
                                                        ..selection = TextSelection
                                                            .fromPosition(
                                                                TextPosition(
                                                                    offset: _address
                                                                        .text
                                                                        .length)),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          snapshot
                                                                  .data!
                                                                  .response
                                                                  .address =
                                                              newValue;
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "Please enter your address ";
                                                        }
                                                        return null;
                                                      },

                                                      // autovalidateMode:
                                                      //     AutovalidateMode.onUserInteraction,
                                                      // controller: nameController,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            " Enter your address",
                                                        // labelText: "First Name",
                                                        labelStyle: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.black,
                                                          fontFamily: 'Inter',
                                                        ),

                                                        // border:
                                                        //     InputBorder.none,
                                                        // errorStyle: TextStyle(color: Colors.white),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                        border:
                                                            UnderlineInputBorder(),
                                                        // errorStyle: TextStyle(color: Colors.white),

                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                        // errorBorder:
                                                        //     InputBorder.none,

                                                        // focusedBorder:
                                                        //     InputBorder.none,
                                                        // enabledBorder: OutlineInputBorder(
                                                        //     borderSide: BorderSide(color: Colors.black)),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        ScreenSize.size.height *
                                                            0.05,
                                                  ),
                                                  Container(
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.79,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          // width: ScreenSize
                                                          //         .size.width *
                                                          //     0.79,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: MaterialButton(
                                                            color: Color(
                                                                0xff09618E),
                                                            onPressed: () {
                                                              // var data =
                                                              //     snapshot
                                                              //         .data!
                                                              //         .response
                                                              //         .profile;
                                                              // imageFileList
                                                              //     .add(data);
                                                              // selectedImage1!;
                                                              validate();
                                                              // uploadImage();
                                                            },
                                                            child: Text(
                                                                "Update",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                        // Container(
                                                        //   decoration:
                                                        //       BoxDecoration(),
                                                        //   child: MaterialButton(
                                                        //     color: Color(
                                                        //         0xff09618E),
                                                        //     onPressed: () {
                                                        //       // selectedImage1!;
                                                        //       // validate();
                                                        //       // uploadImage();
                                                        //       Navigator.canPop(
                                                        //           context);
                                                        //     },
                                                        //     child: Text(
                                                        //         "Cencle",
                                                        //         style: TextStyle(
                                                        //             color: Colors
                                                        //                 .white)),
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
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
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }

  Future<void> validate() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      uploadImage();
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
