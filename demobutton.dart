// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// class butto extends StatefulWidget {
//   const butto({super.key});

//   @override
//   State<butto> createState() => _buttoState();
// }

// class _buttoState extends State<butto> {
//   final List<String> genderItems = [
//     'Male',
//     'Female',
//     'Female',
//     'Female',
//     'Female',
//   ];

//   String? selectedValue;

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     var ScreenSize = MediaQuery.of(context);
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: Container(
//             width: ScreenSize.size.width * 0.64,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 DropdownButtonFormField2(
//                   dropdownMaxHeight: 200,
//                   buttonDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: Color(0xff0060AF))),
//                   decoration: InputDecoration(
          
//         focusedErrorBorder: new OutlineInputBorder(
//             borderSide: new BorderSide(color: Colors.blue, width: 0.0),
//         ),
//                     errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xff0060AF))),
//                     //Add isDense true and zero Padding.
//                     //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
//                     isDense: true,

//                     contentPadding: EdgeInsets.zero,
//                     border: OutlineInputBorder(
//                         // borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(6)),
//                     //Add more decoration as you want here
//                     //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
//                   ),
//                   isExpanded: true,
//                   hint: const Text(
//                     'Please Select Request/Complaint',
//                     style: TextStyle(
//                         // fontSize: ScreenSize.size.width *
//                         //     0.035,
//                         color: Color.fromRGBO(0, 96, 175, 1)),
//                     textAlign: TextAlign.start,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   icon: const Icon(Icons.arrow_drop_down,
//                       color: Color(0xff0060AF)),
//                   iconSize: 20,
//                   buttonHeight: 28,
//                   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
//                   dropdownDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white),
//                   items: genderItems
//                       .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select request/ complain.';
//                     }
//                   },
//                   onChanged: (value) {
//                     //Do something when changing the item if you want.
//                   },
//                   onSaved: (value) {
//                     selectedValue = value.toString();
//                   },
//                 ),
//                 const SizedBox(height: 30),
//                 TextButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                     }
//                   },
//                   child: const Text('Submit Button'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
