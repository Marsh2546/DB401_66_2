import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Scaffold(
      body: MyPanel(),
    ),
    theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold))),
  ));
}

class MyPanel extends StatefulWidget {
  const MyPanel({super.key});

  @override
  State<MyPanel> createState() => _MyPanelState();
}

class _MyPanelState extends State<MyPanel> {
  int _Background = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      _Background == 0 ? 'assets/bg1.jpg' : 'assets/bg2.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _Background = 0;
                  });
                },
                child: Text(
                  'ขึ้นเขา',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Background = 1;
                    });
                  },
                  child: Text(
                    'เข้าป่า',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)))
            ],
          ),
        ),
      ),
    );
  }
}
