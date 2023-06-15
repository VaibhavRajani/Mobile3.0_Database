import 'package:flutter/material.dart';

class accountCard extends StatelessWidget {
  accountCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.function});
  String title;
  IconData icon;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          icon,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.navigate_next),
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
