import 'package:demo_project/presentation/di/get_it/injector.dart';
import 'package:demo_project/presentation/feature/state_management/bloc/user_repo_list/user_repo_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRepoListPageView extends StatelessWidget {
  const UserRepoListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<UserRepoListBloc>()..add(GetUserRepoListEvent()),
      child: Scaffold(
        body: BlocBuilder<UserRepoListBloc, UserRepoListState>(
          builder: (context, state) {
            return stateBaseBody(state);
          },
        ),
      ),
    );
  }

  Widget stateBaseBody(UserRepoListState state) {
     switch (state.runtimeType) {
      case UserRepoListLoadingState:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case UserRepoListErrorState:
        final errorState = state as UserRepoListErrorState;
        return Center(
          child: Text(errorState.errorMsg),
        );
    
      case UserRepoListSuccessfullEndedState:
        final sucessState = state as UserRepoListSuccessfullEndedState;
    
        return ListView.builder(
            shrinkWrap: true,
            itemCount: sucessState.repoList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(sucessState.repoList[index].name ?? ''),
                        Text(sucessState.repoList[index].owner?.login ??
                            ''),
                      ],
                    )
                  ],
                ),
              );
            });
    
      case UserRepoListEmptyState:
        final repoEmptyState = state as UserRepoListEmptyState;
        return Center(
          child: Text(repoEmptyState.msg),
        );
    
      default:
        return const SizedBox.shrink();
    }
             
  }
}
