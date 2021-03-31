import 'package:bookshareui/widget/float_app_bar.dart';
import 'package:flutter/material.dart';

import '../image_manager.dart';
import '../widget/clipper_widget.dart';

class DiscoverView extends StatefulWidget {
  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  late final ImageManager imageManager;

  @override
  void initState() {
    imageManager = ImageManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String titleStack = "Our Top Picks";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: FloatAppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              _clipPath1(context),
              _clipPath2(context),
              _stackTitle(context, titleStack),
              Positioned(
                top: MediaQuery.of(context).size.height / 4 - 30,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 4 - 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          semanticContainer: true,
                          child: Image.network(
                            imageManager.randomImage,
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _stackTitle(BuildContext context, String titleStack) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4 - 70,
      child: Text(
        titleStack,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
    );
  }

  _clipPath2(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper2(),
      child: Container(
        color: Colors.white24,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2 - 20,
      ),
    );
  }

  _clipPath1(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper1(),
      child: Container(
        color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
