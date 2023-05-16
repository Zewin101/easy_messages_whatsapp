import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class CardDetails extends StatelessWidget {
  String massage;
  String title;
  void Function() onTap;
  Function(BuildContext)? DELETE;
  Function(BuildContext)? EDIT;

  CardDetails(
      {super.key,
      required this.massage,
      required this.title,
      required this.onTap,
      required this.DELETE,
       this.EDIT});

  @override
  Widget build(BuildContext context) {
    var setting=Provider.of<SettingProvider>(context);
    return Container(

      margin: EdgeInsets.only(left: 5,right: 10,top: 5),
      child: Slidable(
        startActionPane: ActionPane(
          motion:ScrollMotion() ,
          children: [
            SlidableAction(
              onPressed: DELETE,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'DELETE',
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 1,),
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: EDIT,
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit_note_rounded,
              label: 'EDIT',
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Card(

            color: setting.cardColor[setting.colorNumber],
            elevation: 40,
            shadowColor: setting.cardColor[setting.colorNumber],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    massage,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
