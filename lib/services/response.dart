class ResponseError {
  Map<String, String> statusCode = {
    "400": "Missing or Malformed Token",
    "401": "Invalid or expired Token",
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
