import 'package:ciziping/constant/color.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String path;

  const Logo({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 60,
            color: ColorPalette.primaryColor,
          ),
          SizedBox(width: 10),
          Text(
            "Ciziping",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            path ?? '',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[400],
            ),
          )
        ],
      ),
    );
  }
}
