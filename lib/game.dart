import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nedodrop/widjets.dart';

class gameXO extends StatefulWidget {
  const gameXO({super.key});

  @override
  State<gameXO> createState() => _gameXOsState();
}

class _gameXOsState extends State<gameXO> {
  int counter = 0;
  int xWins = 0;
  int oWins = 0;
  List<String> board = List.filled(9, 'assets/xo_icon.svg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tic Tac Toe game",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Player X wins: ${xWins}, Player O wins ${oWins}',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    onPressed: () => restart(),
                    icon: Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                    ))
              ],
            ),
            Container(
              width: 350,
              height: 400,
              child: GridView.builder(
                  itemCount: 9,
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => setState(() {
                              counter++;
                              if (counter % 2 != 0) {
                                board[index] = 'assets/x_icon.svg';
                                if (checkWin('assets/x_icon.svg')) {
                                  showWinDialog('assets/x_icon.svg');
                                }
                              } else {
                                board[index] = 'assets/o_icon.svg';
                                if (checkWin('assets/o_icon.svg')) {
                                  showWinDialog('assets/o_icon.svg');
                                }
                              }
                            }),
                        child: SvgPicture.asset(board[index]));
                  }),
            ),
          ],
        ));
  }

  void restart() {
    setState(() {
      counter = 0;
      board = List.filled(9, 'assets/xo_icon.svg');
    });
  }

  void showWinDialog(String player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner!'),
          content:
              Text('${(player == 'assets/x_icon.svg') ? 'X' : 'O'} has won!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  counter = 0;
                  board = List.filled(9, 'assets/xo_icon.svg');
                  if (player == 'assets/x_icon.svg') {
                    xWins++;
                  } else {
                    oWins++;
                  }
                });
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  bool checkWin(String player) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player &&
          board[i * 3 + 1] == player &&
          board[i * 3 + 2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }

    return false;
  }
}
