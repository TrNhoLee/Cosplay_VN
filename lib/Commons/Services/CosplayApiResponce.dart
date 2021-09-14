class CosplayApiResponce {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  int errorCode;
  String errorMsg;
  dynamic data;

  // -------------------------------------------------------
  // Functions
  // -------------------------------------------------------
  CosplayApiResponce({this.errorCode, this.errorMsg, this.data});

  factory CosplayApiResponce.fromJson(Map<dynamic, dynamic> json) {
    return CosplayApiResponce(
      errorCode: json['error_code'],
      errorMsg: json['error_msg'].toString(),
      data: json['data'],
    );
  }
}
