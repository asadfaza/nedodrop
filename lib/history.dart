import 'package:flutter/material.dart';
import 'package:nedodrop/widjets.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: arrowForward(
              onPressed: () => Navigator.pop(context),
              size: 15,
              secSize: 30,
              isBack: true),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Text(
        'HISTORY',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
