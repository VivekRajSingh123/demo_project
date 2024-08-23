import 'package:demo_project/domain/entity/ower_entity.dart';
import 'package:demo_project/domain/entity/repo_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner_model.dart';

part 'repo_model.g.dart';

@JsonSerializable()
class RepoModel {
  final int? id;

  final String? name;

  final OwnerModel? owner;

  RepoModel({this.id, this.name, this.owner});

  factory RepoModel.fromJson(Map<String, dynamic> json) => _$RepoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepoModelToJson(this);

  RepoEntity transform() {
    return RepoEntity(
        id: id ?? 0,
        name: name ?? '',
        owner:
            OwnerEntity(login: owner?.login ?? '', id: owner?.id ?? 0, avatar_url: owner?.avatar_url ?? ''));
  }
}
