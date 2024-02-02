import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nedodrop/history.dart';
import 'package:nedodrop/settings.dart';
import 'package:nedodrop/widjets.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color color1 = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          FadePageRoute(
                              builder: (context) => const History())),
                      icon: Icon(Icons.history),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          FadePageRoute(
                              builder: (context) => const settings())),
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icon.svg',
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
        preferences.getName()!,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: screenSize.width * 0.7,
                          child: Expanded(
                            child: SvgPicture.asset(
                              'assets/drag-n-drop-element.svg',
                              height: 300,
                              // color: color1,
                            ),
                          ),
                        ),
                        arrowForward(secSize: 30, size: 17, onPressed: () {}),
                      ],
                    ),
                    Text(
                      'Choose files or Drag and Drop it here',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
