import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchbarAnimation(),
    );
  }

  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  'Search Anything here',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 85.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  height: 660.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SearchBarAnimation(
                          textEditingController: searchText,
                          isOriginalAnimation: true,
                          enableKeyboardFocus: true,
                          onExpansionComplete: () {
                            debugPrint(
                                'do something just after searchbox is opened.');
                          }, 
                          onCollapseComplete: () {
                            debugPrint(
                                'do something just after searchbox is closed.');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
