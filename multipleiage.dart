import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Cleaning/CleaningSuccesful.dart';
import '../Constants/app_constants.dart';

class MultiImage extends StatefulWidget {
  const MultiImage({super.key});

  @override
  State<MultiImage> createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  // void longerway() {
  //   for (var i = 0; i < imageFileList.length; i++) {
  //     final imageFileListt = imageFileList[i];
  //     jjjj = imageFileListt;
  //     print('this string is $imageFileListt at the $i index');
  //   }
  // }

  void shoetway() {
    imageFileList.asMap().forEach((index, imageFileListt) {
      print("this string is $imageFileListt at the $index index!");
    });
  }

  Future<void> uploadImage() async {
    // var stream = new http.ByteStream(image1!.openRead());
    // stream.cast();

    // var length = await image1!.length();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczNzAwMTAyLCJpYXQiOjE2NzM2MTM3MDIsImp0aSI6IjE5MjZmNGQ1N2JjMDRjYjhhMGY0ODUxY2E4MzBiNmFhIiwidXNlcl9pZCI6Mn0.MXN40Kx9_1g-3IwOTDEFp2UDygsBrw_OfM35Yz62yl4'
    };
    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   "Authorization":
    //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczOTM4ODcwLCJpYXQiOjE2NzM4NTI0NzAsImp0aSI6IjAyMDg5M2Q2YTA0NjRjZTk5M2Y5YTNjMzZlM2VjOWU4IiwidXNlcl9pZCI6M30.EU_U0r2RtouunbeYjqoBPSlxQ4ptqO5_dkVcXQvbXxM"
    // };
    var uri =
        Uri.parse("${AppConstants.BASE_URL}/service-api/post-service-request/");

    var request = new http.MultipartRequest('POST', uri)
      ..headers.addAll(headers);

    request.fields['sub_service_uid'] = "23de95e6-99db-45e0-886b-875c5660bd14";
    request.fields['service_request_datetime'] = "2023-01-10 14:27:37.842002";
    request.fields['description'] = "hhhhh";
    request.fields['gala_uid'] = "01d182af-72af-4f48-9576-b8393417b830";
    // request.files.add(await http.MultipartFile.fromPath(
    //     'image', imageFileList.map((e) => e.path).toString()));
    // request.files.add(http.MultipartFile.fromString(
    //     'image', imageFileList.map((e) => e.path).toList().toString()));

    {
      for (var i = 0; i < imageFileList.length; i++) {
        request.files.add(
            await http.MultipartFile.fromPath('image', imageFileList[i].path));
      }
    }

    var response = await http.Response.fromStream(await request.send());
    final body = json.decode(response.body);

