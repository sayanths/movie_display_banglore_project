

import 'package:flutter/material.dart';

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
    if (value!.length < 6) {
      return 'please enter atleast 6 characters';
    } else {
      return null;
    }
  }
}
