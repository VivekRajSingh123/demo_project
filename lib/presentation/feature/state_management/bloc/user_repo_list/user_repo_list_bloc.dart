import 'package:bloc/bloc.dart';
import 'package:demo_project/domain/usecases/user_repo_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entity/repo_entity.dart';

part 'user_repo_list_event.dart';
part 'user_repo_list_state.dart';

class UserRepoListBloc extends Bloc<UserRepoListEvent, UserRepoListState> {
  final UserRepoUsecase userRepoUsecase;

  UserRepoListBloc(this.userRepoUsecase) : super(UserRepoListInitialState()) {
    on<UserRepoListEvent>(
        (UserRepoListEvent event, Emitter<UserRepoListState> emit) async {
      emit(UserRepoListLoadingState());

      final response = await userRepoUsecase.execute();
      response.fold((l) {
        emit(UserRepoListErrorState(errorMsg:l.error));
      }, (r) {
        if(r.isEmpty) {
        return  emit(UserRepoListEmptyState(msg:'No Repo Found'));
        }

        emit(UserRepoListSuccessfullEndedState(repoList:r));
      });
    });
  }
}
