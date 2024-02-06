import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/news_feature/presentation/widgets/list_title_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                    'assets/images/newspaper.png',
                    height: 60,
                    width: 60,
                  )),
                  const SizedBox(height: 20),
                  const Flexible(
                      child: Text(
                    'News app',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTitleWidget(
              labet: 'Home',
              iconData: CupertinoIcons.house_fill,
              fnc: () {},
            ),
            ListTitleWidget(
              labet: 'Bookmarks',
              iconData: CupertinoIcons.bookmark_solid,
              fnc: () {},
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
