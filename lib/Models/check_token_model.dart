import 'package:cosplay_vn/Models/user_info_model.dart';

const String kProvider = "provider";
const String kAccessToken = "access_token";
const String kFollowing = "following";
const String kToken = "token";
const String kUser = "user";

class CheckTokenRequest {
  late String provider;
  late String token;

  CheckTokenRequest({required this.provider, required this.token});

  Map<String, dynamic> toJson() => {
        kProvider: provider,
        kAccessToken: token,
      };
}

class CheckTokenResponse {
  late String token;
  late User user;
  late List<dynamic> following;

  CheckTokenResponse(
      {required this.following, required this.token, required this.user});

  factory CheckTokenResponse.fromJson(Map<dynamic, dynamic> json) {
    return CheckTokenResponse(
      following: ((json[kFollowing] ?? []) as List)
          .map((follow) => follow)
          .toList(),
      token: json[kToken] ?? "",
      user: User.fromJson(json[kUser] ?? {}),
    );
  }
}
