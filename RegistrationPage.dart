import 'dart:convert';
import 'dart:io';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

String? DateValue1;
String? DateValue2;
String? DateValue3;
String selected = "first";

var date =
    "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}";

// Future<void> login22(
//   nameController,
//   lastNameController,
//   emailController,
//   phoneController,
//   addressController,
//   selectedvalue,
//   zipcodeController,
//   passwordController,
//   comfirmPasswordController,

// ) async {
//   try {
//     Response response = await post(
//         Uri.parse(
//             "https://2e38-103-241-22-82.in.ngrok.io/account-api/register-api/"),
//         body: {
//           "get_json":
//               '{"first_name":"${nameController}","last_name":"${lastNameController}","email":"${emailController}","phone":"${phoneController}","address":"${addressController}" , "city":"${selectedvalue}" , "zip_code":"${zipcodeController}" , "birth_date":"${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}" , "password":"${passwordController}" , "password2": "${comfirmPasswordController}" , "group":"1" , "company_uid" : "add48b04-731b-4d33-bc09-7ece4e8c979e" , "app_type" : "android" }'
//         });
//     print("response ${response.body}");
//     if (response.statusCode == 201) {
//       var data = jsonDecode(response.body.toString());
//       print(response.body);

//       print("account succeful");
//     } else {
//       print("faild");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

class _RegistrationState extends State<Registration> {
  get data1 => null;

  bool _autovalidate = false;

  Future<void> registred(
    nameController,
    passwordController,
    emailController,
    comfirmPasswordController,
    phoneController,
    lastNameController,
    addressController,
    selectedvalue,
    zipcodeController,
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
          Uri.parse("http://mayank1412.pythonanywhere.com/user/register/"),
          body: {
            "username": (nameController) + (" ") + (lastNameController),
            "password": passwordController,
            "email": emailController,
            "confirm_password": comfirmPasswordController,
            "phone": phoneController,
            "first_name": nameController,
            "last_name": lastNameController,
            "address": addressController,
            "city": selectedvalue,
            "zip_code": zipcodeController,
            "birth_date":
                "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}",
            // "group": 1.toString(),
          });
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        // print("Login " + data["refresh"]);
        print(data);
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/Drawer', (Route<dynamic> route) => false);

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

