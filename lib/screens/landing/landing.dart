import 'package:ciziping/screens/landing/landing_details.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigaton_bar.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CenteredView(
            child: NavigationBar(
              items: [NavItem(title: "Login", onPressed: () {})],
            ),
          ),
          Divider(thickness: 1, color: Color(0xffEBEBEB)),
          SizedBox(height: 50),
          LandingDetails()
        ],
      ),
    );
  }
}
