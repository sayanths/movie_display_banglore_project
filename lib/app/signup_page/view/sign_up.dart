import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/fonts.dart';
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
              padding: const EdgeInsets.only(left: 35, top: 0),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: singUpProvider.signUpKey,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 35),
                        child: Column(
                          children: [
                            CustomTextFormFiled(
                                textInputType: TextInputType.name,
                                validator: (value) =>
                                    singUpProvider.onNameValidate(value),
                                controller: singUpProvider.nameController,
                                title: 'Name',
                                obscureText: false),
                            height20,
                            CustomTextFormFiled(
                                validator: (value) =>
                                    singUpProvider.onEmailValidate(value),
                                controller: singUpProvider.emailController,
                                title: 'Email',
                                obscureText: false),
                            height20,
                            Consumer<SignUpPageController>(
                              builder: (context, signUpvalue, _) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Select Profession",
                                        style: gFontsSans(
                                            cl: Colors.white, sz: 20)),
                                    DropdownButton<String>(
                                      dropdownColor: Colors.black,
                                      value: signUpvalue.dropDown,
                                      items: signUpvalue.jobs.map((String e) {
                                        return DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: gFontsSans(
                                                cl: Colors.white,
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        signUpvalue.onDropDownPress(value!);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                            height20,
                            CustomTextFormFiled(
                                // textInputType: TextInputType.number,
                                validator: (value) =>
                                    singUpProvider.onNumberValidate(value),
                                controller:
                                    singUpProvider.phoneNumberController,
                                title: 'Phone Number',
                                obscureText: false),
                            height20,
                            CustomTextFormFiled(
                                validator: (value) =>
                                    singUpProvider.onPasswordValidate(value),
                                controller: singUpProvider.passwordController,
                                title: 'Password',
                                obscureText: true),
                            height20,
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
                                  backgroundColor:
                                      const Color.fromARGB(255, 205, 251, 0),
                                  child: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        singUpProvider.onPressed();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  style: const ButtonStyle(),
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Text(
                                      'Sign In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
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
