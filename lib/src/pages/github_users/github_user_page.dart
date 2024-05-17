import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier/src/pages/github_users/services/github_service.dart';
import 'package:value_notifier/src/pages/github_users/states/github_user_state.dart';
import 'package:value_notifier/src/pages/github_users/stores/github_user_store.dart';

class GithubUserPage extends StatefulWidget {
  const GithubUserPage({super.key});

  @override
  State<GithubUserPage> createState() => _GithubUserPageState();
}

class _GithubUserPageState extends State<GithubUserPage> {
  // final store = GithubUserStore(GithubUserService(Uno()));
  final _inputController = TextEditingController();
  var _moreInformations = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<GithubUserStore>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<GithubUserStore>();
    final state = store.value;
    late Widget child;
    if (state is LoadingGithubUserState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorGithubUserState) {
      child = Center(
        child: Text(state.message),
      );
    }
    if (state is SuccessGithubUserState) {
      child = Card(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          state.githubUser.avatarUrl,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name:", style: TextStyle(fontSize: 11)),
                              Text("Location:", style: TextStyle(fontSize: 11)),
                              Text("Public Repositories:",
                                  style: TextStyle(fontSize: 11)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.githubUser.name,
                                style: const TextStyle(fontSize: 11),
                              ),
                              Text(
                                state.githubUser.location,
                                style: const TextStyle(fontSize: 11),
                              ),
                              Text(
                                state.githubUser.publicRepos.toString(),
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      store.moreInformations
                          ? Column(
                              children: [Text(state.githubUser.blog)],
                            )
                          : const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.info_outline,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _moreInformations =
                        store.toggleMoreInformations(_moreInformations);
                  });
                },
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Github Users",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      hintText: "Search User...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _inputController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    store.fetchUser(_inputController.text);
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            child
          ],
        ),
      ),
    );
  }
}
