import 'package:dio/dio.dart';

class RequestBase {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNjA2NjgzOTAzLCJzdWIiOiJcdTAwMTcifQ.oHJBN34lO6ix-zmp2gq8rDkzHqA8Qa_0wv70gnQ4vbQ";

  BaseOptions baseOptions;

  Dio dio;

  RequestBase() {
    baseOptions = BaseOptions(
      baseUrl: "http://10.0.0.80:3000/api/v1",
      contentType: "application/json",
      headers: {"Authorization": "Bearer $token"},
    );

    dio = Dio(baseOptions);
  }

  ResponseError error = ResponseError();

  Future<dynamic> requestGet(String route) async {
    try {
      Response resp = await dio.get(
        route,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return resp;
    } catch (e) {
      final errorCode = error.status(e.toString());
      Response resp =
          Response(statusCode: (errorCode.keys).first, data: errorCode.values);
      return resp;
    }
  }

  Future<dynamic> requestPost(String route, Map<String, dynamic> data) async {
    try {
      Response resp = await dio.post(
        route,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return resp;
    } catch (e) {
      Map<int, String> errorCode = error.status(e.toString());
      Response resp =
          Response(statusCode: (errorCode.keys).first, data: errorCode.values);
      return resp;
    }
  }

  Future<dynamic> requestPut(
      String route, String id, Map<String, dynamic> data) async {
    try {
      Response resp = await dio.put(
        route,
        queryParameters: {"id": id},
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return resp;
    } catch (e) {
      final errorCode = error.status(e.toString());
      Response resp =
          Response(statusCode: (errorCode.keys).first, data: errorCode.values);
      return resp;
    }
  }

  Future<dynamic> requestDelete(String route, String id) async {
    try {
      Response resp = await dio.delete(
        route,
        queryParameters: {"id": id},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return resp;
    } catch (e) {
      final errorCode = error.status(e.toString());
      Response resp =
          Response(statusCode: (errorCode.keys).first, data: errorCode.values);
      return resp;
    }
  }
}

class ResponseError {
  Map<int, String> statusCode = {
    400: "Missing or Malformed Token",
    401: "Invalid or Expired Token",
    404: "Resource Not Found",
    405: "Method Not Allowed",
    409: "This Resourse Already Exists",
    422: "Unprocessable Entity",
  };

  Map<int, String> status(String responseError) {
    for (var itemCode in statusCode.keys) {
      if (responseError.contains((itemCode).toString())) {
        return {
          itemCode: statusCode[itemCode],
        };
      }
    }

    return {
      500: "Check Server Error 500",
    };
  }
}
