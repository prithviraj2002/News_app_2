import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../screens/saved_articles_screen.dart';
import '../screens/tab_bar_screen.dart';

class AdvanceDrawer extends StatefulWidget {
  AdvanceDrawer({Key? key}) : super(key: key);

  @override
  State<AdvanceDrawer> createState() => _AdvanceDrawerState();
}

class _AdvanceDrawerState extends State<AdvanceDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      drawer: Drawer(
          elevation: 5,
          semanticLabel: 'News App',
          child: ListView(
            children: [
              Container(
                height: 50,
                child: const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.only(bottom: 0),
                  child: Center(
                    child: Text(
                      'News App',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                  title: const Text('Home'),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(TabBarScreen.routeName);
                  }),
              const Divider(
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                title: const Text('Your saved articles'),
                leading: const Icon(
                  Icons.bookmark,
                  color: Colors.black38,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(SavedArticlesList.routeName);
                },
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                title: const Text('Log out'),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black38,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            elevation: 5,
                            title: const Text('LogOut?'),
                            content: SingleChildScrollView(
                                child: ListBody(
                              children: const [
                                Text('Are you sure want to logout?'),
                              ],
                            )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Yes',
                                      style: TextStyle(color: Colors.red)))
                            ],
                          ));
                },
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
              ),
            ],
          )
      ),
      child: Container(),
    );
  }
}
