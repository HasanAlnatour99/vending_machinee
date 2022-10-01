import 'package:flutter/material.dart';
import 'package:vending_machine/UI/theme.dart';

import '../main.dart';
import 'LeftSide/leftmain.dart';
import 'RightSide/cancel.dart';
import 'RightSide/rightmain.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[400],
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 LeftMain(),
                const SizedBox(
                  width: 20,
                ),
                 RightMain(),
                const SizedBox(
                  width: 20,
                ),
                 Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /2),child: CancelWidget()),
              ]),
        ),
      ),
    );
  }
}