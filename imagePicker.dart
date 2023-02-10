import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart ' as http;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image1;
  File? image2;
  File? image6;
  File? images5;
  var val1;
  var val2;
  var val3;
  List<XFile> imageFileList = [];
  final _picker = ImagePicker();

  Future getImage() async {
    final XFile? PickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    // print("dfsdfsdf");
    if (PickedFile != null) {
      image1 = File(PickedFile.path);

      print("image1.....${image1}");
      setState(() {
        val1 = image1;
      });
    } else {
      print("Image no Selecteed");
    }
  }

  File? image9;
  File? image8;
  File? image7;
  void selectIamges() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      // print(selectedImages.map((e) => e.path));
      print("kkkkkkk${imageFileList.map((e) => e.path).toString()}");
      print("hhhhh${imageFileList[0].path}");
 
         if (selectedImages != null) {
      image2 = File(selectedImages[0].path);

      // print("image2.....${image1}");
      setState(() {
        val2 = image2;
      });
    }
    }

    if (selectedImages.map((e) => e.saveTo(images5.toString())) != null) {
      print("oye");
      // setState(() {
      //   images5 =
      //       selectedImages.map((e) => e.saveTo(images5.toString())) as File?;
      // });
    }
  }

  Future getImage2() async {
    final PickedFile1 =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    // print("dfsdfsdf");
    if (PickedFile1 != null) {
      image2 = File(PickedFile1.path);

      // print("image2.....${image1}");
      setState(() {
        val2 = image2;
      });
    } else {
      print("Image no Selecteed");
    }
  }

  

  final ImagePicker imagePicker = ImagePicker();
  // List<XFile> imageFileList = [];
  var images;
  var images1;
  var images2;
  void selectIamges1() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      print("kkkkkkk${imageFileList.map((e) => e.path).toString()}");
    }

    if (selectedImages.map((e) => e.saveTo(images.toString())) != null) {
      print("oye");
      setState(() {
        images = selectedImages.map((e) => e.saveTo(images.toString()));
      });
    }
  }

  Future<void> uploadImage() async {
    var stream = new http.ByteStream(images5!.openRead());
    stream.cast();

    var length = await images5!.length();

    var uri = Uri.parse("https://fakestoreapi.com/products");

    var request = new http.MultipartRequest('POST', uri);

    request.fields['sub_service_uid'] = "9617828e-f12c-4bbf-89be-d301dfb439b3";
    request.fields['service_request_datetime'] = "2023-01-10 14:27:37.842002";
    request.fields['description'] = "services data1";
    request.fields['gala_uid'] = "a8a8d2b7-37ec-46b9-a996-7025e0dad184";

    var multiport = new http.MultipartFile('image1', stream, length);
    // print(request);
    request.files.add(multiport);
    var response = await http.Response.fromStream(await request.send());
    print(response.body);
    print("${response}");
    if (response.statusCode == 200) {
      // var data = response.reasonPhrase;
      print(response);
      print("image uploads");
    } else {
      print("faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(val1);
    // print(val2);
    // print(val3);
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectIamges();
                      },
                      child: Container(
                        height: ScreenSize.size.height * 0.06,
                        width: ScreenSize.size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),

                            // color: Color.fromARGB(255, 247, 237, 231),
                            color: Colors.grey[300]),
                        child: image9 == null
                            ? Center(
                                child: Container(
                                  height: ScreenSize.size.height * 0.06,
                                  width: ScreenSize.size.width * 0.10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      // color: Color.fromARGB(255, 247, 237, 231),
                                      color: Colors.grey[300]),
                                  child: Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(
                                height: ScreenSize.size.height * 0.06,
                                width: ScreenSize.size.width * 0.10,
                                child: Center(
                                  child: Image.file(
                                    File(imageFileList
                                        .map((e) => e.path)
                                        .toString()),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage2();
                      },
                      child: Container(
                        height: ScreenSize.size.height * 0.06,
                        width: ScreenSize.size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),

                            // color: Color.fromARGB(255, 247, 237, 231),
                            color: Colors.grey[300]),
                        child:
                             Container(
                                height: ScreenSize.size.height * 0.06,
                                width: ScreenSize.size.width * 0.10,
                                child: Center(
                                  child: Image.file(
                                    File(imageFileList[0].path).absolute,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         getImage3();
                //       },
                //       child: Container(
                //         height: ScreenSize.size.height * 0.06,
                //         width: ScreenSize.size.width * 0.10,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(8.0),
                //                 topRight: Radius.circular(8.0),
                //                 bottomLeft: Radius.circular(8.0),
                //                 bottomRight: Radius.circular(8.0)),

                //             // color: Color.fromARGB(255, 247, 237, 231),
                //             color: Colors.grey[300]),
                //         child: image3 == null
                //             ? Center(
                //                 child: Container(
                //                   height: ScreenSize.size.height * 0.06,
                //                   width: ScreenSize.size.width * 0.10,
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.only(
                //                           topLeft: Radius.circular(8.0),
                //                           topRight: Radius.circular(8.0),
                //                           bottomLeft: Radius.circular(8.0),
                //                           bottomRight: Radius.circular(8.0)),
                //                       // color: Color.fromARGB(255, 247, 237, 231),
                //                       color: Colors.grey[300]),
                //                   child: Icon(
                //                     Icons.photo,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               )
                //             : Container(
                //                 height: ScreenSize.size.height * 0.06,
                //                 width: ScreenSize.size.width * 0.10,
                //                 child: Center(
                //                   child: Image.file(
                //                     File(image3!.path).absolute,
                //                     height: 100,
                //                     width: 100,
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            onPressed: () {
              uploadImage();
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
              child: Center(child: Text("upload")),
            ),
          )
        ],
      ),
    );
  }
}
