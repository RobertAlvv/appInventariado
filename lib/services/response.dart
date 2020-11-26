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
      String errorStatus = error.status(e.toString());
      return errorStatus;
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
      String errorStatus = error.status(e.toString());
      return errorStatus;
    }
  }

  Future<dynamic> requestPut(String route, List<dynamic> data) async {
    try {
      Response resp = await dio.put(
        route,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return resp;
    } catch (e) {
      String errorStatus = error.status(e.toString());
      return errorStatus;
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
      String errorStatus = error.status(e.toString());
      return errorStatus;
    }
  }
}

class ResponseError {
  Map<String, String> statusCode = {
    "400": "Missing or Malformed Token",
    "401": "Invalid or Expired Token",
    "404": "Resource Not Found",
    "409": "This Resourse Already Exists",
    "422": "Unprocessable Entity",
  };

  String status(String responseError) {
    for (var itemCode in statusCode.keys) {
      if (responseError.contains(itemCode)) {
        return statusCode[itemCode];
      }
    }
    return "Check Server Error 500";
  }
}
