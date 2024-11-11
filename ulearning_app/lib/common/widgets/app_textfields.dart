import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appTextField(
    {TextEditingController? controller,
    String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          //crating the rows
          child: Row(
            children: [
              //for showing the icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              //for showing the text field
              appTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obscureText: obscureText),
            ],
          ),
        )
      ],
    ),
  );
}

// Widget appTextField({
//   TextEditingController? controller,
//   String text = "",
//   String iconName = "",
//   String hintText = "Type in your info",
//   bool obscureText = false,
//   void Function(String value)? func,
// }) {
//   return Container(
//     padding: EdgeInsets.only(left: 25.w, right: 25.w),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         text14Normal(text: text),
//         SizedBox(
//           height: 5.h,
//         ),
//         Container(
//           width: 325.w,
//           height: 50.h,
//           decoration: appBoxDecorationTextField(),
//           child: Row(
//             children: [
//               // Icon display
//               Container(
//                 margin: EdgeInsets.only(left: 17.w),
//                 child: appImage(imagePath: iconName),
//               ),
//               // TextField display
//               Expanded(
//                 child: appTextFieldOnly(
//                   controller: controller,
//                   hintText: hintText,
//                   func: func,
//                   obscureText: obscureText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obscureText = false,
}) {
  return SizedBox(
    width: width.w, //change the width as 280.w if box is small
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //Default border without any input
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),

      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText, //defaults set as false
    ),
  );
}
