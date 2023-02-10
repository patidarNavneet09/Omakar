import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Drawer.dart';
import '../Profile.dart';
import 'editprofile2.dart';
// import 'package:flutter_application_changesnew2/Drawer.dart';

class updateprofiledialog extends StatefulWidget {
  const updateprofiledialog({super.key});

  @override
  State<updateprofiledialog> createState() => _updateprofiledialogState();
}

class _updateprofiledialogState extends State<updateprofiledialog> {
  var user1;
  var data2;
  @override
  void initState() {
    super.initState();
    checkLogin12();
  }

  void checkLogin12() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    String? val3 = perf.getString("popup1");
    print(val3);
    setState(() {
      data2 = val3;
    });

    // print("${user1}");
    if (val3 != null) {}
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return AlertDialog(
      // contentPadding: EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile Update',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff09618E),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              "${data2.toString()}",
              style: TextStyle(
                // fontSize: 19.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            // InkWell(
            //   child: SelectableText.rich(TextSpan(
            //       // text: "${data2.toString().substring(64)}",
            //       style: TextStyle(color: Colors.blue))),
            // ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff0060AF),
                  // side:
                  //     BorderSide(color: Colors.white, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0))),
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Inter',
                ),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Editprofile(),
                //       maintainState: false),
                // );
                // Scaffold.of(context).openDrawer();
                // tooltip:
                // MaterialLocalizations.of(context).openAppDrawerTooltip;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Drawer1()),
                    (route) => false);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Editprofile(), maintainState: false),
                // );
              },
            )
          ],
        ),
      ],
    );
  }
}
