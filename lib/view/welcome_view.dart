import 'package:bookshareui/widget/clipper_widget.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper1(),
            child: Container(
              color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
            ),
          ),
          ClipPath(
            clipper: MyCustomClipper2(),
            child: Container(
              color: Colors.white24,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
            ),
          )
        ],
      ),
    );
  }
}
