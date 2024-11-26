import 'package:bole_nav_app/core/models/rendered.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Rendered?  title;
  Rendered? content;
  String? jetpack_featured_media_url;
  String? date;


  Post(
      {this.title,this.content,this.jetpack_featured_media_url,this.date});

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
