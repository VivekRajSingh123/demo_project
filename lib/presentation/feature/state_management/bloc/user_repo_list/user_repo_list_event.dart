part of 'user_repo_list_bloc.dart';

@immutable
sealed class UserRepoListEvent {}

final class GetUserRepoListEvent extends UserRepoListEvent {}
