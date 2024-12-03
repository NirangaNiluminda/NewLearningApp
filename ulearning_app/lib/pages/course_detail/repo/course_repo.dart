import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CourseRepo {
  static Future<CourseDetailResponseEntity> courseDetail({
    CourseRequestEntity? params,
  }) async {
    try {
      var response = await HttpUtil().post(
        "api/courseDetail",
        queryParameters: params?.toJson(),
      );
      return CourseDetailResponseEntity.fromJson(response);
    } catch (e) {
      throw Exception("Failed to fetch course details: $e");
    }
  }

  static Future<LessonListResponseEntity> courseLessonList({
    required LessonRequestEntity params,  // Expecting LessonRequestEntity here
  }) async {
    try {
      // Sending LessonRequestEntity as query parameters
      var response = await HttpUtil().post(
        "api/lessonList",
        queryParameters: params.toJson(),  // Serialize the LessonRequestEntity to JSON
      );

      // Mapping the response to LessonListResponseEntity
      return LessonListResponseEntity.fromJson(response);
    } catch (e) {
      throw Exception("Failed to fetch course details: $e");
    }
  }



}
