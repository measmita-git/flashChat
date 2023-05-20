import 'package:flash_chat/chat_screen.dart';
import 'package:flash_chat/constants.dart';

import 'package:flutter/material.dart';
import 'components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'reload',
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 200.0,
                child: Image.asset('assets/reload.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter your email address",
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter your password",
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.blueAccent,
                title: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, ChatScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
