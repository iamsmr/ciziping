import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/models/User/User_response.dart';
import 'package:ciziping/models/directory.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFolderDialog extends StatefulWidget {
  final bool isEdit;
  final Directory directory;

  CreateFolderDialog({
    this.isEdit = false,
    this.directory,
  });

  @override
  _CreateFolderDialogState createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<CreateFolderDialog> {
  TextEditingController name;

  @override
  void initState() {
    name =
        TextEditingController(text: widget.isEdit ? widget.directory.name : '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final directoryServices = Provider.of<DirectoryServices>(context);
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
            controller: name,
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
            onPressed: () async {
              if (name.text.isNotEmpty) {
                if (widget.isEdit) {
                  await directoryServices
                      .updateDirectory(
                        widget.directory.id,
                        Preferences.prefs.getString("uid"),
                        name.text,
                      )
                      .then(
                        (value) => Navigator.pop(context),
                      );
                } else {
                  await directoryServices
                      .createNewDirectory(
                        Preferences.prefs.getString("uid"),
                        name.text.trim(),
                      )
                      .then(
                        (value) => Navigator.pop(context),
                      );
                }
              }
            },
          ),
        )
      ],
    );
  }
}