  Future<void> login22(
    nameController,
    lastNameController,
    emailController,
    phoneController,
    addressController,
    selectedvalue,
    zipcodeController,
    passwordController,
    comfirmPasswordController,
  ) async {
    try {
      Response response = await post(
          Uri.parse(
              "https://b1ec-103-241-22-82.ngrok.io/admin-api/get-tenant-users/?company_type=Omkar"),
          body: {
            "get_json":
                '{"first_name":"${nameController}","last_name":"${lastNameController}","email":"${emailController}","phone":"${phoneController}","address":"${addressController}" , "city":"${selectedvalue}" , "zip_code":"${zipcodeController}" , "birth_date":"${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}" , "password":"${passwordController}" , "password2": "${comfirmPasswordController}" , "group":"1" , "company_uid" : "add48b04-731b-4d33-bc09-7ece4e8c979e" , "app_type" : "android" }'
          });
      print(response.body);
      print(response.body);

      if (response.statusCode == 400) {
        var data = jsonDecode(response.body);
        print(data.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Drawer(), maintainState: false),
        );

        print("account succeful");
      } else {
        print("faild");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  late int selectedRadio;
  String? Year;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    myFocusNode = FocusNode();
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  final List<String> items = [
    'Pune',
    'Jaipur',
    'GOa',
    'New Delhi',
    'Lucknow',
    'Varanasi',
  ];
  String? selectedValue;
  String? DateValue1;
  String? DateValue2;
  String? DateValue3;
  String dropdownValue = 'City';
  bool isChecked = false;
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
//  Future<Welcome>? _welcome;
  late FocusNode myFocusNode;

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/omkar-logo 1.png",
        ),
        leadingWidth: ScreenSize.size.width,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: ScreenSize.size.height * 0.05,
          ),
          Card(
            shadowColor: Colors.blue[200],
            borderOnForeground: true,
            elevation: 15,
            margin: EdgeInsets.all(0),
            child: SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              // ignore: sort_child_properties_last
              child: Container(
                // height: ScreenSize.size.height * 0.814,
                width: ScreenSize.size.width,
                decoration: BoxDecoration(
                  color: Color(0xff0765A8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                ),
                child: Center(
                    child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenSize.size.height * 0.05,
                      ),
                      SizedBox(
                        // height: ScreenSize.size.height * 0.07,
                        width: ScreenSize.size.width * 0.40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Registration",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF),
                                fontFamily: 'Inter',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenSize.size.height * 0.02),
                            Text(
                              "Create your account",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF),
                                fontFamily: 'Inter',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        width: ScreenSize.size.width * 0.88,
                        child: Column(
                          children: [
                            // SizedBox(
                            //   // color: Colors.amber,
                            //   // width: ScreenSize.size.width * 0.78,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text(
                            //         "User Type:",
                            //         style: TextStyle(
                            //           fontSize: 17.0,
                            //           fontWeight: FontWeight.w500,
                            //           color: Color(0xffFFFFFF),
                            //           fontFamily: 'Inter',
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: ScreenSize.size.width * 0.039,
                            //       ),
                            //       Theme(
                            //         data: ThemeData(
                            //             unselectedWidgetColor: Colors.white),
                            //         child: Radio(
                            //           activeColor: Colors.white,
                            //           value: 1,
                            //           groupValue: selectedRadio,
                            //           onChanged: (val) {
                            //             print(" $val");
                            //             setSelectedRadio(val);
                            //           },
                            //         ),
                            //       ),
                            //       Text(
                            //         "Tenants",
                            //         style: TextStyle(
                            //           fontSize: 14.0,
                            //           fontWeight: FontWeight.w500,
                            //           color: Color(0xffFFFFFF),
                            //           fontFamily: 'Inter',
                            //         ),
                            //       ),
                            //       Theme(
                            //         data: ThemeData(
                            //             unselectedWidgetColor: Colors.white),
                            //         child: Radio(
                            //           hoverColor: Colors.white,
                            //           focusColor: Colors.white,
                            //           activeColor: Colors.white,
                            //           value: 2,
                            //           groupValue: selectedRadio,
                            //           onChanged: (val) {
                            //             print(" $val");
                            //             setSelectedRadio(val);
                            //           },
                            //         ),
                            //       ),
                            //       Text(
                            //         "Owner",
                            //         style: TextStyle(
                            //           fontSize: 14.0,
                            //           fontWeight: FontWeight.w500,
                            //           color: Color(0xffFFFFFF),
                            //           fontFamily: 'Inter',
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              width: ScreenSize.size.width * 0.96,
                              child: Container(
                                // color: Colors.amber,
                                height: ScreenSize.size.height * 0.12,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      // height: ScreenSize.size.height * 0.06,
                                      width: ScreenSize.size.width * 0.40,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              !RegExp(r'^[a-z,A-Z]+$')
                                                  .hasMatch(value)) {
                                            return "Enter your first name";
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: nameController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: "First Name",
                                          labelStyle: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.white),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      // height: ScreenSize.size.height * 0.06,
                                      width: ScreenSize.size.width * 0.44,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              !RegExp(r'^[a-z,A-Z]+$')
                                                  .hasMatch(value)) {
                                            return "Enter your last name";
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: lastNameController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: "Last Name",
                                          labelStyle: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.white),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.96,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: phoneController,
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
//                                       validator: {
// // Indian Mobile number are of 10 digit only
//     if (value.length != 10)
//       return 'Mobile Number must be of 10 digit';
//     else
//       return null;
                                    // }
                                    // validator: (value) {
                                    //   if (value!.length != 10 ||
                                    //       value.isEmpty) {
                                    //     return "Mobile Number must be of 10 digit";
                                    //   }
                                    //   return null;
                                    // },
                                    onChanged: (value) {
                                      formkey.currentState?.validate();
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter a phone number";
                                      } else if (!RegExp(
                                              r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                          .hasMatch(value)) {
                                        return "Please enter a correct phone number";
                                      }
                                    },
                                    // validator: (value) {
                                    //   if (value!.isEmpty ||
                                    //       !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                    //           .hasMatch(value)) {
                                    //     return "Please correct phone number";
                                    //   }
                                    // },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      labelText: "Phone",
                                      labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.96,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter a email address";
                                      } else if (!RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                          .hasMatch(value)) {
                                        return "Please enter a valid email address";
                                      }
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: emailController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.96,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    //   validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Enter a Email Address";
                                    //   } else if (!RegExp(
                                    //           r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    //       .hasMatch(value)) {
                                    //     return "Please enter a valid Email Addre";
                                    //   }
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter a password";
                                      } else if (value.length < 8) {
                                        return "Please enter password minimum 8 charecter ";
                                      }
                                      return null;
                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "Please enter your password";
                                    //   }
                                    //   return null;
                                    // },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: passwordController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      // errorStyle:
                                      //     TextStyle(color: Colors.orange),
                                      labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  // height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.96,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    validator: (val) {
                                      if (val!.isEmpty)
                                        return 'Please enter confrim password';
                                      if (val != passwordController.text)
                                        return 'Your password  not match';
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: comfirmPasswordController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      // errorBorder:,
                                      // errorStyle:
                                      //     TextStyle(color: Colors.orange),
                                      labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenSize.size.height * 0.01,
                                ),
                                Container(
                                  width: ScreenSize.size.width * 0.96,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of Birth",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                          canvasColor: Color(0xff0765A8),
                                        ),
                                        child: DropdownDatePicker(
                                          isExpanded: true,

                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                          ),

                                          inputDecoration: InputDecoration(
                                            iconColor: Colors.black,
                                            errorStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                          ), // optional

                                          isDropdownHideUnderline:
                                              false, // optional
                                          isFormValidator: true, // optional

                                          startYear: 1900, // optional
                                          endYear: 2050, // optional

                                          width: 06, // optional
                                          showMonth: true,

                                          // selectedDay: 01, // optional
                                          // selectedMonth: 01, // optional
                                          // selectedYear: 2023, // optional
                                          onChangedDay: (value) {
                                            setState(() {
                                              DateValue1 = value as String;
                                              print(DateValue1.toString());
                                            });
                                          },

                                          onChangedMonth: (value) {
                                            setState(() {
                                              DateValue2 = value as String;
                                              print(DateValue2.toString());
                                            });
                                          },
                                          onChangedYear: (value) {
                                            setState(() {
                                              DateValue3 = value as String;
                                              print(DateValue3.toString());
                                            });
                                          },

                                          // boxDecoration: BoxDecoration(
                                          //     border: Border.all(
                                          //         color: Colors.grey,
                                          //         width: 1.0)), // optional
                                          showDay: true, // optional
                                          dayFlex: 2, // optional
                                          monthFlex: 3,
                                          yearFlex: 3,
                                          locale: "en", // optional
                                          hintDay: '01',
                                          hintMonth: 'January',
                                          hintYear: '2023',

                                          hintTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                          // optional
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  // color: Colors.amber,
                                  height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.99,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your address ';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: addressController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: "Address",
                                      labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: ScreenSize.size.height * 0.08,
                                  width: ScreenSize.size.width * 0.90,
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        value: selectedValue,
                                        hint: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'City',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),

