import 'package:bookshareui/widget/clipper_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            child: ClipPath(
              clipper: MyCustomClipper1(),
              child: Container(
                color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16 + 20,
              ),
            ),
          ),
          Positioned(
            child: ClipPath(
              clipper: MyCustomClipper2(),
              child: Container(
                color: Colors.white24,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 230,
            height: 120,
            width: 120,
            child: CircleAvatar(
              backgroundImage: NetworkImage(""),
            ),
          )
        ],
      ),
    );
  }
}
