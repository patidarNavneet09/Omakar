import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Drawer.dart';

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  late final _ratingController;
  late double _rating;

  // double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 1.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    print('Rating: ${_rating}');
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0XFFD9D9D9),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => Drawer1(), maintainState: false),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            // color: Color(0xff09618E),
            color: Colors.black,
          ),
        ),
        title: Text(
          'Rate Aap',
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
            // color: Color(0xff09618E),
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: ScreenSize.size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                textDirection:
                    _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // color: Colors.amber,
                        height: ScreenSize.size.height * 0.06,
                        width: ScreenSize.size.width,
                        child: Image.asset("assets/images/omkar-logo.png"),
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.05,
                      ),
                      Container(
                        child: Text(
                          'How Would You \n Rate Our Services Protocal',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 110, 190, 230),
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.05,
                      ),
                      _ratingBar(_ratingBarMode),
                      SizedBox(
                        height: ScreenSize.size.height * 0.05,
                      ),
                      Text(
                        'Rating: $_rating',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 108, 180, 215),
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.size.height * 0.05,
                      ),
                      MaterialButton(
                        color: Color.fromARGB(255, 50, 177, 240),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) =>
                          //       _buildPopupDialog(context),
                          // );
                        },
                        child: Text(
                          "sumbit",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Inter',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.blue.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.blue,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff09618E),
              fontFamily: 'Inter',
            ),
          ),
        ],
      );
}

Widget _buildPopupDialog(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(' Thank You !  '),
              // Image.asset(
              //   "assets/images/emoji.png",
              //   fit: BoxFit.fill,
              // )
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class IconAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Icon',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titlePadding: EdgeInsets.all(12.0),
      contentPadding: EdgeInsets.all(0),
      content: Wrap(
        children: [
          _iconButton(context, Icons.home),
          _iconButton(context, Icons.airplanemode_active),
          _iconButton(context, Icons.euro_symbol),
          _iconButton(context, Icons.beach_access),
          _iconButton(context, Icons.attach_money),
          _iconButton(context, Icons.music_note),
          _iconButton(context, Icons.android),
          _iconButton(context, Icons.toys),
          _iconButton(context, Icons.language),
          _iconButton(context, Icons.landscape),
          _iconButton(context, Icons.ac_unit),
          _iconButton(context, Icons.star),
        ],
      ),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon) => IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.pop(context, icon),
        splashColor: Colors.amberAccent,
        color: Colors.amber,
      );
}
