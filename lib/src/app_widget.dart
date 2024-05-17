import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
// import 'package:value_notifier/src/pages/home/home_page.dart';
import 'package:value_notifier/src/pages/github_users/github_user_page.dart';
import 'package:value_notifier/src/pages/github_users/services/github_service.dart';
import 'package:value_notifier/src/pages/github_users/stores/github_user_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => GithubUserService(context.read())),
        ChangeNotifierProvider(
            create: (context) => GithubUserStore(context.read()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blueGrey,
        ),
        home: const GithubUserPage(),
      ),
    );
  }
}
