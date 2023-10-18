import 'package:cosplay_vn/Commons/Services/common_api_services.dart';

class CosplayApiServices extends CommonApiServices<CosplayApiResponse> {
  @override
  CosplayApiResponse fromJson(json) {
    return CosplayApiResponse.fromJson(json);
  }
}

class CosplayApiResponse {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kCode = "error_code";
  static const kErrors = "error_msg";
  static const kData = "data";

  late int code;
  late dynamic errors;
  late dynamic data;

  // -------------------------------------------------------
  // Functions
  // -------------------------------------------------------
  CosplayApiResponse({required this.code, this.errors, this.data});

  factory CosplayApiResponse.fromJson(Map<dynamic, dynamic> json) {
    return CosplayApiResponse(
        code: json[kCode], errors: json[kErrors], data: json[kData]);
  }
}

class CosplayException {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kCode = "code";
  static const kErrorMessage = "error";

  late int code;
  final String errorMsg;

  CosplayException({required this.code, required this.errorMsg});

  factory CosplayException.fromJson(CosplayApiResponse response) {
    return CosplayException(
      code: response.code,
      errorMsg: response.errors,
    );
  }
}
