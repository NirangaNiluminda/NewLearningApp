import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';

Widget appButton(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true,
    BuildContext? context,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: Text16Normal(
              text: buttonName,
              color: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText)),
    ),
  );
}
