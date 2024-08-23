import 'package:dartz/dartz.dart';
import 'package:demo_project/data/data_source/user_ds/remote/user_data_source.dart';
import 'package:demo_project/data/utils/response_error_handler.dart';

import 'package:demo_project/domain/entity/repo_entity.dart';
import 'package:demo_project/domain/entity/user_entity.dart';
import 'package:demo_project/domain/repo/user_repo.dart';
import 'package:demo_project/data/utils/network_error.dart';

class UserRepoImpl extends UserRepo {
  final UserDataSource _userDataSource;

  UserRepoImpl(this._userDataSource);

  @override
  Future<Either<NetworkError, UserEntity>> user() async {
    final result = await safeApiCall(
      _userDataSource.user(),
    );
    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, List<RepoEntity>>> userRepoList() async {
    final result = await safeApiCall(
      _userDataSource.userRepos(),
    );
    return result!.fold((l) => Left(l),
        (r) => Right(r.data.map((e) => e.transform()).toList()));
  }
}
