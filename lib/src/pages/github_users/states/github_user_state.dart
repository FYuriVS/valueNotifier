import 'package:value_notifier/src/pages/github_users/models/github_user_model.dart';

abstract class GithubUserState {}

//Inicial
class InitialGithubUserState extends GithubUserState {}

//Success
class SuccessGithubUserState extends GithubUserState {
  final GithubUser githubUser;
  SuccessGithubUserState(this.githubUser);
}

//Loading
class LoadingGithubUserState extends GithubUserState {}

//Error
class ErrorGithubUserState extends GithubUserState {
  final String message;
  ErrorGithubUserState(this.message);
}
