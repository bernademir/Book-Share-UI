import 'package:bookshareui/widget/bottom_navbar_widget.dart';
import 'package:bookshareui/widget/clipper_widget.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List titles = [
    'Culture',
    'Design',
    'Food',
    'History',
    'Law',
    'Medical',
    'Politics',
    'Science',
    'Sport'
  ];

  List images = [
    'assets/topics/culture.jpg',
    'assets/topics/design.jpg',
    'assets/topics/food.jpg',
    'assets/topics/history.jpg',
    'assets/topics/law.jpg',
    'assets/topics/medical.jpg',
    'assets/topics/politics.jpg',
    'assets/topics/science.jpg',
    'assets/topics/sport.jpg'
  ];

  String welcomeString = "Welcome\nChoose the topics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyCustomClipper1(),
                child: Container(
                  color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4 + 20,
                ),
              ),
              ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  color: Colors.white24,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ),
              Positioned(
                left: 20.0,
                top: MediaQuery.of(context).size.height / 8,
                child: Text(
                  welcomeString,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0; i < 9; i++) gridCard(i),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "More Topics",
              style: TextStyle(
                  color: Color.fromRGBO(255, 110, 161, 1.0),
                  decoration: TextDecoration.underline,
                  fontSize: 15),
            ),
          ),
          applyButton(),
        ],
      ),
    );
  }

  Widget gridCard(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(45.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(images[i]),
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
          child: Text(titles[i]),
        ),
      ],
    );
  }

  Widget applyButton() {
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
