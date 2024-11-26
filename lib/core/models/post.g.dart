// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      title: json['title'] == null
          ? null
          : Rendered.fromJson(json['title'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : Rendered.fromJson(json['content'] as Map<String, dynamic>),
      jetpack_featured_media_url: json['jetpack_featured_media_url'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'jetpack_featured_media_url': instance.jetpack_featured_media_url,
      'date': instance.date,
    };
