import 'package:demo_project/presentation/di/get_it/injector.dart';
import 'package:demo_project/presentation/di/riiverpod/home_view_model_provider.dart';
import 'package:demo_project/presentation/feature/state_management/bloc/user_repo_list/user_repo_list_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/utils/network_error.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var data = ref.watch(homePageViewModelProvider);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  data.userUIStates == UserUIState.SUCCESS
                      ? Image.network(
                          data.userEntity.avatar_url ?? '',
                          width: 50,
                          height: 50,
                        )
                      : data.userUIStates == UserUIState.LOADING
                          ? const CircularProgressIndicator()
                          : data.userUIStates == UserUIState.ERROR
                              ? const Icon(Icons.error)
                              : Container(),
                  Visibility(
                      visible: data.userUIStates == UserUIState.SUCCESS,
                      child: ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserRepoListPageView())),
                          child: const Text('Next Page')))
                ],
              ),
            ),
          );
        },
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
