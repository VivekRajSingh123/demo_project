import 'package:demo_project/data/data_source/user_ds/remote/user_data_source.dart';
import 'package:demo_project/data/model/repo_model.dart';
import 'package:demo_project/data/model/user_model.dart';
import 'package:demo_project/data/network/api_service.dart';
import 'package:retrofit/dio.dart';

class UserDataSourceImpl extends UserDataSource {
  final ApiService apiService;
  UserDataSourceImpl(this.apiService);

  @override
  Future<HttpResponse<UserModel>> user() {
    return apiService.user();
  }

  @override
  Future<HttpResponse<List<RepoModel>>> userRepos() {
    return apiService.userRepos();
  }
}
