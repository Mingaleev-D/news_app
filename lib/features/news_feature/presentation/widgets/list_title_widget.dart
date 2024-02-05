import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget(
      {super.key,
      required this.labet,
      required this.iconData,
      required this.fnc});
  final String labet;
  final IconData iconData;
  final Function fnc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        labet,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () {
        fnc();
      },
    );
  }
}
