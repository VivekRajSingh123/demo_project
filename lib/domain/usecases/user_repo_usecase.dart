import 'package:dartz/dartz.dart';
import 'package:demo_project/data/utils/network_error.dart';

import '../entity/repo_entity.dart';
import '../repo/user_repo.dart';

class UserRepoUsecase {
  final UserRepo _userRepo;

  UserRepoUsecase(this._userRepo);

  Future<Either<NetworkError, List<RepoEntity>>> execute() {
    return _userRepo.userRepoList();
  }
}
