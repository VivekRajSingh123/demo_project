import 'package:demo_project/data/model/repo_model.dart';
import 'package:retrofit/dio.dart';

import '../../../model/user_model.dart';

abstract class UserDataSource {
  Future<HttpResponse<UserModel>> user();
  Future<HttpResponse<List<RepoModel>>> userRepos();
}
