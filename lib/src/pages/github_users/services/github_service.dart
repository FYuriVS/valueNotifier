import 'package:uno/uno.dart';
import 'package:value_notifier/src/pages/github_users/models/github_user_model.dart';

class GithubUserService {
  final Uno uno;

  GithubUserService(this.uno);

  Future<GithubUser> fetchUser(String user) async {
    final response = await uno.get("https://api.github.com/users/$user");
    return GithubUser.fromMap(response.data);
  }
}
