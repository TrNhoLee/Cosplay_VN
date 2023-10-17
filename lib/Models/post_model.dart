import 'package:cosplay_vn/Models/user_info_model.dart';

class Post {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static const kId = "id";
  static const kUserId = "user_id";
  static const kTitle = "title";
  static const kCover = "cover";
  static const kSlug = "slug";
  static const kDescription = "description";
  static const kViews = "views";
  static const kLike = "like";
  static const kStatus = "status";
  static const kCreatedAt = "created_at";
  static const kUpdatedAt = "updated_at";
  static const kImageQty = "image_qty";
  static const kLiked = "liked";
  static const kUserFullName = "user_fullname";
  static const kUserUserName = "user_username";
  static const kUserFrame = "user_frame";
  static const kUsersLiked = "users_liked";

  late int id;
  late int userId;
  late String title;
  late String cover;
  late String slug;
  late String description;
  late int views;
  late int like;
  late int status;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int imageQty;
  late int liked;
  late String userFullName;
  late String userUserName;
  late String userFrame;
  late List<User> usersLiked;

  Post({
    id,
    userId,
    title,
    cover,
    slug,
    description,
    views,
    like,
    status,
    createdAt,
    updatedAt,
    imageQty,
    liked,
    userFullName,
    userUserName,
    userFrame,
    usersLiked,
  }) {
    this.id = id ?? 0;
    this.userId = userId ?? 0;
    this.title = title ?? "";
    this.cover = cover ?? "";
    this.slug = slug ?? "";
    this.description = description ?? "";
    this.views = views ?? 0;
    this.like = like ?? 0;
    this.status = status ?? 0;
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
    this.imageQty = imageQty ?? 0;
    this.liked = liked ?? 0;
    this.userFullName = userFullName ?? "";
    this.userUserName = userUserName ?? "";
    this.userFrame = userFrame ?? "";
    this.usersLiked = usersLiked ?? 0;
  }

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    return Post(
      id: json[kId],
      userId: json[kUserId],
      title: json[kTitle],
      cover: json[kCover],
      slug: json[kSlug],
      description: json[kDescription],
      views: json[kViews],
      like: json[kLike],
      status: json[kStatus],
      createdAt: DateTime.parse(json[kCreatedAt]),
      updatedAt: DateTime.parse(json[kUpdatedAt]),
      imageQty: json[kImageQty],
      liked: json[kLiked],
      userFullName: json[kUserFullName],
      userUserName: json[kUserUserName],
      userFrame: json[kUserFrame],
      usersLiked: ((json[kUsersLiked] ?? []) as List)
          .map((user) => User.fromJson(user))
          .toList(),
    );
  }
}
