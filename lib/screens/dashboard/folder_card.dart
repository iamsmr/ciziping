import 'package:ciziping/constant/color.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final popUpMenuOptions = [
      {"title": "Rename", "icon": Icons.edit},
      {"title": "Delete", "icon": Icons.delete}
    ];
    return InkWell(
      onLongPress: () {},
      child: Container(
        child: Column(
          children: [
            Icon(
              Icons.folder,
              size: 170,
              color: ColorPalette.darkGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sameer Pokharle",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                PopupMenuButton(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (context) {
                    return popUpMenuOptions.map((e) {
                      return PopupMenuItem(
                        child: Row(children: [
                          Icon(e["icon"]),
                          SizedBox(width: 20),
                          Text(e["title"])
                        ]),
                        value: e,
                      );
                    }).toList();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
