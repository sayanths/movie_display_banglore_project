import 'package:flutter/material.dart';

class SignUpPageController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();

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

  onNumberValidate(String? value) {
    if (value!.length != 10) {
      return 'please enter Valid Number';
    } else {
      return null;
    }
  }

  onNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter Correct  Name';
    } else {
      return null;
    }
  }

  onPressed() {
    if (signUpKey.currentState!.validate()) {
      return null;
    }
  }
}
