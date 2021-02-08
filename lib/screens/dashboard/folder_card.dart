import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/directory.dart';
import 'package:ciziping/screens/dashboard/create_folder_dialog.dart';
import 'package:ciziping/screens/dashboard/inside_folder.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FolderCard extends StatelessWidget {
  final Directory directory;

  const FolderCard({Key key, this.directory}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final directoryServices = Provider.of<DirectoryServices>(context);
    final popUpMenuOptions = [
      {"title": "Rename", "icon": Icons.edit},
      {"title": "Delete", "icon": Icons.delete}
    ];
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InsideFolder(directory: directory),
        ),
      ),
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
                  directory.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                PopupMenuButton(
                  onSelected: (val) async {
                    if (val == "Delete") {
                      await directoryServices.deleteDirectory(directory.id);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context)=> CreateFolderDialog(isEdit:true,directory:directory)
                      );
                      // await directoryServices.updateDirectory(directoryId, userID, newName)
                    }
                  },
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (context) {
                    return popUpMenuOptions.map((e) {
                      return PopupMenuItem(
                        child: Row(children: [
                          Icon(e["icon"]),
                          SizedBox(width: 20),
                          Text(e["title"])
                        ]),
                        value: e["title"],
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
