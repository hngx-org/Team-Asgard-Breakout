import 'package:flutter/material.dart';
import 'package:game_breakout_task/screens/game_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/game/star_background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircularProgressIndicator(),
            Container(
              width: size.width,
              color: Colors.white,
              child: const Text(
                "BRICK BREAKER",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "PublicPixel", fontSize: 22,color: Colors.blue)
                // GoogleFonts.audiowide(
                //     textStyle: TextStyle(color: Colors.blue, fontSize: 24)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // color: Colors.white,
              width: size.width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const GameScreen()));
                    },
                    icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 60,
                  color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                  //TODO: Push to leaderboard screen
                    },
                    icon: const Icon(
                  Icons.emoji_events_sharp,
                  size: 60,
                  color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                  //TODO: push to info page
                    },
                    icon: const Icon(
                  Icons.info_outlined,
                  size: 60,
                  color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                  //TODO: push to settings screen
                    },
                    icon: const Icon(
                  Icons.settings_outlined,
                  size: 60,
                  color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
