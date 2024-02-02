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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon.svg',
                          height: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          preferences.getName()!,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ]),
                    ],
                  ),
                ),
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
            Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: FocusableActionDetector(
                            onShowHoverHighlight: (value) {
                              setState(() {
                                color1 = (!value) ? Colors.white : Colors.blue;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/drag-n-drop-element.svg',
                              height: 300,
                              // color: color1,
                            ),
                          ),
                        ),
                        arrowForward(secSize: 45, size: 17, onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Choose files or Drag and Drop it here',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
