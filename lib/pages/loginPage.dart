import 'package:delivery_app/components/formButton.dart';
import 'package:delivery_app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/formTextField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongEmailorPassword();
    }
  }

  void wrongEmailorPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Invalid Email or  password",
              style: TextStyle(color: Colors.red[600]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                // SizedBox(height: 40),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 10),
                Text(
                  "Please sign in to continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FormTextField(
                      fieldIcon: new Icon(Icons.mail_outline_rounded),
                      controller: emailController,
                      hintText: "Email",
                      isObscure: false),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FormTextField(
                      fieldIcon: new Icon(Icons.lock_outline_rounded),
                      controller: passwordController,
                      hintText: "Password",
                      isObscure: true),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FormButton(
                    buttonText: "Login",
                    onTap: loginUser,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have and account? "),
                    GestureDetector(
                      onTap: () =>
                          {Navigator.pushNamed(context, AppRoutes.signupRoute)},
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
