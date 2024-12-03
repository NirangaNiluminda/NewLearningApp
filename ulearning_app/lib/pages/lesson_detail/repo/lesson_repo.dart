import 'package:ulearning_app/common/models/lesson_entities.dart';

import '../../../common/services/http_util.dart';

class LessonRepo {
  static Future<LessonListResponseEntity> courseLessonDetail({
    LessonRequestEntity? params,
  }) async {
    try {
      var response = await HttpUtil().post(
        "api/lessonDetail",
        queryParameters: params?.toJson(),
      );
      return LessonListResponseEntity.fromJson(response);
    } catch (e) {
      throw Exception("Failed to fetch course details: $e");
    }
  }
}
