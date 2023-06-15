import 'package:flutter/material.dart';

class Screen_ForgotPass extends StatelessWidget {
  const Screen_ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your email address.\nWe will send you an email to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email Id", icon: Icon(Icons.email)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("clicked");
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  child: const Text("Submit"),
                )),
          ],
        ),
      ),
    );
  }
}
