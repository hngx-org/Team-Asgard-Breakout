import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:game_breakout_task/screens/game_screen.dart';
import 'package:game_breakout_task/screens/info_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.play("bg_sound.mp3", volume: 0.2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/game/stars_background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircularProgressIndicator(),
            SizedBox(
              width: size.width,
              // color: Colors.white,
              child: const Center(
                child: Text("BRICK BREAKER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "PublicPixel",
                        fontSize: 22,
                        color: Colors.blue)
                    // GoogleFonts.audiowide(
                    //     textStyle: TextStyle(color: Colors.blue, fontSize: 24)),
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const GameScreen(),
                      ),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        size: 60,
                        color: Colors.green,
                      ),
                      Text(
                        "Play",
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: Push to leaderboard screen
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.emoji_events_sharp,
                        size: 60,
                        color: Colors.blue,
                      ),
                      Text(
                        "Leaderboard",
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BreakoutRulesScreen(),
                      ),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.info_outlined,
                        size: 60,
                        color: Colors.red,
                      ),
                      Text(
                        "info",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: push to settings screen
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 60,
                        color: Colors.yellow,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: 10, color: Colors.yellow),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
