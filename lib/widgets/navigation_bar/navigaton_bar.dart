import 'package:ciziping/constant/color.dart';
import 'package:ciziping/services/themeServices/theme.dart';
import 'package:ciziping/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  final List<NavItem> items;
  final String path;

  const NavigationBar({Key key, @required this.items, this.path})
      : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(path: widget.path),
          Consumer<ChangeTheme>(
            builder: (context, changeTheme, child) {
              bool isDark = changeTheme.isDark;
              return Switch(
                value: isDark,
                onChanged: (val) {
                  if (isDark) {
                    changeTheme.setLightMode();
                  } else {
                    changeTheme.setDarkMode();
                  }
                  // changeTheme.changeTheme(val);
                },
              );
            },
          ),
          Row(
            children: widget.items,
          )
        ],
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
