import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view/home_page.dart';
import 'package:movie_project_banglore/app/login_page/view/login_page.dart';
import 'package:movie_project_banglore/app/login_page/view_model/login_page_controller.dart';
import 'package:movie_project_banglore/app/signup_page/view_model/sign_up_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginPageController>(create: (context) => LoginPageController(),),
            ChangeNotifierProvider<SignUpPageController>(create: (context) => SignUpPageController(),)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyLogin(),
    );
  }
}
