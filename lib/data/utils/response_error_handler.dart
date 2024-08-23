import 'package:dartz/dartz.dart';
import 'package:demo_project/data/utils/network_error.dart';

import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>?> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(NetworkError('SomeThingh Went Wrong'));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    return Left(NetworkError(throwable.toString()));
  }
}

extension RetrofitResponse on HttpResponse {
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
