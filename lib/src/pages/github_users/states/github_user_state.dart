import 'package:value_notifier/src/pages/github_users/models/github_user_model.dart';

sealed class GithubUserState {}

//Inicial
class InitialGithubUserState extends GithubUserState {}

//Success
class SuccessGithubUserState extends GithubUserState {
  final GithubUser githubUser;
  SuccessGithubUserState(this.githubUser);
}

//Loading
class LoadingGithubUserState extends GithubUserState {}

//Details
class MoreInfoGithubUserState extends GithubUserState {
  final GithubUser githubUser;
  MoreInfoGithubUserState(this.githubUser);
}

class LessInfoGithubUserState extends GithubUserState {}

//Error
class ErrorGithubUserState extends GithubUserState {
  final String message;
  ErrorGithubUserState(this.message);
}
