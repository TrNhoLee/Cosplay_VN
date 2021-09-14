import 'package:cosplay_vn/Commons/Services/CommonApiServices.dart';
import 'package:cosplay_vn/Commons/Services/CosplayApiResponce.dart';

class CosplayApiServices extends CommonApiServices<CosplayApiResponce> {
  @override
  CosplayApiResponce fromJson(json) {
    return CosplayApiResponce.fromJson(json);
  }
}
