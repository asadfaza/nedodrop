import 'package:flutter/material.dart';
import 'package:nedodrop/widjets.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 5,
          onPressed: () {},
          icon: arrowForward(
              onPressed: () => Navigator.pop(context),
              size: 15,
              secSize: 30,
              isBack: true),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Text(
        'SETTINGS',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