                                        focusColor: Colors.white,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          errorStyle:
                                              TextStyle(color: Colors.white),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        enableFeedback: false,

                                        borderRadius: BorderRadius.zero,
                                        onChanged: (salutation) => setState(
                                            () => selectedValue = salutation!),
                                        validator: (value) =>
                                            selectedValue == null
                                                ? 'please select city'
                                                : null,

                                        items: items
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                          );
                                        }).toList(),

                                        menuMaxHeight: 220,

                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 30,
                                        ),
                                        iconSize: 14,
                                        isDense: true,

                                        iconEnabledColor: Colors.white,
                                        // iconDisabledColor: Colors.grey,
                                        dropdownColor: Color(0xff0765A8),

                                        elevation: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   // color: Colors.amber,
                                //   height: ScreenSize.size.height * 0.06,
                                //   width: ScreenSize.size.width * 0.90,
                                //   child: DropdownButtonHideUnderline(
                                //     child: DropdownButton2(
                                //       disabledHint: Text("Please select city"),

                                //       // dropdownFullScreen: false,
                                //       // dropdownOverButton: true,
                                //       isDense: true,
                                //       dropdownOverButton: false,
                                //       dropdownFullScreen: false,

                                //       // isExpanded: true,
                                //       hint: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             'City',
                                //             style: TextStyle(
                                //               fontSize: 15,
                                //               fontWeight: FontWeight.w300,
                                //               color: Colors.white,
                                //             ),
                                //             overflow: TextOverflow.ellipsis,
                                //           ),
                                //         ],
                                //       ),

                                //       items: items
                                //           .map((item) =>
                                //               DropdownMenuItem<String>(
                                //                 value: item,
                                //                 child: Text(
                                //                   item,
                                //                   style: const TextStyle(
                                //                     fontSize: 15.0,
                                //                     fontWeight: FontWeight.w300,
                                //                     color: Colors.white,
                                //                     fontFamily: 'Inter',
                                //                   ),
                                //                   overflow:
                                //                       TextOverflow.ellipsis,
                                //                 ),
                                //               ))
                                //           .toList(),
                                //       value: selectedValue,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           selectedValue = value as String;
                                //           print(selectedValue.toString());
                                //         });
                                //       },

                                //       icon: const Icon(
                                //         Icons.arrow_drop_down,
                                //         size: 30,
                                //       ),
                                //       iconSize: 14,
                                //       iconEnabledColor: Colors.white,
                                //       iconDisabledColor: Colors.grey,
                                //       buttonHeight: 60,
                                //       buttonWidth: 30,
                                //       buttonPadding: const EdgeInsets.only(
                                //           left: 1, right: 1),
                                //       // buttonDecoration: BoxDecoration(
                                //       //   borderRadius: BorderRadius.circular(14),
                                //       //   border: Border.all(
                                //       //     color: Colors.black26,
                                //       //   ),
                                //       //   color: Colors.redAccent,
                                //       // ),

                                //       buttonElevation: 1,
                                //       itemHeight: 30,
                                //       itemPadding: const EdgeInsets.only(
                                //           left: 20, right: 20),
                                //       dropdownMaxHeight: 400,
                                //       dropdownWidth:
                                //           ScreenSize.size.width * 0.88,

                                //       dropdownPadding: null,
                                //       dropdownDecoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(14),
                                //         color: Color(0xff0765A8),
                                //       ),
                                //       dropdownElevation: 4,
                                //       scrollbarRadius:
                                //           const Radius.circular(40),
                                //       scrollbarThickness: 6,
                                //       scrollbarAlwaysShow: true,
                                //       // offset: const Offset(10, 20),
                                //     ),
                                //   ),
                                // ),
                                // Container(
                                //   height: ScreenSize.size.height * 0.04,
                                //   width: ScreenSize.size.width * 0.99,
                                //   child: Divider(
                                //     height: 4,
                                //     thickness: 1.2,
                                //     indent: 0,
                                //     endIndent: 0,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                Container(
                                  // color: Colors.amber,
                                  height: ScreenSize.size.height * 0.10,
                                  width: ScreenSize.size.width * 0.99,
                                  child: TextFormField(
                                    onFieldSubmitted: (value) {
                                      validate();
                                    },
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !RegExp(r"^[0-9][0-9\- ]{0,10}[0-9]$")
                                              .hasMatch(value)) {
                                        return "Please enter your zip-code";
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: zipcodeController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        labelText: "Zip-Code",
                                        labelStyle: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.white),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        fillColor: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.06,
                      ),
                      Container(
                        // color: Colors.amber,
                        // height: ScreenSize.size.height * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    //  height: ScreenSize.size.height * 0.05,
                                    width: ScreenSize.size.width * 0.65,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffFFFFFF),
                                            // side:
                                            //     BorderSide(color: Colors.white, width: 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.0))),
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff09618E),
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        onPressed: () async {
                                          validate();
                                          setState(() {
                                            _autovalidate =
                                                true; //enable realtime validation
                                          });
                                          // registred(
                                          //   nameController.text.toString(),
                                          //   passwordController.text.toString(),
                                          //   emailController.text.toString(),
                                          //   comfirmPasswordController.text
                                          //       .toString(),
                                          //   phoneController.text.toString(),
                                          //   lastNameController.text.toString(),
                                          //   addressController.text.toString(),
                                          //   selectedValue.toString(),
                                          //   zipcodeController.text.toString(),

                                          //   // "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}",
                                          // );
                                          // login22(
                                          //   nameController.text.toString(),
                                          //   lastNameController.text.toString(),
                                          //   emailController.text.toString(),
                                          //   phoneController.text.toString(),
                                          //   addressController.text.toString(),
                                          //   selectedValue.toString(),
                                          //   zipcodeController.text.toString(),
                                          //   // "${DateValue3.toString().padLeft(4, '0')}-${DateValue2.toString().padLeft(2, '0')}-${DateValue1.toString().padLeft(2, '0')}",
                                          //   passwordController.text.toString(),
                                          //   comfirmPasswordController.text
                                          //       .toString(),
                                          // );
                                        }))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.012,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                                fontFamily: 'Montserrat Alternates',
                                fontSize: 15,
                                color: Color(0xffFFFFFF)),
                          ),
                          InkWell(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat Alternates',
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/Login');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) {
                              //           return Login();
                              //         }),
                              //         maintainState: true));
                              //  showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return LinkSend();
                              //   });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.012,
                      ),
                    ],
                  ),
                )),
              ),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ),
        ]),
      ),
    );
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
        emailController.text.toString(),
        comfirmPasswordController.text.toString(),
        phoneController.text.toString(),
        lastNameController.text.toString(),
        addressController.text.toString(),
        selectedValue.toString(),
        zipcodeController.text.toString(),

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
