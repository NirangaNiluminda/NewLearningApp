import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/pages/course_detail/controller/course_controller.dart';
import 'package:ulearning_app/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late String args; // Ensure args is explicitly a String
  late var arg;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = ModalRoute.of(context)!.settings.arguments as Map;
    arg = id["id"];
    //args = id["id"].toString(); // Convert to String for safe use in Text widget
  }

  @override
  Widget build(BuildContext context) {
    /*var lessionDetails = ref.watch(lessonDetailControllerProvider(index: arg.toInt()));*/
    var lessonData = ref.watch(lessonDataControllerProvider);
    // Safely parse the string 'args' into an integer
    // int lessonIndex;
    // try {
    //   lessonIndex = int.parse(args); // Attempt to parse the string to an int
    // } catch (e) {
    //   lessonIndex = 0; // Default to 0 if parsing fails
    // }

    // // Fetch lesson detail using Riverpod
    // var lessonDetail =
    //     ref.watch(courseLessonListControllerProvider(index: lessonIndex));

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Lesson Detail")),
    //   body: Center(
    //     child: lessonDetail.when(
    //       data: (data) => Column(
    //         children: [
    //           if (data != null && data.isNotEmpty)
    //             Text(data
    //                 .elementAt(0)
    //                 .name
    //                 .toString()) // Display the first lesson's name
    //           else
    //             const Text("No lessons available."),
    //         ],
    //       ),
    //       error: (error, traceStack) => Text(error.toString()), // Display error
    //       loading: () => const Text("Loading..."), // Loading state
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: lessonData.when(
              data: (data) => Container(
                width: 325.w,
                height: 200.h,
                child: FutureBuilder(future: data.initializeVideoPlayer,
                    builder: (context,snapshot){
                     if(snapshot.connectionState== ConnectionState.done){
                       return  videoPlayerController==null?Container():Stack(
                         children: [
                           VideoPlayer(videoPlayerController!),

                         ],
                       );
                     }else{
                       return const Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                    }
                    ),
              ),
              error: (error, traceStack) => Text(error.toString()),
              loading: () => const Text("Loading...")),
        ),
      ),
    );
  }
}
