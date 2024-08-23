import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repo/user_repo.dart';
import '../../repo/user/user_repo_impl.dart';
import 'network_provider.dart';

final userRepositoryProvider =
    Provider<UserRepo>((ref) => UserRepoImpl(ref.read(userDataSourceDS)));
