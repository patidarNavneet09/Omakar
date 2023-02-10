// Row(
//  mainAxisAlignment:
//  MainAxisAlignment.spaceBetween,
//  children: <Widget>[
//  Text(
//  "Request:-",
//  style: TextStyle(
//  letterSpacing: 1.2,
//  fontSize: 13.0,
//  fontWeight: FontWeight.w700,
//  color: Colors.black,
//  fontFamily: 'Inter',
//  ),
//  ),
//  // SizedBox(
//  // width: ScreenSize.size.width *
//  // 0.020,
//  // ),
//  Container(
//  height: ScreenSize.size.height *
//  0.04,
//  width: ScreenSize.size.width *
//  0.63,
//  decoration: BoxDecoration(
//  border: Border.all(
//  color:
//  Color(0xff0060AF)),
//  borderRadius:
//  BorderRadius.circular(
//  6)),
//  child: Padding(
//  padding:
//  const EdgeInsets.all(2.0),
//  child:
//  DropdownButtonHideUnderline(
//  child: ButtonTheme(
//  alignedDropdown: true,
//  child: DropdownButton2(
//  hint: Text(
//  'Please select Request/complaint',
//  style: TextStyle(
//  fontSize: 12,
//  color: Color
//  .fromRGBO(
//  0,
//  96,
//  175,
//  1)),
//  ),
//  items: items
//  .map((items) =>
//  DropdownMenuItem<
//  String>(
//  value: items,
//  child: Text(
//  items,
//  textAlign:
//  TextAlign
//  .justify,
//  style: TextStyle(
//  color: Color(
//  0xff0060AF,
//  ),
//  fontSize: 12),
//  ),
//  ))
//  .toList(),
//  value: selectedValue1,
//  onChanged: (value) {
//  setState(() {
//  selectedValue1 =
//  value as String;
//  });
//  },
//  itemPadding:
//  EdgeInsets.only(
//  left: 0),
//  // buttonHeight: 40,
//  // buttonWidth: 140,
//  // itemHeight: 40,
//  ),
//  ),
//  ),
//  ),
//  ),
//  ],
//  ),
//  SizedBox(
//  height:
//  ScreenSize.size.height * 0.02,
//  ),
//  Row(
//  mainAxisAlignment:
//  MainAxisAlignment.spaceBetween,
//  children: <Widget>[
//  Text(
//  "Gala No:-",
//  style: TextStyle(
//  letterSpacing: 1.2,
//  fontSize: 13.0,
//  fontWeight: FontWeight.w700,
//  color: Colors.black,
//  fontFamily: 'Inter',
//  ),
//  ),
//  // SizedBox(
//  // width: ScreenSize.size.width *
//  // 0.020,
//  // ),
//  Container(
//  height: ScreenSize.size.height *
//  0.04,
//  width: ScreenSize.size.width *
//  0.63,
//  decoration: BoxDecoration(
//  border: Border.all(
//  color:
//  Color(0xff0060AF)),
//  borderRadius:
//  BorderRadius.circular(
//  6)),
//  child: Padding(
//  padding:
//  const EdgeInsets.all(2.0),
//  child:
//  DropdownButtonHideUnderline(
//  child: ButtonTheme(
//  alignedDropdown: true,
//  child: DropdownButton2(
//  hint: Text(
//  'Please select gala number',
//  style: TextStyle(
//  fontSize: 12,
//  color: Color
//  .fromRGBO(
//  0,
//  96,
//  175,
//  1)),
//  ),
//  items: items1
//  .map((items1) =>
//  DropdownMenuItem<
//  String>(
//  value: items1,
//  child: Text(
//  items1,
//  textAlign:
//  TextAlign
//  .justify,
//  style: TextStyle(
//  color: Color(
//  0xff0060AF,
//  ),
//  fontSize: 12),
//  ),
//  ))
//  .toList(),
//  value: selectedValue2,
//  onChanged: (value) {
//  setState(() {
//  selectedValue2 =
//  value as String;
//  });
//  },
//  itemPadding:
//  EdgeInsets.only(
//  left: 30),
//  // buttonHeight: 40,
//  // buttonWidth: 140,
//  // itemHeight: 40,
//  ),
//  ),
//  ),
//  ),
//  ),
//  ],
//  ),