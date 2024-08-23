import 'package:demo_project/domain/entity/repo_entity.dart';
import 'package:demo_project/domain/usecases/user_usecases.dart';
import 'package:demo_project/data/utils/network_error.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/entity/user_entity.dart';

class HomePageViewModel extends ChangeNotifier {
  final UserUsecase userUsecase;

  UserUIState userUIStates = UserUIState.LOADING;
  
  UserEntity userEntity = UserEntity();

  HomePageViewModel(
    this.userUsecase,
  ) {
    getUser();
  }

  List<RepoEntity> repoList = [];

  void getUser() async {
    var response = await userUsecase.execute();
    response.fold((l) {
      userUIStates = UserUIState.ERROR;
    }, (r) {
      userUIStates = UserUIState.SUCCESS;
      userEntity = r;
    });
    notifyListeners();
  }
}
