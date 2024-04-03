import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nedodrop/widjets.dart';

class gameXO extends StatefulWidget {
  const gameXO({super.key});

  @override
  State<gameXO> createState() => _gameXOsState();
}

class _gameXOsState extends State<gameXO> {
  bool isX = false;
  int ind = 0;
  List<String> board = List.filled(9, 'assets/xo_icon.svg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe game", style: TextStyle(color: Colors.white, fontSize: 30),),
        leading: IconButton(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child: GridView.builder(
              itemCount: 9,
              padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
                itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => setState(() {
                  board[index] = 'assets/x_icon.svg';
                }),
                  child:
                  SvgPicture.asset(board[index])
              );
                }),
          )
        ],
      )
    );
  }
}
