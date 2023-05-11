import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';

class StartMenu extends StatelessWidget {
  StartMenu({Key? key}) : super(key: key);
  static const String routeName = 'StartMenu';

  @override
  Widget build(BuildContext context) {
    StarMenuController backgroundStarMenuController = StarMenuController();

    List<Widget> upperMenuItems = [
      Text('menu entry 1'),

    ];

    List<Widget> otherEntries = [
      FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.black,
        child: Icon(Icons.add_call),
      ).addStarMenu(
          items: upperMenuItems, params: StarMenuParameters.dropdown(context)),
      FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.indigo,
        child: Icon(Icons.adb),
      ).addStarMenu(
          items: upperMenuItems, params: StarMenuParameters.dropdown(context)),
      FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple,
        child: Icon(Icons.home),
      ).addStarMenu(
          items: upperMenuItems, params: StarMenuParameters.dropdown(context)),
      FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.delete),
      ).addStarMenu(
          items: upperMenuItems, params: StarMenuParameters.dropdown(context)),
      FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.get_app),
      ).addStarMenu(
          items: upperMenuItems, params: StarMenuParameters.dropdown(context)),
    ];

    return Scaffold(

      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              /// add a menu to the background
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ).addStarMenu(
                items: upperMenuItems,
                params: StarMenuParameters.dropdown(context).copyWith(
                  useTouchAsCenter: true,
                ),
                controller: backgroundStarMenuController,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: StarMenu(
                  params: StarMenuParameters.arc(
                    context,
                    ArcType.semiLeft,
                    radiusX: 100,
                    radiusY: 180,
                  ),
                  items: otherEntries,
                  child: FloatingActionButton(
                      onPressed: null, child: Icon(Icons.home_work_outlined)),
                ),
              ),


            ],
          )),
    );
  }
}


