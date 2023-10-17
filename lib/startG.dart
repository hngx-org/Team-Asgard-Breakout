import 'package:flutter/material.dart';
import 'package:game_breakout_task/screens/game_page..dart';

class newStage extends StatelessWidget {
  const newStage({super.key, required this.stage});
  final int stage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        alignment: Alignment(0, -0.2),
        child: GestureDetector(
            onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return GamePage();
                     }));
                  },
            child: Text(
              "Tap to Start Stage $stage",
              style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }
}


// import 'package:easy_splash_screen/easy_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:game_breakout_task/screens/game_page..dart';



// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       backgroundColor: Colors.deepOrangeAccent,
//       title: const Text(
//         "Breakout",
//         style: TextStyle(fontSize: 30),
//       ),
//       logo: Image.asset(
//         "assets/images/splash_image.png",
//       ),
//       navigator: const GamePage(),
//       loadingText: const Text("Please wait"),
//       durationInSeconds: 3,
//     );
//   }
// }
