import 'package:flutter/material.dart';
import '../Widgets/accountCards.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 50,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  "https://media.licdn.com/dms/image/D5603AQFJJsxCwVw2Ew/profile-displayphoto-shrink_800_800/0/1669150151330?e=1689206400&v=beta&t=ZGdKY-U-GAwCRwsi4f3KVVME6VMcJEwoCipg-DTF8XQ",
                  width: 125,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "DC Hall",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            accountCard(
              icon: Icons.person_outline_rounded,
              title: 'My Account',
              function: () {
                print('My Account');
              },
            ),
            accountCard(
              icon: Icons.notifications_active_outlined,
              title: 'Notifications',
              function: () {
                print('Notifications');
              },
            ),
            accountCard(
              icon: Icons.settings_outlined,
              title: 'Settings',
              function: () {
                print('Settings');
              },
            ),
            accountCard(
              icon: Icons.logout_outlined,
              title: 'Logout',
              function: () {
                print('Logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
