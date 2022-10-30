import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_project_banglore/app/home_page/view/home_page.dart';
import 'package:movie_project_banglore/app/routes/routes.dart';
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
    if (value!.length < 3) {
      return 'please enter atleast 5 characters';
    } else {
      return null;
    }
  }

  onNumberValidate(String? value) {
    if (value!.length <= 3) {
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

  onPressed() {
    if (signUpKey.currentState!.validate()) {
      final detailss = SigUpModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          email: emailController.text.trim(),
          name: nameController.text.trim(),
          number: phoneNumberController.text.trim(),
          password: passwordController.text.trim(),
          profession: dropDown);
      addPersonalDetails(detailss);
      refreshUi();
      Routes.push(screen: const HomePage());
    }
    // Messenger.pop(msg: 'Sucessfull');
  }

  List<SigUpModel> list = [];
  Future<void> addPersonalDetails(SigUpModel detail) async {
    var personDb = await Hive.openBox<SigUpModel>('person_db');
    // log(personDb.toString());
    // var id = await personDb.add(detail);
    // detail.id = id;
    // list.add(detail);
    // log(list.toString());
    //transactionDB.put(value.id, value);
    personDb.put(detail.id, detail);
    refreshUi();
  }

  Future<List<SigUpModel>> getAll() async {
    final allList = await Hive.openBox<SigUpModel>('person_db');
    return allList.values.toList();
  }

  Future<void> refreshUi() async {
    final allList = await getAll();
    // list.clear();
    log('===========');
    list.addAll(allList);
    log(list[0].name ?? 'hahhhaha');
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   nameController.dispose();
  //   passwordController.dispose();
  //   phoneNumberController.dispose();

  //   super.dispose();
  // }

  clearTextFormField() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    phoneNumberController.clear();
  }
}
