import 'package:flutter/material.dart';
import 'package:random_pictures/circleButton.dart';
import 'constant.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomPictures(),
    );
  }
}

class RandomPictures extends StatefulWidget {
  @override
  _RandomPicturesState createState() => _RandomPicturesState();
}

class _RandomPicturesState extends State<RandomPictures> {
  Color kRepeatColor = KInactiveIconColor;
  Color kShuffleColor = KInactiveIconColor;
  IconData selectedIcon = kPlayIcon;
  int number = 1;

  Widget iconButton({@required IconData icon, @required Color color}) {
    return Icon(
      icon,
      color: color,
    );
  } // iconButton()

  void randomNumber() {
    int n = number;
    number = Random().nextInt(4) + 1;
    while (n == number) {
      number = Random().nextInt(4) + 1;
    }
  } //randomNumber()

  void updateIcon() {
    (selectedIcon == kPlayIcon)
        ? selectedIcon = kPauseIcon
        : selectedIcon = kPlayIcon;
  } //updateIcon()

  void toast({String title, context}) {
    Alert(
      context: context,
      title: title,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 500,
              child: Image.asset(
                'images/photo ($number).jpg',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        (kRepeatColor == KInactiveIconColor)
                            ? kRepeatColor = kActiveIconColor
                            : kRepeatColor = KInactiveIconColor;
                      });
                    },
                    child: iconButton(icon: kRepeatIcon, color: kRepeatColor)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      toast(title: 'You pressed previous ', context: context);
                    });
                  },
                  child: iconButton(
                      icon: kPreviousIcon, color: KInactiveIconColor),
                ),
                CircleButton(
                    onPressed: () {
                      setState(() {
                        randomNumber();
                        updateIcon();
                      });
                    },
                    childIcon:
                        iconButton(icon: selectedIcon, color: kWhiteColor)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      toast(title: 'You pressed Next ', context: context);
                    });
                  },
                  child: iconButton(icon: kNextIcon, color: KInactiveIconColor),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        (kShuffleColor == KInactiveIconColor)
                            ? kShuffleColor = kActiveIconColor
                            : kShuffleColor = KInactiveIconColor;
                      });
                    },
                    child:
                        iconButton(icon: kShuffleIcon, color: kShuffleColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
