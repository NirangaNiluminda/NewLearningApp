import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text box
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)),

        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: appImage(imagePath: ImageRes.searchIcon),
              
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(width: 240, height: 40, hintText: "Search your Courses..."),
            )
          ],
        ),
        
      ),
      //Search button

      GestureDetector(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 30.w,  //replace with 40.w if box is small
          height: 30.h, //replace with 40.w if box is small
          child: appImage(imagePath: ImageRes.searchButton),
          decoration: appBoxShadow(
            boxBorder: Border.all(color: AppColors.primaryElement)
          ),
        ),
      )
    ],
  );
}