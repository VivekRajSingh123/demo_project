import 'package:demo_project/domain/entity/ower_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel {
  final String? login;

  final int? id;

  final String? avatar_url;
  OwnerModel({this.login, this.id, this.avatar_url});

  factory OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  OwnerEntity transform() {
    return OwnerEntity(login: login ?? '', id: id ?? 0, avatar_url: avatar_url);
  }
}
