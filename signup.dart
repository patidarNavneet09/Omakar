import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart%20';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  Future<void> registred(
    nameController,
    passwordController,
    comfirmPasswordController,
    emailController,
    phoneController,
    lastNameController,
    addressController,
    // selectedvalue,
    // zipcodeController,
  ) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      Response response = await post(
          Uri.parse("http://minkyaa.pythonanywhere.com/user/register/"),
          body: {
            "username": (nameController) + (" ") + (lastNameController),
            "password": passwordController,
            "confirm_password": comfirmPasswordController,
            "email": emailController,
            "phone": phoneController,
            "first_name": nameController,
            "last_name": lastNameController,
            "address": addressController,
            // "city": selectedvalue,
            // "zip_code": zipcodeController,
            // "birth_date":
            //     "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}",
            // "group": 1.toString(),
          });
      Navigator.of(context).pop();
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        // print("Login " + data["refresh"]);
        print(data);
        if (data["status"] == 201) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "${data["response"]}",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue[600],
          ));
        }
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);

        print("account succeful");
      } else {
        var data = jsonDecode(response.body.toString());
        print(data['response']["email"][0]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${data['response']["email"][0]}'),
          backgroundColor: Colors.blue[600],
        ));
        print("faild");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final passwordFocusNode1 = FocusNode();
  final passwordFocusNode2 = FocusNode();
  var _isObscured;
  var _isObscured1;
  final formkey = GlobalKey<FormState>();
  bool _autovalidate = false;
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    _isObscured = true;
    _isObscured1 = true;
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        // ),
        // body: Container(
        //   width: ScreenSize.size.width,
        //   height: ScreenSize.size.height,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Row(
        //         children: [Card()],
        //       )
        //     ],
        //   ),
        // ),
        body: Form(
      key: formkey,
      child: Container(
        width: ScreenSize.size.width,
        height: ScreenSize.size.height,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // width: ScreenSize.size.width,
                  // height: ScreenSize.size.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: ScreenSize.size.height * 0.10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // height: ScreenSize.size.height * 01.18,
                          width: ScreenSize.size.width * 0.92,
                          // color: Color(0xff09618E),
                          child: Card(
                              shadowColor: Colors.blue[300],
                              elevation: 17,
                              child: Column(
                                // mainAxisAlignment: M,
                                children: [
                                  SizedBox(
                                    height: ScreenSize.size.height * 0.030,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "First name",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.green,
                                        height: ScreenSize.size.height * 0.11,
                                        width: ScreenSize.size.width * 0.68,
                                        child: SizedBox(
                                          // color: Colors.green,
                                          width: ScreenSize.size.width * 0.50,
                                          // height: ScreenSize.size.height * 0.08,
                                          child: TextFormField(
                                            controller: nameController,
                                            textInputAction:
                                                TextInputAction.next,

                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty ||
                                                  !RegExp(r'^[a-z,A-Z]+$')
                                                      .hasMatch(value)) {
                                                return "Please enter first name";
                                              }
                                              return value.length > 25
                                                  ? 'Character must be less than 25 characters'
                                                  : null;
                                            },
                                            // autovalidateMode:
                                            //     AutovalidateMode.onUserInteraction,
                                            // controller: nameController,
                                            style:
                                                TextStyle(color: Colors.black),
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              // suffixIcon: Icon(
                                              //   Icons.person,
                                              //   color: Colors.black,
                                              // ),
                                              hintText:
                                                  "Please enter first name",
                                              // labelText: "First Name",
                                              hintStyle: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily: 'Inter',
                                              ),
                                              errorStyle:
                                                  TextStyle(color: Colors.red),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              // errorStyle: TextStyle(color: Colors.white),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black)),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Last name",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      controller: lastNameController,
                                      textInputAction: TextInputAction.next,

                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            !RegExp(r'^[a-z,A-Z]+$')
                                                .hasMatch(value)) {
                                          return "Please enter last name";
                                        }
                                        return value.length > 25
                                            ? 'Character must be less than 25 characters'
                                            : null;
                                      },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        // suffixIcon: Icon(
                                        //   Icons.person,
                                        //   color: Colors.white,
                                        // ),
                                        hintText: "Please enter last name",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: phoneController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      //  validateMobile(String value) {
                                      // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      // RegExp regExp = new RegExp(patttern);
                                      validator: (value) {
                                        String patttern =
                                            r'(^(?:[+0]9)?[0-9]$)';
                                        String patttern1 =
                                            r'(^(?:[+0]9)?[0-9]{4,14}$)';
                                        RegExp regExp = new RegExp(patttern);
                                        if (value == null ||
                                            value.isEmpty ||
                                            !RegExp(patttern1)
                                                .hasMatch(value)) {
                                          return (value == null ||
                                                  value.isEmpty ||
                                                  !RegExp(patttern1)
                                                      .hasMatch(value))
                                              ? 'Please enter mobile number '
                                              : 'Character must be less than 14 characters';
                                        }
                                        // if (value == null ||
                                        //     value.isEmpty ||
                                        //     !RegExp(patttern)
                                        //         .hasMatch(value)) {
                                        //   return 'Please enter mobile number ';
                                        // }
                                        return value.length == 14
                                            ? 'Character must be less than 14 characters'
                                            : null;
                                      },
                                      //  if (value == null ||
                                      //   value.isEmpty ||
                                      //   !RegExp(r'^[a-z,A-Z]+$')
                                      //       .hasMatch(value)) {
                                      // return "Please enter last name";
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "Please enter phone number";
                                      //   } else if (!RegExp(
                                      //           // r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$'
                                      //           r'(^(?:[+0]9)?[0-9]{10,12}$)'
                                      //           )
                                      //       .hasMatch(value)) {
                                      //     return "Please enter a correct phone number";
                                      //   }
                                      // },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.black),
                                      // keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        // suffixIcon: Icon(
                                        //   Icons.phone,
                                        //   color: Colors.black,
                                        // ),
                                        hintText: "Enter mobile number",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),

                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      controller: emailController,
                                      textInputAction: TextInputAction.next,

                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter email address";
                                        } else if (!RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value)) {
                                          return "Invalid email address";
                                        }
                                      },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                        ),
                                        hintText: "Enter email ",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Address",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      controller: addressController,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter your address ";
                                        }
                                        return null;
                                      },
                                      // validator: (value) {
                                      //   if (RegExp(r"\s")
                                      //       .hasMatch(value!)) {
                                      //     return "Please remove space";
                                      //   } else if (value.isEmpty) {
                                      //     return 'Please enter your address ';
                                      //   }
                                      //   return null;
                                      // },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        // suffixIcon: Icon(
                                        //   Icons.location_on_outlined,
                                        //   color: Colors.black,
                                        // ),
                                        hintText: "Enter address",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      controller: passwordController,
                                      textInputAction: TextInputAction.next,
                                      obscureText: _isObscured,
                                      focusNode: passwordFocusNode1,
                                      validator: (value) {
                                        if (RegExp(r"\s").hasMatch(value!)) {
                                          return "Please remove space";
                                        } else if (value.isEmpty) {
                                          return "Please enter  password";
                                        } else if (value.length < 8) {
                                          return " Enter minimum 8 character";
                                        }
                                        return null;
                                      },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscured = !_isObscured;
                                            });
                                          },
                                          icon: _isObscured
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off),
                                          color: Colors.black,
                                        ),
                                        hintText: "Enter password",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 9,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: ScreenSize.size.width * 0.68,
                                        child: Text(
                                          "Confirm password",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    height: ScreenSize.size.height * 0.11,
                                    width: ScreenSize.size.width * 0.68,
                                    child: TextFormField(
                                      obscureText: _isObscured1,
                                      controller: comfirmPasswordController,
                                      textInputAction: TextInputAction.next,
                                      validator: (val) {
                                        if (RegExp(r"\s").hasMatch(val!)) {
                                          return "Please remove space";
                                        } else if (val.isEmpty)
                                          return 'Please enter confirm password';
                                        if (val != passwordController.text)
                                          return 'Your password  not match';

                                        return (val == null ||
                                                val.length < 8 ||
                                                val != passwordController.text)
                                            ? ' Enter minimum 8 character '
                                            : null;
                                      },
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      // controller: nameController,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscured1 = !_isObscured1;
                                            });
                                          },
                                          icon: _isObscured1
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off),
                                          color: Colors.black,
                                        ),
                                        hintText: "Enter confirm password",
                                        // labelText: "First Name",
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        // errorStyle: TextStyle(color: Colors.white),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenSize.size.height * 0.020,
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(
                                            //   width:
                                            //       ScreenSize.size.width * 0.10,
                                            // ),
                                            Container(
                                              // color: Colors.amber,
                                              width:
                                                  ScreenSize.size.width * 0.73,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    // color: Colors.amber,
                                                    width:
                                                        ScreenSize.size.width *
                                                            0.53,
                                                    child: Column(
                                                      children: <Widget>[
                                                        ElevatedButton(
                                                          child: Container(
                                                            width: ScreenSize
                                                                    .size
                                                                    .width *
                                                                0.63,
                                                            child: Text(
                                                              "   Sign Up   ",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            validate();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    238,
                                                                    118,
                                                                    192),
                                                            onPrimary: Color(
                                                                0xff09618E),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32.0),
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ])),
            ],
          ),
        ),
      ),
    ));
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      print("ok");
//  String nameController,
//     passwordController,
//     emailController,
//     comfirmPasswordController,
//     phoneController,
//     lastNameController,
//     addressController,
//     selectedvalue,
//     zipcodeController,
      registred(
        nameController.text.toString(),
        passwordController.text.toString(),
        comfirmPasswordController.text.toString(),
        emailController.text.toString(),
        phoneController.text.toString(),
        lastNameController.text.toString(),
        addressController.text.toString(),
        // selectedValue.toString(),
        // zipcodeController.text.toString(),

        // "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}",
      );
    } else {
      print(" register validation error");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: const Text('error'),
      //   backgroundColor: Colors.green.shade300,
      // ));
    }
  }
}
