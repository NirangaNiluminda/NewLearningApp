
import 'package:ulearning_app/common/models/course_entites.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/utils/constants.dart';

// class CourseAPI {
//   static Future<CourseListRequestEntity> courseList() async {
//     var response = await HttpUtil().post('api/courseList');

//     return CourseListRequestEntity.fromJson(response);

//   }
// }
class CourseAPI {
  static Future<CourseListRequestEntity> courseList() async {
    print("Sending request to API..."); // Debug log before sending the request
    print('Base URL: ${AppConstants.SERVER_API_URL}');
    print('Requesting: ${AppConstants.SERVER_API_URL}api/courseList');

    var response = await HttpUtil().post('api/courseList');

    
    print(
        "Response received: $response"); // Debug log after receiving the response

    return CourseListRequestEntity.fromJson(response);
  }
}

// import 'package:ulearning_app/common/models/course_entites.dart';
// import 'package:ulearning_app/common/services/http_util.dart';

// class CourseAPI {
//   static Future<CourseListRequestEntity> courseList() async {
//     try {
//       var response = await HttpUtil().post('api/courseList');
//       print('API Response: $response'); // Debugging
      
//       return CourseListRequestEntity.fromJson(response);
//     } catch (e) {
//       print('API Error: $e');
//       rethrow; // Throw the error to handle it in the state
//     }
//   }
// }
