import 'package:ciziping/screens/auth/authentication.dart';
import 'package:ciziping/screens/landing/landing_details_desktop.dart';
import 'package:ciziping/screens/landing/landing_details_mobile.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigation_bar/navigaton_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
              items: [
                NavItem(
                  title: "Login",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authentication(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 1, color: Color(0xffEBEBEB)),
          SizedBox(height: 50),
          Expanded(
            child: CenteredView(
              child: ScreenTypeLayout(
                mobile: LandingDetailMobile(),
                desktop: LandingDetailsDesktop(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
