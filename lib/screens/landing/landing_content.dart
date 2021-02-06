import 'package:ciziping/constant/color.dart';
import 'package:flutter/material.dart';

class LandingContent extends StatelessWidget {
  final bool mobile;

  const LandingContent({Key key, this.mobile = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            "Create Note and store",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40),
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
            width: mobile ? 250 : 170,
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
    );
  }
}
