import 'package:flutter/material.dart';
import 'package:flutter_app/data/contants.dart';
import 'package:flutter_app/views/pages/course_page.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfStuff = [
      Kvalue.basicLayout,
      Kvalue.cleanUi,
      Kvalue.keyConcepts,
      Kvalue.fixBugs,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            HeroWidget(title: "Home Page", nextPage: CoursePage()),
            ...List.generate(listOfStuff.length * 3, (int index) {
              return ContainerWidget(
                title: listOfStuff.elementAt(index % listOfStuff.length),
                description: listOfStuff.elementAt(index % listOfStuff.length),
              );
            }),
          ],
        ),
      ),
    );
  }
}
