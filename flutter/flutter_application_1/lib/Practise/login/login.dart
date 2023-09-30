import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Practise/login/child.dart';

void main() {
  runApp(const SigninPage());
}

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? _errorEmail;
  bool checkEmail() {
    String email = emailController.text;
    String? error;

    if (email.trim().isEmpty) {
      error = "Email không được trống";
    } else {
      List<String> s = email.split("@");
      if (s.length < 2 || s.contains("")) {
        error = "Email không đúng định dạng";
      } else {
        s = s[s.length - 1].split('.');
        if (s.length < 2 || s.contains("")) {
          error = "Email không đúng định dạng";
        }
      }
    }
    // print("a");
    setState(() {
      _errorEmail = error;
    });
    return false;
  }

  void onChangedEmail(String email) {
    //print(email);
    // String email = emailController.text;
    String? error = _errorEmail;
    if (_errorEmail != null) {
      if (email.isEmpty) {
        error = null;
      } else {
        List<String> s = email.split("@");
        if (s.length < 2 || s.contains("")) {
          print("a");
          return;
        } else {
          print("b");
          s = s[s.length - 1].split('.');
          if (s.length < 2 || s.contains("")) {
            return;
          }
          error = null;
        }
      }

      if (error != _errorEmail) {
        setState(() {
          _errorEmail = error;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white, // Đặt màu nền thành màu trắng
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),
        body: Stack(children: [
          const BackgroundStack(),
          const Positioned(
            top: 97,
            left: 96,
            right: 96,
            child: SizedBox(
              //width: 131,
              height: 131,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login here",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F41BB)),
                    ),
                    Text(
                      "Welcome back you’ve"
                      "\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    )
                  ]),
            ),
          ),
          Positioned(
            left: 31,
            right: 31,
            top: 302,
            child: Container(
              color: Colors.white,
              height: 369,
              //width: 357,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldBox(
                    hintText: "Email",
                    controller: emailController,
                    boxBoder: Border.all(color: const Color(0xFF1F41BB)),
                    errorText: _errorEmail,
                    onChanged: (value) {
                      onChangedEmail(value);
                    },
                  ),
                  TextFieldBox(
                    controller: passController,
                    hintText: "Password",
                  ),
                  TextBox(
                    text: "Forgot for password?",
                    alignment: Alignment.centerRight,
                  ),
                  ButtonBox(
                    text: "Sign in",
                    onPressed: checkEmail,
                  ),
                  TextBox(
                    text: "Create new account",
                    color: const Color(0xFF494949),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 114,
            top: 736,
            child: SizedBox(
                width: 200,
                // height: 100,
                // color: Colors.amber,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBox(
                        text: "Or continue with",
                        margin: const EdgeInsets.only(bottom: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconBox(icon: const Icon(Icons.g_mobiledata)),
                          IconBox(icon: const Icon(Icons.facebook)),
                          IconBox(icon: const Icon(Icons.apple)),
                        ],
                      )
                    ])),
          ),
        ]),
      ),
    );
  }
}
