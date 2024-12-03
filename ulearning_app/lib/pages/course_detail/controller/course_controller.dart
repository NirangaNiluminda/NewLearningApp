// course_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/pages/course_detail/repo/course_repo.dart';

import '../../../common/models/course_entites.dart';

part 'course_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref, {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id  = index;
  final response = await CourseRepo.courseDetail(params: courseRequestEntity);

  if (response.code == 200) {
    return response.data;
  } else {
    print('Request failed with status code: ${response.code}');
    return null;
  }
}

@riverpod
Future<List<LessonItem>?> courseLessonListController(CourseLessonListControllerRef ref, {required int index}) async {
  // Create an instance of LessonRequestEntity
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  // Call the courseLessonList method with the correct parameter type
  final response = await CourseRepo.courseLessonList(params: lessonRequestEntity);

  // Check if the response is successful
  if (response.code == 200) {
    return response.data;  // Return the data from the response
  } else {
    print('Request failed with status code: ${response.code}');
    return null;
  }
}


