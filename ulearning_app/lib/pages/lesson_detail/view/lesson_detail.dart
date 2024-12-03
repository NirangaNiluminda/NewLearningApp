import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/course_detail/controller/course_controller.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late String args; // Ensure args is explicitly a String

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"].toString(); // Convert to String for safe use in Text widget
  }

  @override
  Widget build(BuildContext context) {
    // Safely parse the string 'args' into an integer
    int lessonIndex;
    try {
      lessonIndex = int.parse(args); // Attempt to parse the string to an int
    } catch (e) {
      lessonIndex = 0; // Default to 0 if parsing fails
    }

    // Fetch lesson detail using Riverpod
    var lessonDetail = ref.watch(courseLessonListControllerProvider(index: lessonIndex));

    return Scaffold(
      appBar: AppBar(title: const Text("Lesson Detail")),
      body: Center(
        child: lessonDetail.when(
          data: (data) {
            // Check if data is not empty before accessing the first element
            if (data != null && data.isNotEmpty) {
              return Text(data!.elementAt(0).name.toString());
            } else {
              return const Text("No lessons available.");
            }
          },
          error: (error, traceStack) => Text(error.toString()), // Display error
          loading: () => const Text("Loading..."), // Loading state
        ),
      ),
    );
  }
}
