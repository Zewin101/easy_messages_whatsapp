
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class CardDetails extends StatelessWidget {
  String massage;
  String title;
  void Function() onTap;

  CardDetails({super.key, required this.massage, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
        color: CATCOLOR9,
        elevation: 20,
        shadowColor: MASTERCOLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
