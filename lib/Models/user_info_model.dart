// class Post {
//   // -------------------------------------------------------
//   // Field defined
//   // -------------------------------------------------------
//   static const kId = "id";
//   static const kUserId = "user_id";
//   static const kTitle = "title";
//   static const kCover = "cover";
//   static const kSlug = "slug";
//   static const kDescription = "description";
//   static const kViews = "views";
//   static const kLike = "like";
//   static const kStatus = "status";
//   static const kCreatedAt = "created_at";
//   static const kUpdatedAt = "updated_at";
//   static const kImageQty = "image_qty";
//   static const kLiked = "liked";
//   static const kUserFullName = "user_fullname";
//   static const kUserUserName = "user_username";
//   static const kUserFrame = "user_frame";
//   static const kUsersLiked = "users_liked";
//
//   late int id;
//   late int userId;
//   late String title;
//   late String cover;
//   late String slug;
//   late String description;
//   late int views;
//   late int like;
//   late int status;
//   late DateTime createdAt;
//   late DateTime updatedAt;
//   late int imageQty;
//   late int liked;
//   late String userFullName;
//   late String userUserName;
//   late String userFrame;
//   late List<UserInfo> usersLiked;
//
//   Post({
//     id,
//     userId,
//     title,
//     cover,
//     slug,
//     description,
//     views,
//     like,
//     status,
//     createdAt,
//     updatedAt,
//     imageQty,
//     liked,
//     userFullName,
//     userUserName,
//     userFrame,
//     usersLiked,
//   }) {
//     this.id = id ?? 0;
//     this.userId = userId ?? 0;
//     this.title = title ?? "";
//     this.cover = cover ?? "";
//     this.slug = slug ?? "";
//     this.description = description ?? "";
//     this.views = views ?? 0;
//     this.like = like ?? 0;
//     this.status = status ?? 0;
//     this.createdAt = createdAt ?? DateTime.now();
//     this.updatedAt = updatedAt ?? DateTime.now();
//     this.imageQty = imageQty ?? 0;
//     this.liked = liked ?? 0;
//     this.userFullName = userFullName ?? "";
//     this.userUserName = userUserName ?? "";
//     this.userFrame = userFrame ?? "";
//     this.usersLiked = usersLiked ?? 0;
//   }
//
//   factory Post.fromJson(Map<dynamic, dynamic> json) {
//     return Post(
//       id: json[kId],
//       userId: json[kUserId],
//       title: json[kTitle],
//       cover: json[kCover],
//       slug: json[kSlug],
//       description: json[kDescription],
//       views: json[kViews],
//       like: json[kLike],
//       status: json[kStatus],
//       createdAt: DateTime.parse(json[kCreatedAt]),
//       updatedAt: DateTime.parse(json[kUpdatedAt]),
//       imageQty: json[kImageQty],
//       liked: json[kLiked],
//       userFullName: json[kUserFullName],
//       userUserName: json[kUserUserName],
//       userFrame: json[kUserFrame],
//       usersLiked: ((json[kUsersLiked] ?? []) as List)
//           .map((user) => UserInfo.fromJson(user))
//           .toList(),
//     );
//   }
// }

import 'package:cosplay_vn/Models/post_model.dart';

class UserInfo {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kUser = "user";
  static const kPosts = "posts";
  static const kFrames = "frames";

  late User user;
  late List<Frame> frames;
  late List<Post> posts;

  UserInfo({user, frames, posts}) {
    this.user = user ?? User();
    this.frames = frames ?? [];
    this.posts = posts ?? [];
  }

  factory UserInfo.fromJson(Map<dynamic, dynamic> json) {
    return UserInfo(
      user: json[kUser],
      frames: ((json[kPosts] ?? []) as List)
          .map((user) => UserInfo.fromJson(user))
          .toList(),
      posts: ((json[kFrames] ?? []) as List)
          .map((user) => UserInfo.fromJson(user))
          .toList(),
    );
  }
}

class User {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kId = "id";
  static const kName = "name";
  static const kLastName = "lastname";
  static const kDescription = "description";
  static const kEmail = "email";
  static const kUsername = "username";
  static const kAvatar = "avatar";
  static const kEmailVerifiedAt = "email_verified_at";
  static const kRememberToken = "remember_token";
  static const kCreatedAt = "created_at";
  static const kUpdatedAt = "updated_at";
  static const kStatus = "status";
  static const kPostCount = "post_count";
  static const kImageCount = "image_count";
  static const kFacebook = "facebook";
  static const kInstagram = "instagram";
  static const kGoogle = "google";
  static const kTwitter = "twitter";
  static const kCustomLink = "custom_link";
  static const kJobType = "job_type";

  late int id;
  late String name;
  late String lastName;
  late String description;
  late String email;
  late String username;
  late String avatar;
  late String emailVerifiedAt;
  late String rememberToken;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int status;
  late int postCount;
  late int imageCount;
  late String facebook;
  late String instagram;
  late String google;
  late String twitter;
  late String customLink;
  late int jobType;

  User({
    id,
    name,
    lastName,
    description,
    email,
    username,
    avatar,
    emailVerifiedAt,
    rememberToken,
    createdAt,
    updatedAt,
    status,
    postCount,
    imageCount,
    facebook,
    instagram,
    google,
    twitter,
    customLink,
    jobType,
  }) {
    this.id = id ?? 0;
    this.name = name ?? "";
    this.lastName = lastName ?? "";
    this.description = description ?? "";
    this.email = email ?? "";
    this.username = username ?? "";
    this.avatar = avatar ?? "";
    this.emailVerifiedAt = emailVerifiedAt ?? "";
    this.rememberToken = rememberToken ?? "";
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
    this.status = status ?? 0;
    this.postCount = postCount ?? 0;
    this.imageCount = imageCount ?? 0;
    this.facebook = facebook ?? "";
    this.instagram = instagram ?? "";
    this.google = google ?? "";
    this.twitter = twitter ?? "";
    this.customLink = customLink ?? "";
    this.jobType = jobType ?? 0;
  }

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json[kId],
      name: json[kName],
      lastName: json[kLastName],
      description: json[kDescription],
      email: json[kEmail],
      username: json[kUsername],
      avatar: json[kAvatar],
      emailVerifiedAt: json[kEmailVerifiedAt],
      rememberToken: json[kRememberToken],
      createdAt: DateTime.parse(json[kCreatedAt]),
      updatedAt: DateTime.parse(json[kUpdatedAt]),
      status: json[kStatus],
      postCount: json[kPostCount],
      imageCount: json[kImageCount],
      facebook: json[kFacebook],
      instagram: json[kInstagram],
      google: json[kGoogle],
      twitter: json[kTwitter],
      customLink: json[kCustomLink],
      jobType: json[kJobType],
    );
  }
}

class Frame {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kFrame = "frame";

  late String frame;

  Frame({frame}) {
    this.frame = frame ?? "";
  }

  factory Frame.fromJson(Map<dynamic, dynamic> json) {
    return Frame(
      frame: json[kFrame],
    );
  }
}
