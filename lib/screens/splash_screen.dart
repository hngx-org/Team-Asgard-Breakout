import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:game_breakout_task/screens/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    FlameAudio.bgm.initialize();
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      _preloadImage();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const MenuScreen()));
    });
  }
  Future<void> _preloadImage() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/game/stars_background.png'), context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/game/splash_img.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: const Text(
                  "BRICK BREAKER",
                    textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "PublicPixel", fontSize: 22,color: Colors.blue)
                  // GoogleFonts.audiowide(
                  //     textStyle: TextStyle(color: Colors.blue, fontSize: 24)),
                ),
              ),
              // Container(
              //     height: 250,
              //     width: size.width/2,
              //     color: Colors.white,
              //     child: Image.asset("assets/images/game/splash_img.png",fit: BoxFit.fill,)),
              const Text("Check"),
              SizedBox(
                  width: size.width / 2,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.lightBlue,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
