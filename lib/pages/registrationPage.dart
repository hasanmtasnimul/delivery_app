import 'package:delivery_app/components/formButton.dart';
import 'package:delivery_app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_buttons.dart';
import '../components/formTextField.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: "Registration Successful");
      } else {
        Navigator.pop(context);
        registrationError("Passwords did not match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      registrationError(e.message);
    }
  }

  void registrationError(msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              msg,
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
                SizedBox(height: 100),
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 10),
                Text(
                  "Let's create an account",
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
                  child: FormTextField(
                      fieldIcon: new Icon(Icons.lock_outline_rounded),
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      isObscure: true),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FormButton(
                    buttonText: "Signup",
                    onTap: registerUser,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered? "),
                    GestureDetector(
                      onTap: () =>
                          {Navigator.pushNamed(context, AppRoutes.loginRoute)},
                      child: Text(
                        "Login",
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
