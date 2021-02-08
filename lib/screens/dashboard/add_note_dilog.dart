import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/directory.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteDialog extends StatefulWidget {
  final Directory directory;

  const AddNoteDialog({Key key, this.directory}) : super(key: key);
  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  List<String> tags = [];
  TextEditingController content = TextEditingController();
  TextEditingController tag = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final directoryServices = Provider.of<DirectoryServices>(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Text("Create New Note"),
          Spacer(),
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: 500,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                maxLines: null,
                controller: content,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Content",
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      maxLines: null,
                      controller: tag,
                      style: TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tags",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() => tags.add(tag.text.trim())),
                  )
                ],
              ),
              tags.length > 0
                  ? Container(
                      height: 50,
                      child: ListView.builder(
                        itemCount: tags.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Chip(
                              onDeleted: () => setState(
                                () => tags.removeAt(index),
                              ),
                              label: Text(tags[index]),
                            ),
                          );
                        },
                      ),
                    )
                  : Container()
            ],
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
              await directoryServices
                  .createNote(
                    content.text.trim(),
                    tags,
                    widget.directory.id,
                  )
                  .then(
                    (value) => Navigator.pop(context),
                  );
            },
          ),
        )
      ],
    );
  }
}
