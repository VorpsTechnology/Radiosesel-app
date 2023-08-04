import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class DrawerlistItemGroup extends StatelessWidget {
  final List<Widget> items;
  final String title;

  const DrawerlistItemGroup({Key? key, required this.items, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 40,
            width: double.infinity,
            color: Theme.of(context).backgroundColor.lighten(),
            child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(title, style: Theme.of(context).textTheme.bodyLarge).hP16)),
        for (Widget item in items) item
      ],
    );
  }
}

class DrawerlistItem extends StatelessWidget {
  final ThemeIconWidget icon;
  final String title;

  const DrawerlistItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )
        ],
      ),
    ).hP16;
  }
}
