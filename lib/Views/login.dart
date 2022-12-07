import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmstructure/utils/routes/route_name.dart';

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
  Widget build(BuildContext context) {
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
                        suffixIcon: InkWell(onTap: (){
                          obsecurePassword.value=!obsecurePassword.value;
                        }, child:  Icon(obsecurePassword.value? Icons.visibility_off_outlined:Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onFieldSubmitted: (value) {
                      //Utils.fieldFocus(context, emailFocus, passwordFocus);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
