import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Constants/app_constants.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;

  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      print(image);
      setState(() {});
    } else {
      print("no image selected");
    }
  }




  Future<void> uploadImage() async {
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    print(stream);
    var length = await image!.length();
    print(length);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MTA4MzUwLCJpYXQiOjE2NzQwMjE5NTAsImp0aSI6IjJjNjYxOWRkZjAwMTQyMGJhMjEzNzVlZGFlMzQ2ODUxIiwidXNlcl9pZCI6Mn0.sJEt9OlFsoH6f_fGWC-Y3qNdTsCA-hUgjoNPWOWHNc0'
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
    request.fields['description'] = "services data2";
    request.fields['gala_uid'] = "01d182af-72af-4f48-9576-b8393417b830";
    // request.headers['Authorization'] =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MTA4MzUwLCJpYXQiOjE2NzQwMjE5NTAsImp0aSI6IjJjNjYxOWRkZjAwMTQyMGJhMjEzNzVlZGFlMzQ2ODUxIiwidXNlcl9pZCI6Mn0.sJEt9OlFsoH6f_fGWC-Y3qNdTsCA-hUgjoNPWOWHNc0";

    var multiport = new http.MultipartFile('image', image!.openRead(), length);
    print(multiport);
    request.files.add(multiport);
    // var response = await request.send();

    var response = await http.Response.fromStream(await request.send());
    print(response.body);
    if (response.statusCode == 201) {
      
      print('image uploaded');
    } else {
      print('11111Faild uploaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uplpoad Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              child: image == null
                  ? Center(
                      child: Text('Pick Image'),
                    )
                  : Container(
                      child: Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
            ),
          ),
        
      
          SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
              child: Center(child: Text('Upload')),
            ),
          )
        ],
      ),
    );
  }
}
