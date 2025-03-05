import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/images/logo.jpg"),
          ),
          ListTile(
            title: Text("Logout"),
            onTap:
                () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomePage();
                      },
                    ),
                  ),
                },
          ),
        ],
      ),
    );
  }
}
