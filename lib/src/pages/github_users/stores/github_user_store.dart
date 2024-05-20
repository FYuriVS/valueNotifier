import 'package:flutter/material.dart';
import 'package:value_notifier/src/pages/github_users/services/github_service.dart';
import 'package:value_notifier/src/pages/github_users/states/github_user_state.dart';

class GithubUserStore extends ValueNotifier<GithubUserState> {
  final GithubUserService githubUserService;
  var moreInformations = false;

  GithubUserStore(this.githubUserService) : super(InitialGithubUserState());

  Future fetchUser(String user) async {
    value = LoadingGithubUserState();
    if (user.isNotEmpty) {
      try {
        final githubUser = await githubUserService.fetchUser(user);
        value = SuccessGithubUserState(githubUser);
      } catch (e) {
        value = ErrorGithubUserState(e.toString());
      }
    } else {
      value = ErrorGithubUserState("Digite o nome de algum usuário!");
    }
  }

  // bool toggleMoreInformations(bool value) {
  //   return !value;
  // }
}
