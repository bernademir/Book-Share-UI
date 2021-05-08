import 'package:flutter/material.dart';

import '../model/image_manager.dart';
import '../widget/float_app_bar.dart';

class WishlistView extends StatefulWidget {
  @override
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  late final ImageManager imageManager;
  String buttonBuy = "Buy";
  String buttonRemove = "Remove";

  @override
  void initState() {
    imageManager = ImageManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatAppBar(),
      body: ListView(
        children: [
          for (var i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _wishBookContainer(context),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _bookText(context),
                        _writerText(),
                        _buttonsRow(),
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  _buttonsRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          _textButtons(buttonBuy),
          SizedBox(width: 15.0),
          _textButtons(buttonRemove),
        ],
      ),
    );
  }

  _textButtons(String text) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(255, 110, 161, 1.0))),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _writerText() {
    return Text(
      "Writer Name",
      style: TextStyle(color: Colors.black45),
    );
  }

  _bookText(BuildContext context) {
    return Text(
      "Book Name",
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: Colors.grey[800]),
    );
  }

  _wishBookContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(imageManager.randomImage), fit: BoxFit.cover),
      ),
    );
  }
}
