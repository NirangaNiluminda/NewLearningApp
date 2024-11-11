import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*prefered size method done is created the empty space and in the child write the text upside*/
// AppBar buildAppBar() {
//   return AppBar(
//     bottom: PreferredSize(
//       child: Container(
//         color: Colors.grey.withOpacity(0.3),
//         height: 1,
//       ),
//       preferredSize: Size.fromHeight(1),
//     ),
//     title: text16Normal(text: "Login", color: AppColors.primaryText),
//   );
// }

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.w, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Image.asset(
          imagePath,
        )),
  );
}


