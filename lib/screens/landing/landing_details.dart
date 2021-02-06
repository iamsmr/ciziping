import 'package:ciziping/constant/color.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Row(
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
      ),
    );
  }
}

class LandingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Note and store",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "If you’re looking for a cross-platform"
              "note-taking tool with just\nenough frills,"
              " it’s hard to look beyond Simplenote.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
                height: 1.7,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: 170,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: ColorPalette.primaryColor,
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
