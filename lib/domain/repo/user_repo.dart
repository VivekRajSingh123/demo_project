import 'package:dartz/dartz.dart';
import 'package:demo_project/domain/entity/user_entity.dart';
import 'package:demo_project/data/utils/network_error.dart';

import '../entity/repo_entity.dart';

abstract class UserRepo {
  Future<Either<NetworkError, UserEntity>> user();
  Future<Either<NetworkError, List<RepoEntity>>> userRepoList();
}
