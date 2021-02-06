import 'package:ciziping/constant/color.dart';
import 'package:ciziping/helper/responsive_helper.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigation_bar/navigaton_bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
            barrierColor: Colors.white.withOpacity(.7),
            context: context,
            builder: (_) => SimpleDialog(
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
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
            ),
          );
        },
      ),
      body: Column(
        children: [
          CenteredView(
            child: NavigationBar(
              items: [NavItem(title: "logout", onPressed: () {})],
            ),
          ),
          Divider(thickness: 1, color: Color(0xffEBEBEB)),
          SizedBox(height: 50),
          Expanded(
            child: CenteredView(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: (size.width >= 1209)
                    ? 4
                    : (size.width >= 971)
                        ? 3
                        : (size.width <= 697)
                            ? 1
                            : 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  Expanded(child: FolderCard()),
                  FolderCard(),
                  FolderCard(),
                  FolderCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FolderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);

    final popUpMenuOptions = [
      {"title": "Rename", "icon": Icons.edit},
      {"title": "Delete", "icon": Icons.delete}
    ];
    return InkWell(
      onLongPress: () {},
      child: Container(
        // padding: responsivePadding(mediaQuery),
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
                    return popUpMenuOptions
                        .map(
                          (e) => PopupMenuItem(
                              child: Row(children: [
                                Icon(e["icon"]),
                                SizedBox(width: 20),
                                Text(e["title"])
                              ]),
                              value: e),
                        )
                        .toList();
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
