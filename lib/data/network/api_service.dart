import 'package:demo_project/data/model/repo_model.dart';
import 'package:demo_project/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("/users/mralexgray")
  Future<HttpResponse<UserModel>> user();

  @GET("/users/mralexgray/repos")
  Future<HttpResponse<List<RepoModel>>> userRepos();
}
