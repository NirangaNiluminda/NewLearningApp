import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class CourseDetailsThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsThumbnail({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBoxDecorationImage(
        imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
        width: 325.w,
        height: 200.h,
        fit: BoxFit.fitWidth);
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIconText({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxShadow(radius: 7),
              child: Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.people),
                Text11Normal(
                  text:
                      "${courseItem.follow == null ? "0" : courseItem.follow.toString()}",
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.star),
                Text11Normal(
                  text:
                      "${courseItem.score == null ? "0" : courseItem.score.toString()}",
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name == null ? "No name found" : courseItem.name!,
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text11Normal(
              text: courseItem.description ?? "No description found",
              color: AppColors.primaryThreeElementText,
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: AppButton(buttonName: "Go buy"),
    );
  }
}

class CourseDetailsInclude extends StatelessWidget {
  const CourseDetailsInclude({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Text14Normal(
              text: "Course Includes",
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
            ),

            Container(
              child: Row(
                children: [
                  Container(
                    child: AppImage(imagePath: ImageRes.videoDetail,),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
