import 'package:ciziping/constant/color.dart';
import 'package:ciziping/screens/dashboard/create_folder_dialog.dart';
import 'package:ciziping/screens/dashboard/folder_card.dart';
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
            builder: (_) => CreateFolderDialog(),
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
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (size.width >= 1209)
                      ? 4
                      : (size.width >= 971)
                          ? 3
                          : (size.width <= 697)
                              ? 1
                              : 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return FolderCard();
                },
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
