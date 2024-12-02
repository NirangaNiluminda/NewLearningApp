import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CourseDetailRepo {
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
}
