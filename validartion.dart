// import 'package:flutter/material.dart';

// class FormValidationWithDropdown extends StatefulWidget {
//   @override
//   _FormValidationWithDropdownState createState() =>
//       _FormValidationWithDropdownState();
// }

// class _FormValidationWithDropdownState
//     extends State<FormValidationWithDropdown> {
//   final _formKey = GlobalKey<FormState>();
//   bool _autovalidate = false;
//   String? selectedSalutation;
//   String? name;
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     var ScreenSize = MediaQuery.of(context);
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         // autovalidateMode: ,
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 height: ScreenSize.size.height * 0.07,
//                 width: ScreenSize.size.width * 0.64,
//                 decoration: BoxDecoration(
//                     // color: Colors.amber,
//                     border: Border.all(color: Color(0xff0060AF)),
//                     borderRadius: BorderRadius.circular(6)),
//                 child: DropdownButtonFormField<String>(
//                   value: selectedSalutation,
//                   hint: Text(
//                     'Salutation',
//                   ),
//                   onChanged: (salutation) =>
//                       setState(() => selectedSalutation = salutation),
//                   validator: (value) => value == null ? 'field required' : null,
//                   items: ['MR.', 'MS.']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     // color: Colors.amber,
//                     border: Border.all(color: Color(0xff0060AF)),
//                     borderRadius: BorderRadius.circular(6)),
//                 height: ScreenSize.size.height * 0.08,
//                 width: ScreenSize.size.width * 0.90,
//                 child: Center(
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButtonFormField<String>(
//                       value: selectedValue,
//                       hint: Row(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'City',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.black,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),

//                       focusColor: Colors.white,

//                       decoration: InputDecoration(
//                           isDense: true,
//                           border: InputBorder.none,
//                           errorStyle: TextStyle(color: Colors.black),
//                           errorBorder: InputBorder.none,
//                           focusedErrorBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white)),
//                           enabledBorder: InputBorder.none),
//                       enableFeedback: false,
//                       isExpanded: true,
//                       borderRadius: BorderRadius.zero,
//                       onChanged: (salutation) =>
//                           setState(() => selectedValue = salutation!),
//                       validator: (value) =>
//                           selectedValue == null ? 'please select city' : null,

//                       items: ["sfgsdf"]
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: const TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.black,
//                               fontFamily: 'Inter',
//                             ),
//                           ),
//                         );
//                       }).toList(),

//                       menuMaxHeight: 220,

//                       icon: const Icon(
//                         Icons.arrow_drop_down,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//                       iconSize: 14,
//                       isDense: true,

//                       iconEnabledColor: Colors.white,
//                       // iconDisabledColor: Colors.grey,
//                       dropdownColor: Color(0xff0765A8),

//                       elevation: 6,
//                     ),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(hintText: 'Name'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Name is required' : null,
//                 onSaved: (value) => name = value,
//               ),
//               ElevatedButton(
//                 child: Text('PROCEED'),
//                 // color: Colors.green,
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     //form is valid, proceed further
//                     _formKey.currentState!
//                         .save(); //save once fields are valid, onSaved method invoked for every form fields

//                   } else {
//                     setState(() {
//                       _autovalidate = true; //enable realtime validation
//                     });
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
