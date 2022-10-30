import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view/home_page.dart';
import 'package:movie_project_banglore/app/routes/message.dart';
import 'package:movie_project_banglore/app/routes/routes.dart';
import 'package:movie_project_banglore/app/signup_page/model/signup_model.dart';

class LoginPageController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  onEmailValidate(String? value) {
    if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(value!) ||
        value.length < 3) {
      return 'please enter valid email';
    } else {
      return null;
    }
  }

  onPasswordValidate(String? value) {
    if (value!.length < 5) {
      return 'please enter atleast 5 characters';
    } else {
      return null;
    }
  }

  SigUpModel? model;
  loginToHomePage() {
    if (emailController.text == model?.email &&
        passwordController.text == model?.password) {
      Routes.push(screen: const HomePage());
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
