import 'package:dio/dio.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);

    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      //print("app request data ${options.data}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("app response data ${response.data}");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      //print("app error data $e");
      ErrorEntity eInfo = createErrorEntity(e);
      onError(eInfo);
    }));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageServices.getUserToken();
    if (accessToken.isEmpty) {
      headers["Authorization"] = "Bearer $accessToken";
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);

    return response.data;
  }
}







class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception Code $code , $message";
  }
}

// ErrorEntity createErrorEntity(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return ErrorEntity(code: -1, message: "Connection Timeout");
//     case DioExceptionType.sendTimeout:
//       return ErrorEntity(code: -1, message: "Send Timeout");
//     case DioExceptionType.receiveTimeout:
//       return ErrorEntity(code: -1, message: "Receive Timeout");
//     case DioExceptionType.badCertificate:
//       return ErrorEntity(code: -1, message: "Bad SSL Certificate");
//     case DioExceptionType.badResponse:
//       print("bad response....");
//       switch (error.response!.statusCode) {
//         case 400:
//           return ErrorEntity(code: 400, message: "Request syntax error");
//         case 401:
//           return ErrorEntity(code: 401, message: "Unauthorized Access");
//         case 403:
//           return ErrorEntity(code: 403, message: "Forbidden Access");
//         case 404:
//           return ErrorEntity(code: 404, message: "Not Found");
//         case 409:
//           return ErrorEntity(code: 409, message: "Conflict");
//         case 422:
//           return ErrorEntity(code: 422, message: "Unprocessable Entity");
//         case 500:
//           return ErrorEntity(code: 500, message: "Internal Server Error");
//         default:
//           return ErrorEntity(code: -1, message: "Bad Response11");
//       }
      
//     case DioExceptionType.cancel:
//       return ErrorEntity(code: -1, message: "server Cancelled it");
//     case DioExceptionType.connectionError:
//       return ErrorEntity(code: -1, message: "Connection Error");
//     case DioExceptionType.unknown:
//       return ErrorEntity(code: -1, message: "Unknown Error");
//   }
// }





ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection Timeout");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send Timeout");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive Timeout");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL Certificate");
    case DioExceptionType.badResponse:
      print("bad response....");

      // Print full error details
      if (error.response != null) {
        print("Response Status Code: ${error.response!.statusCode}");
        print("Response Body: ${error.response!.data}");
        print("Response Headers: ${error.response!.headers}");
      }

      // Return the appropriate error message based on status code
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Request syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Unauthorized Access");
        case 403:
          return ErrorEntity(code: 403, message: "Forbidden Access");
        case 404:
          return ErrorEntity(code: 404, message: "Not Found");
        case 409:
          return ErrorEntity(code: 409, message: "Conflict");
        case 422:
          return ErrorEntity(code: 422, message: "Unprocessable Entity");
        case 500:
          return ErrorEntity(code: 500, message: "Internal Server Error");
        default:
          return ErrorEntity(code: -1, message: "Bad Response11");
      }
      
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "server Cancelled it");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection Error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown Error");
  }
}







void onError(ErrorEntity eInfo) {
  // Handle error here
  print("Error.code-> ${eInfo.code}, error.message-> ${eInfo.message}");
  switch (eInfo.code) {
    case 400:
      print("server syntax error");
      break;
    case 401:
      // Handle Unauthorized Access
      print("You are denied access");
      break;

    case 500:
      // Handle Internal Server Error
      print("Internal server error occurred.");
      
      break;

    default:
      // Handle Other Errors
      print("Unknown Error");
      break;
  }
}


// void onError(ErrorEntity eInfo) {
//   // Handle error here
//   print("Error.code-> ${eInfo.code}, error.massage-> ${eInfo.message}");
//   switch (eInfo.code) {
//     case 400:
//       print("server syntax error");
//       break;
//     case 401:
//       // Handle Unauthorized Access
//       print("Your are denied access");

//       break;

//     case 500:
//       // Handle Server Error
//       print("Internal server error");
      
//       break;
//     default:
//       // Handle Other Errors
//       print("Unknown Error");
//       break;
//   }
// }
