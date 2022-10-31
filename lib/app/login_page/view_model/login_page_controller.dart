import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  List<SigUpModel> list = [];
  void getAll() async {
    Box<SigUpModel> allList = await Hive.openBox<SigUpModel>('person_db');
    list.addAll(allList.values.toList());
  }

  int flag = 0;

  //SigUpModel? modela;
  onPress() async {
    flag = 0;
    if (loginKey.currentState!.validate()) {
      Future.forEach(list, (SigUpModel element) {
        if (element.name == nameController.text.trim() &&
            element.password == passwordController.text.trimLeft()) {
          if (flag == 0) {
            flag++;
            Routes.pushreplace(screen: const HomePage());
            Messenger.pop(msg: 'Sucess');
          }
        }
      });
    }
    flag == 1 ? flag = 1 : flag = 2;
    if (flag == 2) {
      Messenger.pop(msg: 'Please full fill');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
