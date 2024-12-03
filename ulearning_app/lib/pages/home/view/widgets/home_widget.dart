import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/controller/home_controller.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({Key? key, required this.controller, required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        //dots
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(20.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w))),
        )
      ],
    );
  }
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure that 'name' is not null, otherwise use a fallback value.
    String name = Global.storageServices.getUserProfile().name ?? 'Guest';

    return Container(
      child: text24Normal(
        text: name,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: "Hello, ",
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppImage(width: 18.w, height: 12.h, imagePath: ImageRes.menu),
          profileState.when(
              data: (value) {
                // Check if avatar is null before using it
                String avatarUrl = value.avatar ??
                    ''; // Default to empty string if avatar is null
                return GestureDetector(
                  child: AppBoxDecorationImage(
                    imagePath: "${AppConstants.SERVER_API_URL}$avatarUrl",
                  ),
                );
              },
              error: (err, stack) => AppImage(
                  width: 18.w, height: 12.h, imagePath: ImageRes.profile),
              loading: () => Container())
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "choice your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See all",
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        //course item button
        Row(
          children: [
            Container(
              decoration:
                  appBoxShadow(color: AppColors.primaryElement, radius: 7.w),
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
              child: const Text11Normal(
                text: "All",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                  text: "Popular", color: AppColors.primaryThreeElementText),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                  text: "Newest", color: AppColors.primaryThreeElementText),
            ),
          ],
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;

  const CourseItemGrid({Key? key, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
      child: courseState.when(
        data: (data) => GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.6,
          ),
          itemCount: data?.length,
          itemBuilder: (_, int index) {
            return AppBoxDecorationImage(
              imagePath:
                  "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail!}",
              fit: BoxFit.fitWidth,
              courseItem: data[index],
              func: () {
                Navigator.of(context).pushNamed("/courseDetail", arguments: {
                  "id": data[index].id!
                });
              },
            );
          },
        ),
        error: (error, stackTrace) {
          return const Center(child: Text("Error loading"));
        },
        loading: () => const Center(child: Text("Loading...")),
      ),
    );
  }
}



// class CourseItemGrid extends StatelessWidget {
//   final WidgetRef ref;
//   const CourseItemGrid({Key? key, required this.ref}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final courseState = ref.watch(homeCourseListProvider);
    
//     return courseState.when(
      
//       data: (data) {
//         // Print the data to the console
//         print('Course Data: $data');
        
//         // You can also print the specific fields if it's a structured object
//         // If 'data' is a list of courses, you can print each item
//         if (data is List) {
//           for (var item in data!) {
//             print('Course Item: $item');
//           }
//         }

//         return Container(
//           child: GridView.builder(
//             physics: ScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 40,
//               mainAxisSpacing: 40,
//             ),
//             itemCount: data?.length, // Assuming 'data' is a list of courses
//             itemBuilder: (_, int index) {
//               // Customize the display for each course item
//               return appImage(); // Replace with your actual widget to display course item
//             },
//           ),
//         );
//       },
//       error: (error, stackTrace) {
//         print('Error: $error');
//         print('StackTrace: $stackTrace');
//         return const Center(child: Text("Error loading"));
//       },
//       loading: () => Center(child: Text("Loading11...")),
//     );
//   }
// }
