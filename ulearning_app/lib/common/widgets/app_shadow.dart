import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../models/course_entites.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder, BorderRadius? borderRadius,

}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius.w),
      border: boxBorder,

      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
  Gradient? gradient,
  double? spreadRadius,
  double? blurRadius,
  Color shadowColor = Colors.black45,
  double? topLeftRadius,
  double? topRightRadius,
  double? bottomLeftRadius,
  double? bottomRightRadius,
}) {
  return BoxDecoration(
    color: color,
    gradient: gradient ??
        LinearGradient(
          colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC)
          ], // Purple to Blue gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ), // Default gradient if not provided
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(topLeftRadius ?? radius),
      topRight: Radius.circular(topRightRadius ?? radius),
      bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
      bottomRight: Radius.circular(bottomRightRadius ?? 0),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: shadowColor.withOpacity(0.1), // Subtle shadow effect
        spreadRadius: spreadRadius ?? sR,
        blurRadius: blurRadius ?? bR,
        offset: const Offset(0, 4), // Slight downward shadow for depth
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}
class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final Function()? func;

  const AppBoxDecorationImage({
    Key? key,
    this.width = 30,
    this.height = 30,
    this.imagePath = ImageRes.profilePhoto,
    this.fit = BoxFit.cover,
    this.courseItem,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: fit,
            image: NetworkImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: courseItem == null
            ? Container()
            : Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                courseItem!.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h),
              Text(
                "${courseItem!.lesson_num ?? 0} lessons",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10.sp,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(1, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



