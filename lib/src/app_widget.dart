import 'package:flutter/material.dart';
// import 'package:value_notifier/src/pages/home/home_page.dart';
import 'package:value_notifier/src/pages/github_users/github_user_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightGreen),
      home: const GithubUserPage(),
    );
  }
}
