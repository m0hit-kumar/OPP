import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opp/design/colors.dart';
import 'package:opp/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future signIn() async {
    print("Sign in function ${nameController.text.trim()} ");

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: nameController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {
                print("value"),
              });
    } on FirebaseAuthException catch (err) {
      print("999999999999999 $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: backColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign in using student id and continue',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter your roll number and password to continue!. Defualt password is your roll number',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputWidget(
                  controller: nameController,
                  icon: Icons.account_circle,
                  labelText: 'Username',
                ),
                const SizedBox(height: 20),
                InputWidget(
                  controller: passwordController,
                  icon: Icons.lock,
                  labelText: 'Password',
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    signIn();
                  },
                  color: buttonGreen,
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
