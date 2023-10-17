import 'package:flutter/material.dart';
import 'package:game_breakout_task/startG.dart';

class UtilityScreen extends StatelessWidget {
  const UtilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return newStage(stage: 1);
                  }));
                },
                child: Text(
                  "Start Game",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Settings",style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
              TextButton(
                onPressed: () {},
                child: Text("How to play",style: TextStyle(color: Colors.black, fontSize: 22)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
