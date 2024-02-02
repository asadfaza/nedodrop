import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nedodrop/page1.dart';
import 'package:nedodrop/widjets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => const MyApp()},
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _nameController = TextEditingController();
  var _errorText;

  void submitName(String name) async {
    if (name == '') {
      setState(() {
        _errorText = '*required';
      });
      return;
    }
    await preferences.setName(name).then((value) => Navigator.push(
        context, FadePageRoute(builder: (context) => const FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    'assets/icon.svg',
                    height: 80,
                  ),
                  const Text(
                    'Hello, welcome to nedodrop',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: 250,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.done,
                      controller: _nameController,
                      onFieldSubmitted: (value) =>
                          submitName(_nameController.text),
                      cursorColor: Colors.white,
                      decoration: textFieldDesign(
                          text: 'device name', error: _errorText),
                    ),
                  ),
                  arrowForward(
                      size: 20,
                      secSize: 50,
                      onPressed: () => submitName(_nameController.text))
                ],
              ),
            ),
          ),
        ));
  }
}
