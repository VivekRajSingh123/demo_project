import 'package:dartz/dartz.dart';
import 'package:demo_project/data/utils/network_error.dart';

import '../entity/user_entity.dart';
import '../repo/user_repo.dart';

class UserUsecase {
  final UserRepo _repo;

  UserUsecase(this._repo);

  Future<Either<NetworkError, UserEntity>> execute() {
    return _repo.user();
  }
}
