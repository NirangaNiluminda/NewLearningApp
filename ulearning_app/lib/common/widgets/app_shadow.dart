import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder, BorderRadius? borderRadius,

}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
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
  const AppBoxDecorationImage(
      {Key? key,
      this.width = 30,
      this.height = 30,
      this.imagePath = ImageRes.profilePhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(20.w)),
    );
  }
}
