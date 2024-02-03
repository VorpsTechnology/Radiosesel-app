import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/theme/extention.dart';
import 'package:shimmer/shimmer.dart';

class PListTile extends StatelessWidget {
  const PListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      trailing: CustomWidget.rectangular(height: 70, width: 70),
      title: CustomWidget.rectangular(
        height: 70,
        // width: 100,
      ),
      // trailing: Icon(Icons.more_vert_outlined),
    );
  }
}

class PTile extends StatelessWidget {
  const PTile({
    Key? key,
  }) : super(key: key);
  // final Size? size;

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: CustomWidget.rectangular(
        height: 35,
        // width: 100,
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {Key? key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder(),
        super(key: key);

  const CustomWidget.circular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.grey[300]!,
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}

Widget listShimmer() {
  return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => const PListTile(),
          separatorBuilder: (context, index) {
            if (index % 2 == 0) {
              return Container(
                  height: 60,
                  width: double.infinity,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: const PTile());
            } else {
              return const Divider(
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              );
            }
          },
          itemCount: 10)
      .vP8;
}
