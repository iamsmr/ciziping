import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/screens/dashboard/create_folder_dialog.dart';
import 'package:ciziping/screens/dashboard/folder_card.dart';
import 'package:ciziping/services/auth_services/auth_service.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:ciziping/widgets/centered_view.dart/centered_view.dart';
import 'package:ciziping/widgets/navigation_bar/navigaton_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initilize() async {
    await DirectoryServices().getALlDirectory();
  }

  @override
  void initState() {
    initilize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);
    final directory = Provider.of<DirectoryServices>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    directory.getALlDirectory();
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
              items: [
                NavItem(
                  title: "logout",
                  onPressed: () => authService.logout(),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: isDark ? Colors.grey[700] : Color(0xffEBEBEB),
          ),
          SizedBox(height: 50),
          Expanded(
            child: CenteredView(
              child: directory.directory == null ||
                      directory.directory.data.length == 0
                  ? Container(
                      child: SvgPicture.asset(
                        "assets/images/no folder.svg",
                        height: 200,
                      ),
                    )
                  : GridView.builder(
                      itemCount: directory.directory != null
                          ? directory.directory.count
                          : 0,
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
                        return FolderCard(
                          directory: directory.directory.data[index],
                        );
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
