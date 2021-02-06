import 'package:ciziping/constant/color.dart';
import 'package:ciziping/screens/landing/landing_content.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingDetailsDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            "assets/images/main.svg",
            height: 350,
          ),
        ),
        SizedBox(width: 100),
        LandingContent()
      ],
    );
  }
}
