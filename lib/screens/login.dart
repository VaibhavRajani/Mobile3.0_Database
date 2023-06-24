import 'package:flutter/material.dart';
import './forgotpass.dart';
import './mainScreen.dart';

class Screen_login extends StatefulWidget {
  Screen_login({super.key});

  @override
  State<Screen_login> createState() => _Screen_loginState();
}

class _Screen_loginState extends State<Screen_login> {
  bool val = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: TextField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Username", icon: Icon(Icons.person)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "Password", icon: Icon(Icons.lock)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (usernameController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Username is required',
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                    ));
                  } else if (passwordController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Password is required',
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                    ));
                  } else if (usernameController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Screen_mainPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Error\nInvalid login credentials, please try again',
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                child: const Text("Login"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Screen_ForgotPass()));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey),
              ))
        ],
      ),
    );
  }
}
