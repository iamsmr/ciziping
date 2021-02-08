import 'dart:math';

import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/NoteResponse.dart';
import 'package:ciziping/models/directory.dart';
import 'package:ciziping/screens/dashboard/add_note_dilog.dart';
import 'package:ciziping/services/auth_services/auth_service.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigation_bar/navigaton_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsideFolder extends StatelessWidget {
  final Directory directory;

  InsideFolder({Key key, this.directory}) : super(key: key);
  // List<Color> colors = [
  //   Colors.pink,
  //   Colors.green,
  //   Colors.amber[900],
  //   Colors.purple,
  //   Colors.deepOrange,
  //   Colors.blue,
  //   Colors.teal,
  //   Colors.brown,
  // ];
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final directoryService = Provider.of<DirectoryServices>(context);
    directoryService.getNotes(directory.id);
    List<Note> notes = [];
    if (directoryService.notesResponse != null) {
      notes = directoryService.notesResponse.data.notes;
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            barrierColor: Colors.white.withOpacity(.7),
            context: context,
            builder: (_) => AddNoteDialog(directory: directory),
          );
        },
      ),
      body: Column(
        children: [
          CenteredView(
            child: NavigationBar(
              path: "/${directory.name}",
              items: [
                NavItem(
                  title: "Logout",
                  onPressed: () => authService.logout(),
                ),
              ],
            ),
          ),
          Expanded(
            child: CenteredView(
              child: GridView.builder(
                itemCount: notes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (size.width >= 1209)
                      ? 3
                      : (size.width >= 971)
                          ? 2
                          : (size.width <= 697)
                              ? 1
                              : 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  // Color color = colors[Random().nextInt(colors.length)];
                  Color color = ColorPalette.primaryColor;
                  return Card(
                    elevation: 0.4,
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Consumer<DirectoryServices>(
                              builder: (context, directoryService, child) =>
                                  IconButton(
                                icon: Icon(Icons.cancel, color: Colors.white),
                                onPressed: () async {
                                  await directoryService.deleteNote(
                                    directory.id,
                                    notes[index].id,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            notes[index].content,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            child: ListView.builder(
                              itemCount: notes[index].tags.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Chip(
                                    // backgroundColor: Colors.white,
                                    label: Text(
                                      notes[index].tags[i],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
