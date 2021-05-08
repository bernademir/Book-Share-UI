import 'package:flutter/material.dart';

import '../model/list_model.dart';
import '../widget/clipper_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Lists object = Lists();

  String buttonText = "Edit Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _sizedBox(context),
          _profileDetailRow(context),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _headlines(context, 0),
          ),
          _listContainer(
              context,
              MediaQuery.of(context).size.height / 4,
              object.profileAccount.length,
              object.accountIcons,
              object.profileAccount),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _headlines(context, 1),
          ),
          _listContainer(
              context,
              MediaQuery.of(context).size.height / 3 + 50,
              object.profileSettings.length,
              object.settingsIcons,
              object.profileSettings),
        ],
      ),
    );
  }

  Row _profileDetailRow(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 3; i++) _texts(i, context),
        SizedBox(width: 20.0),
        _editButton(),
      ],
    );
  }

  _sizedBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          _clipPath1(context),
          _clipPath2(context),
          _profilePhoto(context)
        ],
      ),
    );
  }

  _listContainer(BuildContext context, double height, int itemCount,
      List<IconData> icondata, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: height,
      child: _listView(itemCount, icondata, items),
    );
  }

  _listView(int itemCount, List<IconData> icondata, List<String> items) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              icondata[index],
              color: Color.fromRGBO(255, 110, 161, 1.0),
            ),
            title: Text(items[index]),
          );
        });
  }

  _headlines(BuildContext context, int i) {
    return Text(
      object.profileHeadlines[i],
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: Colors.black38),
    );
  }

  _editButton() {
    return Container(
      width: 120.0,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(255, 110, 161, 1.0),
          ),
        ),
        child: _buttonText(),
      ),
    );
  }

  _buttonText() {
    return Text(
      buttonText,
      style: TextStyle(color: Colors.white),
    );
  }

  _texts(int i, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _numberText(i, context),
          _subtitleText(i),
        ],
      ),
    );
  }

  _subtitleText(int i) {
    return Text(
      object.profileSubtitles[i],
      style: TextStyle(
        color: Colors.black38,
      ),
    );
  }

  _numberText(int i, BuildContext context) {
    return Text(
      object.profileNumbers[i],
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: Colors.black45, fontWeight: FontWeight.bold),
    );
  }

  _profilePhoto(BuildContext context) {
    return Positioned(
      right: 30,
      top: MediaQuery.of(context).size.height / 5 - 70,
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage(object.profileAvatar),
      ),
    );
  }

  _clipPath2(BuildContext context) {
    return Positioned(
      child: ClipPath(
        clipper: MyCustomClipper2(),
        child: Container(
          color: Colors.white24,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 5 - 20,
        ),
      ),
    );
  }

  _clipPath1(BuildContext context) {
    return Positioned(
      child: ClipPath(
        clipper: MyCustomClipper1(),
        child: Container(
          color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 5,
        ),
      ),
    );
  }
}
