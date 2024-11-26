import 'package:json_annotation/json_annotation.dart';

part 'rendered.g.dart';

@JsonSerializable()
class Rendered {
  String?  rendered;



  Rendered(
      {this.rendered});

  factory Rendered.fromJson(Map<String, dynamic> json) =>
      _$RenderedFromJson(json);

  Map<String, dynamic> toJson() => _$RenderedToJson(this);
}
