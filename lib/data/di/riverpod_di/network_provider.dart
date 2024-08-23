import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data_source/user_ds/remote/user_data_source.dart';
import '../../data_source/user_ds/user_data_source_impl.dart';
import '../../network/api_service.dart';

final baseOptions = Provider<BaseOptions>((ref) => BaseOptions(
      baseUrl: 'https://api.github.com',
    ));

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    dio.interceptors.add(
      ref.read(prettyDioLoggerProvider),
    );
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioProvider), baseUrl: 'https://api.github.com'),
);

final userDataSourceDS = Provider<UserDataSource>(
  (ref) => UserDataSourceImpl(ref.read(apiServiceProvider)),
);

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
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
