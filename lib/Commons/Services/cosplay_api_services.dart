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
        code: json[kCode],
        errors: json[kErrors],
        data: json[kData]);
  }
}

class CosplayException implements Exception {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  final List<CosplayError> errors;

  CosplayException({required this.errors});

  factory CosplayException.fromJson(List lst) {
    return CosplayException(
        errors: lst.map((errors) => CosplayError.fromJson(errors)).toList());
  }
}

class CosplayError {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kField = "field";
  static const kErrorMessage = "error_msg";
  static const kShowType = "show_type";

  late String? field;
  final String errorMsg;
  final int showType;

  CosplayError({this.field, required this.errorMsg, required this.showType});

  factory CosplayError.fromJson(Map<dynamic, dynamic> json) {
    return CosplayError(
        field: json[kField] ?? "",
        errorMsg: json[kErrorMessage] ?? "",
        showType: json[kShowType]);
  }
}
