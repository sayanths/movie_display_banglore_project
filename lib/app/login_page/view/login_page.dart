import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/widget.dart';
import 'package:movie_project_banglore/app/login_page/view_model/login_page_controller.dart';
import 'package:movie_project_banglore/app/signup_page/view/sign_up.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginPageController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg4.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: loginProvider.loginKey,
                      child: Container(
                        margin: const EdgeInsets.only(left: 25, right: 35),
                        child: Column(
                          children: [
                            CustomTextFormFiled(
                                validator: (value) =>
                                    loginProvider.onEmailValidate(value),
                                controller: loginProvider.emailController,
                                title: 'Email',
                                obscureText: false),
                            height30,
                            CustomTextFormFiled(
                                validator: (value) =>
                                    loginProvider.onPasswordValidate(value),
                                controller: loginProvider.passwordController,
                                title: 'password',
                                obscureText: true),
                            height40,
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        if (loginProvider.loginKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            height40,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const MyRegister(),
                                    ));
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        //  decoration: TextDecoration.underline,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        //  decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 1, 15, 105),
                                        fontSize: 20,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final bool obscureText;
  TextInputType? textInputType;
  CustomTextFormFiled(
      {Key? key,
      required this.controller,
      this.validator,
      required this.title,
      required this.obscureText,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
