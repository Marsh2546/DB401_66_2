import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int shade = 2636700;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              double height = MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top;
              shade = (details.localPosition.dy / height * 16777215).round();
              if (shade < 0) {
                shade = 0;
              } else if (shade > 16777215) {
                shade = 16777215;
              }
            });
          },
          onTapDown: (details) {
            setState(() {
              double height = MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top;
              shade = (details.localPosition.dy / height * 16777215).round();
            });
            // print(details.localPosition.dy);
            // print(MediaQuery.of(context).size.height);
            // print(MediaQuery.of(context).padding.top);
          },
        )),
        backgroundColor: Color(0xff000000 + shade),
      ),
    );
  }
}
