import 'package:ciziping/constant/color.dart';
import 'package:flutter/material.dart';

class CreateFolderDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        children: [
          Text("Create new Collection"),
          Spacer(),
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: [
        Divider(color: Color(0xffEBEBEB)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: 500,
          child: TextFormField(
            autofocus: true,
            style: TextStyle(fontSize: 22),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Give a name",
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 500,
          height: 55,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: ColorPalette.primaryColor,
            child: Text(
              "Create",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}