// course_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ulearning_app/common/models/lesson_entities.dart';

import 'package:ulearning_app/pages/lesson_detail/repo/lesson_repo.dart';



part 'lesson_controller.g.dart';


@riverpod
Future<List<LessonItem>?> courseLessonDetailController(
    CourseLessonDetailControllerRef ref, {required int index}) async {

  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  // Call the courseLessonList method with the correct parameter type
  final response = await LessonRepo.courseLessonDetail(params: lessonRequestEntity);

  // Check if the response is successful
  if (response.code == 200) {
    return response.data;  // Return the data from the response
  } else {
    print('Request failed with status code: ${response.code}');
    return null;
  }
}
