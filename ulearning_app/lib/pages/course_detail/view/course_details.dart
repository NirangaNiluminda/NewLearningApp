import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/pages/course_detail/controller/course_detail_controller.dart';
import 'package:ulearning_app/pages/course_detail/view/widget/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];
    //print(args);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));

    return Scaffold(
      appBar: buildGlobalAppBar(title: "Course Detail"),
      body: stateData.when(
          data: (data) => data == null
              ? SizedBox()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CourseDetailsThumbnail(courseItem: data)
                  ],
                ),
          error: (error, traceStack) => Text("Error Loading the data"),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
