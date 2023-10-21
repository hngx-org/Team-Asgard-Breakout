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
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      _preloadImage();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MenuScreen()));
    });
  }
  Future<void> _preloadImage() async {
    await Future.wait([
      // Flame.images.loadAllImages(),
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
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.8,
                child: Text(
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
              Text("Check"),
              Container(
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
