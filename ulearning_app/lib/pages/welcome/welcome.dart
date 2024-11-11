// ignore_for_file: sort_child_properties_last

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

import 'package:ulearning_app/pages/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //showing our three welcome pages
                  PageView(
                    onPageChanged: (value) {
                      ref.read(indexDotProvider.notifier).changeIndex(value);
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      //first page
                      AppOnboardingPage(
                          controller: _controller,
                          imagePath: ImageRes.reading,
                          title: "First See Learning",
                          subTitle:
                              "Forget about the paper, now learning all in one place",
                          index: 1,
                          context: context),
                      //second page
                      AppOnboardingPage(
                          controller: _controller,
                          imagePath: ImageRes.man,
                          title: "Connect with Everyone",
                          subTitle:
                              "Always keep in touch with your tutor and friends. Let's get connected.",
                          index: 2,
                          context: context),

                      AppOnboardingPage(
                          controller: _controller,
                          imagePath: ImageRes.boy,
                          title: "Always Fascinated Learning",
                          subTitle:
                              "Anywhere,anytime. The time is at your discretion. So study wherever you can.",
                          index: 3,
                          context: context),
                    ],
                  ),
                  //for showing dots
                  Positioned(
                    child: DotsIndicator(
                      position: index,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(20.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.w))),
                    ),
                    bottom: 50,
                    // left: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
