import 'package:demo_project/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? login;

  final int? id;

  final String? node_id;

  final String? avatar_url;

  UserModel({this.id, this.login, this.avatar_url, this.node_id});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity transform() {
    return UserEntity(
        id: id ?? 0,
        login: login ?? '',
        node_id: node_id ?? '',
        avatar_url: avatar_url ?? '');
  }
}
