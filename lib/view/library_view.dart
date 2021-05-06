import 'package:flutter/material.dart';

import '../model/image_manager.dart';
import '../widget/float_app_bar.dart';

class LibraryView extends StatefulWidget {
  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  late final ImageManager imageManager;

  List headlines = ["General", "New", "Most Viewed"];

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
          Row(
            children: [
              for (var i = 0; i < headlines.length; i++) Text(headlines[i])
            ],
          ),
        ],
      ),
    );
  }
}
