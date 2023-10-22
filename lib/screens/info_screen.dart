import 'package:flutter/material.dart';

class BreakoutRulesScreen extends StatelessWidget {
  const BreakoutRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/game/stars_background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.green,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Atari Breakout Rules',
              style: TextStyle(
                  color: Colors.green,
                  fontFamily: "PublicPixel",
                  fontSize: 12)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const <Widget>[
            Text(
              'How to Play Atari Breakout',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Start the Game:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- Insert a coin or press the designated start button to begin the game.',
              style: TextStyle(fontFamily: 'PublicPixel', color: Colors.green),
            ),
            SizedBox(height: 8.0),
            Text(
              '2. Controls:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- Move the paddle left and right using the joystick or arrow keys on your controller. Your paddle can only move horizontally at the bottom of the screen.',
              style: TextStyle(fontFamily: 'PublicPixel', color: Colors.green),
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Ball Release:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- The game begins with the ball resting on top of the paddle. Press the designated button or use a joystick movement to release the ball.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '4. Objective:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- The main objective is to break all the bricks on the screen using the bouncing ball. When you destroy all the bricks, you move on to the next level.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '5. Scoring:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- Points are earned for each brick you break. Some versions of the game might have different point values for different colored bricks.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '6. Losing a Life:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- You start with a limited number of lives (usually 3). You lose a life when the ball passes your paddle and goes off the screen at the bottom. You can lose all your lives, ending the game.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '7. Power-Ups:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- Some versions of Atari Breakout feature power-ups that can either help or hinder your progress. These power-ups can include extra lives, larger paddles, faster balls, and more.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '8. Bricks:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- The bricks are arranged in various patterns and colors on the screen. You need to hit each brick with the ball to break it. Some bricks may require multiple hits to be destroyed.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '9. Bouncing:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- The ball bounces off the paddle and the walls at an angle. You can control the direction of the ball by moving the paddle left or right. Try to angle the ball to hit bricks strategically.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '10. Game Over:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- The game is over when you run out of lives, and your final score is displayed. You can then start a new game by inserting another coin or pressing the start button.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
            SizedBox(height: 8.0),
            Text(
              '11. Advancing Levels:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel'),
            ),
            Text(
              '- As you clear the bricks on the screen, you\'ll advance to higher levels with more challenging brick arrangements and faster ball speeds.',
              style: TextStyle(color: Colors.green, fontFamily: 'PublicPixel'),
            ),
          ],
        ),
      ),
    );
  }
}
