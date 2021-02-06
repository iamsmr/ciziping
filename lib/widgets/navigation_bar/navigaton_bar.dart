import 'package:ciziping/constant/color.dart';
import 'package:ciziping/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final List<NavItem> items;

  const NavigationBar({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Logo(), Row(children: items)],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  NavItem({this.onPressed, this.title});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorPalette.primaryColor,
        ),
      ),
    );
  }
}
