import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view/home_page.dart';
import 'package:movie_project_banglore/app/routes/message.dart';
import 'package:movie_project_banglore/app/routes/routes.dart';
import 'package:movie_project_banglore/app/signup_page/model/signup_model.dart';

class LoginPageController extends ChangeNotifier {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

   onNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter Correct  Name';
    } else {
      return null;
    }
  }

  onPasswordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter password';
    } else if (value.length < 5) {
      return 'please enter atleast 5 characters';
    } else {
      return null;
    }
  }

  SigUpModel? modela;
  loginToHomePage() {
    if (nameController.text.trim() == modela?.name &&
        passwordController.text.trim() == modela?.password) {
      Routes.push(screen: const HomePage());
      log("sdd");
    } else {
      Messenger.pop(msg: 'User not found');
    }
  }

  onPress() {
    if (loginKey.currentState!.validate()) {
      return loginToHomePage();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
