import 'package:ciziping/screens/landing/landing_content.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingDetailMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/main.svg",
            height: 350,
          ),
          SizedBox(height: 70),
          LandingContent(mobile:true)
        ],
      ),
    );
  }
}
