import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view/home_page.dart';
import 'package:movie_project_banglore/app/home_page/view_model/home_page.dart';
import 'package:movie_project_banglore/app/login_page/view_model/login_page_controller.dart';
import 'package:movie_project_banglore/app/routes/message.dart';
import 'package:movie_project_banglore/app/routes/routes.dart';
import 'package:movie_project_banglore/app/signup_page/model/signup_model.dart';
import 'package:movie_project_banglore/app/signup_page/view_model/sign_up_controller.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(SigUpModelAdapter().typeId)) {
    Hive.registerAdapter(SigUpModelAdapter());
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginPageController>(
      create: (context) => LoginPageController(),
    ),
    ChangeNotifierProvider<SignUpPageController>(
      create: (context) => SignUpPageController(),
    ),
    ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Messenger.rootScaffoldMessengerKey,
      navigatorKey: Routes.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter movie app',
      home: const HomePage(),
    );
  }
}
