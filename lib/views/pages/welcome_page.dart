import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return FractionallySizedBox(
                  widthFactor: widthScreen > 500 ? 0.6 : 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Lottie.asset(
                        "assets/lotties/welcome.json",
                        height: 300.0,
                      ),

                      SizedBox(height: 20), // Add some spacing
                      FittedBox(
                        child: Text(
                          "Feels like home",
                          style: TextStyle(
                            fontSize: 500,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 50.0,
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(title: "Login"),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: Size(
                            double.infinity,
                            40,
                          ), // Adjusted size
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.tealAccent,
                        ),
                        child: Text("Login"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(
                            double.infinity,
                            40,
                          ), // Adjusted size
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        child: Text("Get Started"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
