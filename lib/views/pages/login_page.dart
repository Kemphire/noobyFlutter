import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllPw = TextEditingController();
  bool pwIsVisible = false;
  String confirmEmail = "123";
  String confirmPw = "123";

  @override
  void dispose() {
    controllerEmail.dispose();
    controllPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroWidget(title: widget.title),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onEditingComplete: () => {setState(() {})},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: controllPw,
                      obscureText: !pwIsVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          onPressed:
                              () => {
                                setState(() {
                                  pwIsVisible ^= true;
                                }),
                              },
                          icon:
                              pwIsVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                        ),
                      ),
                      onEditingComplete: () => {setState(() {})},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: checkCredential,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40), // Adjusted size
                      ),
                      child: Text(widget.title),
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkCredential() {
    if (confirmEmail == controllerEmail.text && confirmPw == controllPw.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
        (route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            icon: Icon(Icons.error),
            title: Text("Entered wrong details"),
            actions: [
              Text("Check If you've entered right password"),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    }
  }
}
