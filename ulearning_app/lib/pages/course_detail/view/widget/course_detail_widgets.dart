import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';

class CourseDetailsThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsThumbnail({Key? key, required this.courseItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: AppBoxDecorationImage(
          imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
          width: 325.w,
          height: 200.h,
          fit: BoxFit.fitWidth),
    );
  }
}
