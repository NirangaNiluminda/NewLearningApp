import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/services/http_util.dart';

// class CourseAPI {
//   static Future<CourseListRequestEntity> courseList() async {
//     var response = await HttpUtil().post('api/courseList');

//     return CourseListRequestEntity.fromJson(response);
//   }
// }

// import 'package:ulearning_app/common/models/course_entites.dart';
// import 'package:ulearning_app/common/services/http_util.dart';

class CourseAPI {
  static Future<CourseListRequestEntity> courseList() async {
    try {
      var response = await HttpUtil().post('api/courseList');
      print('API Response: $response'); // Debugging
      
      return CourseListRequestEntity.fromJson(response);
    } catch (e) {
      print('API Error: $e');
      rethrow; // Throw the error to handle it in the state
    }
  }
}
