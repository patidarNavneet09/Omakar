import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import '../Constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image1;
  String message = '';
  var image;
  final _picker = ImagePicker();
  //replace the url by your url

  bool loading = false;
  Future getImage() async {
    final PickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    // print("dfsdfsdf");
    if (PickedFile != null) {
      image1 = File(PickedFile.path);

      print("fgsfhfhfhfhfhfhdbvh${image1}");
      setState(() {});
    } else {
      print("Image no Selecteed");
    }
  }

  Future<void> uploadImage() async {
    var stream = new http.ByteStream(image1!.openRead());
    //  ..headers.addAll(headers)
    stream.cast();
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    var length = await image1!.length();

    var uri = Uri.parse(
        "http://192.168.0.121:8000/service-api/post-service-request/");

    var request = new http.MultipartRequest('POST', uri);

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print("${respStr}");
    if (response.statusCode == 200) {
      var data = response.headers;
      print("patidar");
      // print("image uploads");
    } else {
      print("faild");
    }
  }

  String url = "${AppConstants.BASE_URL}/service-api/post-service-request/";
  Future upload() async {
    // if (file == null) return;

    setState(() {
      loading = true;
    });
    Map<String, String> headers = {
      "Accept": "application/json",
      "Accesstoken":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczNjkwMjUxLCJpYXQiOjE2NzM2MDM4NTEsImp0aSI6IjJmMjJmZDk5ZTdiMzQ5NWNiNzJlNTY3NjMwMDdmNGE0IiwidXNlcl9pZCI6M30.PefBFkBF0344pmIkMxFvLcbk8a7R2UozS_FooGteNq4"
    };
    var uri = Uri.parse(url);
    var length = await image1!.length();
    print(length);
    http.MultipartRequest request = new http.MultipartRequest('POST', uri)
      ..headers.addAll(headers);

    request.fields['sub_service_uid'] = "9617828e-f12c-4bbf-89be-d301dfb439b3";
    request.fields['service_request_datetime'] = "2023-01-10 14:27:37.842002";
    request.fields['description'] = "gsfsdfgsfgs";
    request.fields['gala_uid'] = "a8a8d2b7-37ec-46b9-a996-7025e0dad184";
    var stream = new http.ByteStream(image1!.openRead());
    var multiport = new http.MultipartFile("image", stream, length);
    // print(request);
    request.files.add(multiport);
    var respons = await http.Response.fromStream(await request.send());
    print(respons.statusCode);
    setState(() {
      loading = false;
    });
    if (respons.statusCode == 201) {
      setState(() {
        message = ' image upload with success';
      });
      return;
    } else
      setState(() {
        message = ' image not upload';
      });
  }


  List<XFile> imageFileList = [];


// _savaimges(){
//   if(imageFileList !=null){
//     for(var i =0; i < imageFileList.length; i++){
//       ByteData byteData = await imageFileList[i].getb
//     }
//   }
// }











  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          loading
              ? Padding(
                  padding: EdgeInsets.only(top: 52),
                  child: Center(child: CircularProgressIndicator()),
                )
              : image1 != null
                  ? Image.file(
                      image1!,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
          Text(message),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () => getImage(),
                  child: Text('Pick Image'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => upload(),
                  child: Text('upload image'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
