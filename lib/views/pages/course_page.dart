import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_app/data/classes/todo_class.dart';
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
    getData();
  }

  Future<Todo> getData() async {
    try {
      return await fetchTodo().timeout(
        Duration(seconds: 2),
        onTimeout: () {
          throw TimeoutException(
            "connection timed out. Please check your connection",
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Todo> fetchTodo() async {
    var url = Uri.https("jsonplaceholder.typicode.com", "/todos/1");

    var response = await http.get(url, headers: {"accept": "application/json"});

    if (response.statusCode == 200) {
      print(response.body);
      return Todo.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ("Request failed with status ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Todo>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeroWidget(
                      title: "The name is ${snapshot.data!.title}",
                      nextPage: OnboardingPage(),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            String errorMessage;
            if (snapshot.error is TimeoutException) {
              errorMessage = "connection timed out";
            } else {
              errorMessage = "An error occurred: ${snapshot.error}";
            }
            return Center(child: Text(errorMessage));
          } else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
