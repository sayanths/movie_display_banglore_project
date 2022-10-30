import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/widget.dart';
import 'package:movie_project_banglore/app/login_page/view/login_page.dart';
import 'package:movie_project_banglore/app/signup_page/view_model/sign_up_controller.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singUpProvider = context.read<SignUpPageController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/e.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 15),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 35),
                      child: Column(
                        children: [
                          CustomTextFormFiled(
                              validator: (value) =>
                                  singUpProvider.onEmailValidate(value),
                              controller: singUpProvider.emailController,
                              title: 'Name',
                              obscureText: false),
                          height30,
                          CustomTextFormFiled(
                              validator: (value) =>
                                  singUpProvider.onEmailValidate(value),
                              controller: singUpProvider.emailController,
                              title: 'Email',
                              obscureText: false),
                          height30,
                          CustomTextFormFiled(
                              validator: (value) =>
                                  singUpProvider.onEmailValidate(value),
                              controller: singUpProvider.emailController,
                              title: 'Phone Number',
                              obscureText: false),
                          height30,
                          CustomTextFormFiled(
                              validator: (value) =>
                                  singUpProvider.onEmailValidate(value),
                              controller: singUpProvider.emailController,
                              title: 'Password',
                              obscureText: false),
                          height30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
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
