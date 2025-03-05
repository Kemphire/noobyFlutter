import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/onboarding_page.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    getData(); // Ensure you call getData to fetch the result
  }

  int? expressionResult;

  void getData() async {
    var url = Uri.https("abacus.jasoncameron.dev", "/calculate", {
      "expression": "5+3",
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var result = jsonResponse["result"];
      setState(() {
        expressionResult = result; // Call setState to update the UI
      });
    } else {
      print("Request failed with status ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(
                title:
                    "The result is ${expressionResult ?? "Oh no, something went wrong!"}",
                nextPage: OnboardingPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
