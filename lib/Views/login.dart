import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvmstructure/res/component/round_button.dart';
import 'package:mvvmstructure/utils/utilities/dialog/error_dialog.dart';
import 'package:mvvmstructure/view_model/authViewModel.dart';
import 'package:provider/provider.dart';


import '../utils/utility.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    obsecurePassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModelProvider= Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                focusNode: emailFocus,
                decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                onFieldSubmitted: (value) {
                  Utils.fieldFocus(context, emailFocus, passwordFocus);
                },
              ),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: obsecurePassword.value,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              obsecurePassword.value = !obsecurePassword.value;
                            },
                            child: Icon(obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            RoundButton(
                tilte: "Login",
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushbarErrorMessage("Please Enter Email", context);
                  } else if (passwordController.text.isEmpty) {
                     Utils.flushbarErrorMessage("Please Enter Password", context);
                  } else if (passwordController.text.length < 6) {
                    // Utils.flushbarErrorMessage("Please Enter 6 digit password", context);
                     ShowErrorDialog(context, "Please Enter 6 digit password");
                  } else {
                    Map data={
                      "email":emailController.text,
                      "password":passwordController.text
                    };
                    authViewModelProvider.login(data, context);
                    log("Api Hit");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
