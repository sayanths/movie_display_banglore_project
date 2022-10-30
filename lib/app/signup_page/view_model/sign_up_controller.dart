import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_project_banglore/app/signup_page/model/signup_model.dart';

class SignUpPageController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  String dropDown = 'Developer';

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

  List<String> jobs = <String>[
    'Developer',
    'Manager',
    'Doctor',
    'Engineer',
    'normal worker',
    'Atrist',
    'Actor',
  ];

  onDropDownPress(String value) {
    dropDown = value;
    notifyListeners();
  }

  Future<void> persondetails() async {
    final detailss = SigUpModel(
        email: emailController.text.trim(),
        name: nameController.text.trim(),
        number: phoneNumberController.text.trim(),
        password: passwordController.text.trim(),
        profession: dropDown);
    addPersonalDetails(detailss);
    //  Routes.push(screen: const HomePage());
    // Messenger.pop(msg: 'Sucessfull');
  }

  onPressed() {
    if (signUpKey.currentState!.validate()) {
      return persondetails();
    }
  }

  List<SigUpModel> list = [];
  Future<void> addPersonalDetails(SigUpModel detail) async {
    var personDb = await Hive.openBox<SigUpModel>('person_db');
    log(personDb.toString());
    var id = await personDb.add(detail);
    detail.id = id;
    list.add(detail);
    log(list.toString());
    notifyListeners();
    personDb.put(detail.id, detail);
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    dropDown;
    super.dispose();
  }
}
