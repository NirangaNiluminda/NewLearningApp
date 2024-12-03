import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailsPage({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CourseDetailsThumbnail(courseItem: courseItem),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CourseDetailIconText(courseItem: courseItem),
                            CourseDetailDescription(courseItem: courseItem),
                            CourseDetailGoBuyButton(),
                            CourseDetailsInclude(courseItem: courseItem),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
      fit: BoxFit.fitWidth,
    );
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
                  text: "${courseItem.follow ?? 0}",
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
                  text: "${courseItem.score ?? 0}",
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
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
            text: courseItem.name ?? "No name found",
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text11Normal(
              text: courseItem.description ?? "No description found",
              color: AppColors.primaryThreeElementText,
            ),
          ),
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
  final CourseItem courseItem;
  const CourseDetailsInclude({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Course Includes",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 12.w),
          CourseInfo(
            imagePath: ImageRes.videoDetail,
            length: courseItem.video_len,
            infoText: "Hours Video",
          ),
          SizedBox(height: 16.w),
          CourseInfo(
            imagePath: ImageRes.fileDetail,
            length: courseItem.lesson_num,
            infoText: "Number of files",
          ),
          SizedBox(height: 16.w),
          CourseInfo(
            imagePath: ImageRes.downloadDetail,
            length: courseItem.down_num,
            infoText: "Number of items to download",
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;
  const CourseInfo({
    Key? key,
    required this.imagePath,
    this.length,
    this.infoText = "item",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: AppImage(
            imagePath: imagePath,
            width: 30,
            height: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            color: AppColors.primarySecondaryElementText,
            text: "${length ?? 0} $infoText",
          ),
        ),
      ],
    );
  }
}
class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  const LessonInfo({Key? key, required this.lessonData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14Normal(
            text: lessonData.isNotEmpty ? "Lesson List" : "Lesson List is Empty",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 20.h),
          lessonData.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessonData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 80.h,
                decoration: appBoxShadow(
                  radius: 10,
                  sR: 2,
                  bR: 3,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      "/lessonDetail",
                      arguments: {
                        "id": lessonData[index].id!,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      AppBoxDecorationImage(
                        imagePath:
                        "${AppConstants.IMAGE_UPLOADS_PATH}${lessonData[index].thumbnail}",
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text13Normal(
                              text: lessonData[index].name,
                            ),
                            Text10Normal(
                              text: lessonData[index].description ?? "",
                            ),
                          ],
                        ),
                      ),
                      AppImage(
                        imagePath: ImageRes.arrowRight,
                        width: 10.w,
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}


