part of 'user_repo_list_bloc.dart';

@immutable
sealed class UserRepoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UserRepoListInitialState extends UserRepoListState {}

final class UserRepoListLoadingState extends UserRepoListState {}
final class UserRepoListEmptyState extends UserRepoListState {
 final String msg;
  UserRepoListEmptyState({required this.msg}); 
}

final class UserRepoListSuccessfullEndedState extends UserRepoListState {
  final List<RepoEntity> repoList;

  UserRepoListSuccessfullEndedState({required this.repoList});
  @override
  List<Object?> get props => [repoList];
}

final class UserRepoListErrorState extends UserRepoListState {
  final String errorMsg;
  UserRepoListErrorState({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
