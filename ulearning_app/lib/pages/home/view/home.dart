import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/pages/home/controller/home_controller.dart';
import 'package:ulearning_app/pages/home/view/widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: ref.read(homeScreenBannerDotsProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(ref),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh the homeCourseListProvider data
          await ref.refresh(homeCourseListProvider.future);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const HelloText(),
                const UserName(),
                SizedBox(height: 20.h),
                searchBar(),
                SizedBox(height: 20.h),
                HomeBanner(ref: ref, controller: _controller),
                const HomeMenuBar(),
                CourseItemGrid(ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
