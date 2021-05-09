import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../view/welcome_view.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        description: "Share Your Favourite Books With Your Family And Friends",
        pathImage: "assets/intro/undraw1.png",
        backgroundColor: Colors.white,
        styleDescription: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      new Slide(
        description: "Discovery 20 Million Books Shelved Online",
        pathImage: "assets/intro/undraw2.png",
        backgroundColor: Colors.white,
        styleDescription: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      new Slide(
        description: "Buy And Sell Books With Us",
        pathImage: "assets/intro/undraw3.png",
        backgroundColor: Colors.white,
        styleDescription: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeView()),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "Get Started",
      style: TextStyle(color: Color.fromRGBO(255, 110, 161, 1.0)),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      "Skip",
      style: TextStyle(color: Colors.black45),
    );
  }

  Widget renderNextBtn() {
    return Text(
      "Next",
      style: TextStyle(color: Colors.black45),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color.fromRGBO(255, 110, 161, 1.0),
      sizeDot: 13.0,
      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      // Next button
      renderNextBtn: this.renderNextBtn(),
    );
  }
}
