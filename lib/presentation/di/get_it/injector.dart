import 'package:demo_project/data/data_source/user_ds/remote/user_data_source.dart';
import 'package:demo_project/data/data_source/user_ds/user_data_source_impl.dart';
import 'package:demo_project/data/network/api_service.dart';
import 'package:demo_project/data/repo/user/user_repo_impl.dart';
import 'package:demo_project/domain/repo/user_repo.dart';
import 'package:demo_project/domain/usecases/user_repo_usecase.dart';
import 'package:demo_project/presentation/feature/state_management/bloc/user_repo_list/user_repo_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../domain/usecases/user_usecases.dart';
import '../../feature/state_management/riverpod/home/home_page_view_model.dart';
/// GET_IT DI
GetIt locator = GetIt.instance;
Future intializeDependency() async {
  //Base Option DI to pass for Dio object creation For Bussiness Logic

  locator.registerSingleton<BaseOptions>(BaseOptions(
    baseUrl: 'https://api.github.com',
  ));

  // Interceptor DI For Bussiness Logic

  locator.registerSingleton<PrettyDioLogger>(
    PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: (log) {
        return print(log as String);
      },
    ),
  );

// Dio DI For Bussiness Logic
  locator.registerLazySingleton<Dio>(() {
    Dio dio = Dio(locator.get<BaseOptions>());
    dio.interceptors.add(locator.get<PrettyDioLogger>());
    return dio;
  });

// Api Service class DI For Bussiness Logic

  locator.registerSingleton<ApiService>(
    ApiService(locator.get<Dio>(), baseUrl: 'https://api.github.com'),
  );

  // Data Source DI For Bussiness Logic

  locator.registerSingleton<UserDataSource>(
    UserDataSourceImpl(locator.get<ApiService>()),
  );

// Repository DI For Bussiness Logic

  locator
      .registerSingleton<UserRepo>(UserRepoImpl(locator.get<UserDataSource>()));

  //UseCase DI For Bussiness Logic

  locator.registerSingleton<UserUsecase>(UserUsecase(locator.get<UserRepo>()));
  locator.registerSingleton<UserRepoUsecase>(
      UserRepoUsecase(locator.get<UserRepo>()));

// ViewModel DI For Bloc

  locator.registerFactory<UserRepoListBloc>(
      () => UserRepoListBloc(locator.get<UserRepoUsecase>()));
}

// ViewModel DI For RiverPod Type VM
final homePageViewModelProvider1 =
    ChangeNotifierProvider.autoDispose<HomePageViewModel>(
        (ref) => HomePageViewModel(locator.get<UserUsecase>()));
