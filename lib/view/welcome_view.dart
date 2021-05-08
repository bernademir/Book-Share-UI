import 'package:flutter/material.dart';

import '../model/list_model.dart';
import '../widget/bottom_navbar_widget.dart';
import '../widget/clipper_widget.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  Lists category = Lists();

  String welcomeString = "Welcome\nChoose the topics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _clipPath1(context, MediaQuery.of(context).size.height / 4 + 20),
              _clipPath2(context, MediaQuery.of(context).size.height / 4),
              _welcomeText(context),
            ],
          ),
          _gridViewExpanded(),
          _gridInkWell(),
          _applyButton(),
        ],
      ),
    );
  }

  _gridViewExpanded() {
    return Expanded(
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: _gridView(),
        ),
      ),
    );
  }

  _welcomeText(BuildContext context) {
    return Positioned(
      left: 20.0,
      top: MediaQuery.of(context).size.height / 8,
      child: Text(
        welcomeString,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }

  _gridInkWell() {
    return InkWell(
      onTap: () {},
      child: Text(
        "More Topics",
        style: TextStyle(
            color: Color.fromRGBO(255, 110, 161, 1.0),
            decoration: TextDecoration.underline,
            fontSize: 15),
      ),
    );
  }

  _gridView() {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      children: [
        for (int i = 0; i < 9; i++) _gridCard(i),
      ],
    );
  }

  _clipPath2(BuildContext context, double height) {
    return ClipPath(
      clipper: MyCustomClipper2(),
      child: Container(
        color: Colors.white24,
        width: double.infinity,
        height: height,
      ),
    );
  }

  _clipPath1(BuildContext context, double height) {
    return ClipPath(
      clipper: MyCustomClipper1(),
      child: Container(
        color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
        width: double.infinity,
        height: height,
      ),
    );
  }

  _gridCard(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(45.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(category.welcomeViewImages[i]),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(category.welcomeViewTitles[i]),
        ),
      ],
    );
  }

  _applyButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCustomNavBar()),
        );
      },
      child: Text(
        "Apply",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromRGBO(255, 110, 161, 1.0),
        ),
        fixedSize: MaterialStateProperty.all(
          Size.fromWidth(MediaQuery.of(context).size.width - 40),
        ),
      ),
    );
  }
}
