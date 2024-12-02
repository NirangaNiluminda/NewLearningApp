import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/pages/course_detail/repo/course_detail_repo.dart';

part 'course_detail_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = 1;

  try {
    final response = await CourseDetailRepo.courseDetail(params: courseRequestEntity);

    if (response.code == 200) {
      return response.data;
    } else {
      print('Request failed with status code: ${response.code}');
      return null;
    }
  } catch (e) {
    print('Error fetching course details: $e');
    return null;
  }
}

class CourseDetailControllerRef {
}
