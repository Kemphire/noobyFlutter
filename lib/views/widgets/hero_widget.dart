import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title, this.nextPage});

  final Widget? nextPage;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          nextPage != null
              ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return nextPage!;
                  },
                ),
              )
              : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: "hero1",
            child: AspectRatio(
              aspectRatio: 2.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/background.jpg",
                  color: Colors.teal,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.saturation,
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 70,
                letterSpacing: 10,
                color: Colors.yellowAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
