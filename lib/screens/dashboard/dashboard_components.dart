import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';

Widget radioSection(Section section, BuildContext context, int tabIndex) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.heading.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 5,
            width: section.heading.length * 6,
            color: Theme.of(context).primaryColor,
          ).round(5)
        ],
      ).hP16,
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 210,
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          itemCount: section.items.count(),
          itemBuilder: (BuildContext ctx, int index) {
            return SizedBox(
              width: 250,
              child: RadioCard(
                radio: section.items[index],
              ).ripple(() {
                Get.to(() => RadioDetail(
                      radio: section.items[index],
                     
                    ));
              }),
            );
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    ],
  );
}