    if (response.statusCode == 201) {
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
      "popup",
      response,
    );
    showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return CleaningSuccesfuly();
        });
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Drawer', (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Drawer1()), (route) => false);
  }
  // Future<void> uploadImage() async {
  //   var stream = new http.ByteStream(images!.openRead());
  //   stream.cast();

  //   var length = await images!.length();
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MTA4MzUwLCJpYXQiOjE2NzQwMjE5NTAsImp0aSI6IjJjNjYxOWRkZjAwMTQyMGJhMjEzNzVlZGFlMzQ2ODUxIiwidXNlcl9pZCI6Mn0.sJEt9OlFsoH6f_fGWC-Y3qNdTsCA-hUgjoNPWOWHNc0'
  //   };
  //   // Map<String, String> headers = {
  //   //   "Accept": "application/json",
  //   //   "Authorization":
  //   //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczOTM4ODcwLCJpYXQiOjE2NzM4NTI0NzAsImp0aSI6IjAyMDg5M2Q2YTA0NjRjZTk5M2Y5YTNjMzZlM2VjOWU4IiwidXNlcl9pZCI6M30.EU_U0r2RtouunbeYjqoBPSlxQ4ptqO5_dkVcXQvbXxM"
  //   // };
  //   var uri = Uri.parse(
  //       "http://192.168.0.121:8000/service-api/post-service-request/");

  //   var request = new http.MultipartRequest('POST', uri)
  //     ..headers.addAll(headers);

  //   request.fields['sub_service_uid'] = "23de95e6-99db-45e0-886b-875c5660bd14";
  //   request.fields['service_request_datetime'] = "2023-01-10 14:27:37.842002";
  //   request.fields['description'] = "services data2";
  //   request.fields['gala_uid'] = "01d182af-72af-4f48-9576-b8393417b830";

  //   var multiport = new http.MultipartFile('image', stream, length);

  //   request.files.add(multiport);

  //   var response = await http.Response.fromStream(await request.send());
  //   print(response.body);
  //   if (response.statusCode == 201) {
  //     print('image uploaded');
  //   } else {
  //     print('11111Faild uploaded');
  //   }
  // }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  var images;
  var images1;
  var images2;
  var ppp;
  var jjjj;
  @override
  void initState() {
    super.initState();
    ppp = jjjj;
  }

  var ppp1;
  var hhh1;
  var qqq1;
  var _currentIndex = 0;
  final _picker = ImagePicker();

  Future getImage() async {
    final XFile? pickFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickFile != null) {
      imageFileList.add(pickFile);

      setState(() {
        ppp1 = imageFileList.elementAt(0);
      });
      setState(() {
        hhh1 = imageFileList.elementAt(1);
      });
      setState(() {
        qqq1 = imageFileList.elementAt(2);
      });
    } else {
      print("no image selected");
    }
  }

  Future<void> selectIamges() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      for (var i = 0; i < imageFileList.length; i++) {
        final imageFileListt = imageFileList[i];
        setState(() {
          jjjj = imageFileListt.path;
          ppp = jjjj;
        });
        print('this string is $imageFileListt at the $i index');
      }
      print(imageFileList.length);
      print(imageFileList.remove(0));
      setState(() {
        ppp1 = imageFileList.elementAt(0);
      });
      setState(() {
        hhh1 = imageFileList.elementAt(1);
      });
      setState(() {
        qqq1 = imageFileList.elementAt(2);
      });
    } else {
      print("navneet11");
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    // print(imageFileList.map((e) => e.path));
    // print(_currentIndex);
    print(imageFileList.length);
    // print(imageFileList.removeAt(index));
    // imageFileList.map((element) {
    //   // get index
    //   var index = imageFileList.indexOf(element);
    //   return Text(imageFileList.removeAt(index).path);
    // }).toList();
    // var ggg = imageFileList.map((e) => e.path);
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Images Screen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),

                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   child: Image.file(File(imageFileList[0].path)),
                      //   color: Colors.amber,
                      // ),
                      // Container(
                      //   child: Image.file(
                      //       File(imageFileList.map((e) => e).toString())),
                      //   height: 100,
                      //   width: 100,
                      // ),

                      Stack(
                        children: [
                          Container(
                            child: ppp1 != null
                                ? Image.file(File(
                                    ppp.toString(),
                                  ))
                                : Container(
                                    child: IconButton(
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        enableFeedback: false,
                                        mouseCursor: null,
                                        onPressed: () {
                                          // getImage();
                                          // showModalBottomSheet(
                                          //     shape: const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.vertical(
                                          //             top: Radius.circular(
                                          //                 25.0))),
                                          //     context:
                                          //         context,
                                          //     builder:
                                          //         ((builder) =>
                                          //             bottomSheet2()));
                                        },
                                        icon: Icon(Icons.add_photo_alternate),
                                        iconSize: 20,
                                        color: Colors.white),
                                  ),
                            height: ScreenSize.size.height * 0.08,
                            width: ScreenSize.size.width * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0)),
                                // color: Color.fromARGB(255, 247, 237, 231),
                                color: Colors.grey[300]),
                          ),
                          Container(
                            // color: Colors.amber,
                            height: ScreenSize.size.height * 0.08,
                            width: ScreenSize.size.width * 0.10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      // color: Colors
                                      //     .red,
                                      height: ScreenSize.size.height * 0.025,
                                      width: ScreenSize.size.width * 0.055,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            jjjj = imageFileList.removeAt(0);
                                            ppp = jjjj;
                                          });
                                          // print(imageFileList
                                          //     .length);
                                          // for (var i =
                                          //         0;
                                          //     i < imageFileList.length;
                                          //     i++) {}
                                        },
                                        child: Icon(
                                          Icons.highlight_remove,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: ScreenSize.size.height * 0.08,
                        width: ScreenSize.size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                            // color: Color.fromARGB(255, 247, 237, 231),
                            color: Colors.grey[300]),
                        child: hhh1 != null
                            ? Image.file(File(
                                jjjj.toString(),
                              ))
                            : Container(
                                child: IconButton(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    enableFeedback: false,
                                    mouseCursor: null,
                                    onPressed: () {
                                      // getImage();
                                      // showModalBottomSheet(
                                      //     shape: const RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.vertical(
                                      //             top: Radius.circular(
                                      //                 25.0))),
                                      //     context:
                                      //         context,
                                      //     builder:
                                      //         ((builder) =>
                                      //             bottomSheet2()));
                                    },
                                    icon: Icon(Icons.add_photo_alternate),
                                    iconSize: 20,
                                    color: Colors.white),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: qqq1 != null
                            ? Image.file(File(
                                jjjj.toString(),
                              ))
                            : Container(
                                height: ScreenSize.size.height * 0.08,
                                width: ScreenSize.size.width * 0.10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0)),
                                    // color: Color.fromARGB(255, 247, 237, 231),
                                    color: Colors.grey[300]),
                                child: IconButton(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    enableFeedback: false,
                                    mouseCursor: null,
                                    onPressed: () {
                                      // getImage();
                                      // showModalBottomSheet(
                                      //     shape: const RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.vertical(
                                      //             top: Radius.circular(
                                      //                 25.0))),
                                      //     context:
                                      //         context,
                                      //     builder:
                                      //         ((builder) =>
                                      //             bottomSheet2()));
                                    },
                                    icon: Icon(Icons.add_photo_alternate),
                                    iconSize: 20,
                                    color: Colors.white),
                              ),
                        height: ScreenSize.size.height * 0.08,
                        width: ScreenSize.size.width * 0.10,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: ScreenSize.size.height * 0.08,
                        width: ScreenSize.size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                            // color: Color.fromARGB(255, 247, 237, 231),
                            color: Colors.grey[300]),
                        child: IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            mouseCursor: null,
                            onPressed: () {
                              // selectIamges();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Container(
                                        height: 120.0,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 20,
                                        ),
                                        child: Column(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                OutlinedButton.icon(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      getImage();
                                                      // chooseImage1("camera");
                                                    },
                                                    icon: Icon(Icons.camera),
                                                    label: Text("camera")),
                                                OutlinedButton.icon(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    selectIamges();
                                                    // chooseImage1("Gallery");
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
                            },
                            icon: Icon(Icons.add)),
                      )
                      // Container(
                      //     height: 50,
                      //     width: 100,
                      //     color: Colors.amber,
                      //     child: images != images
                      //         ? images.file(
                      //             File(imageFileList.elementAt(0).path),
                      //             height: 50,
                      //             width: 100,
                      //             fit: BoxFit.cover,
                      //           )
                      //         : Container(child: Text("fgsdfg"))),
                      // Container(
                      //     height: 50,
                      //     width: 100,
                      //     color: Colors.amber,
                      //     child: Container(
                      //       child: Image.file(
                      //         File(imageFileList[0].path).absolute,
                      //         height: 50,
                      //         width: 100,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     )),
                    ],
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
                color: Colors.amber,
                child: Text("Upload Images"),
                onPressed: () {
                  // uploadImage();
                  // longerway();
                  // shoetway();
                })
          ],
        ),
      ),
    );
  }
}
