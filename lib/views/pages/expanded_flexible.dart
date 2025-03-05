import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(color: Colors.cyan, height: 20)),
              Flexible(
                child: Container(
                  color: Colors.green,
                  height: 20,
                  child: Text("alkdjf aldkj alkdj"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
