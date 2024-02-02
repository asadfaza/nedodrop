import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class preferences {
  static SharedPreferences? _preferences;
  static const _keyName = 'name';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setName(String id) async =>
      await _preferences!.setString(_keyName, id);
  static String? getName() => _preferences!.getString(_keyName);
}

// Custom PageRoute for Fade Transition
class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Use a FadeTransition for the screen transition animation
    return FadeTransition(opacity: animation, child: child);
  }
}

Widget arrowForward(
        {required onPressed, required double size, required double secSize, bool isBack = false}) =>
    Container(
      height: secSize,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Center(
          child: Icon(
            isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            size: size,
          ),
        ),
      ),
    );

InputDecoration textFieldDesign({required error, required String text}) =>
    InputDecoration(
        errorText: error,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        labelText: text,
        labelStyle: TextStyle(
          fontSize: 15,
          color: (error != null) ? Colors.red : Colors.white,
        ));
