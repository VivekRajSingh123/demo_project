import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/di/riverpod_di/repository_provider.dart';

import '../../../domain/usecases/user_usecases.dart';
import '../../feature/state_management/riverpod/home/home_page_view_model.dart';

final homePageViewModelProvider =
    ChangeNotifierProvider.autoDispose<HomePageViewModel>(
        (ref) => HomePageViewModel(ref.read(userUsecaseProvider)));
final userUsecaseProvider = Provider<UserUsecase>(
    (ref) => UserUsecase(ref.read(userRepositoryProvider)));
