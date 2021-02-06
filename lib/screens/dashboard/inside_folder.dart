import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigation_bar/navigaton_bar.dart';
import 'package:flutter/material.dart';

class InsideFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CenteredView(
            child: NavigationBar(
              path: "/sameer",
              items: [
                NavItem(
                  title: "Logout",
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
