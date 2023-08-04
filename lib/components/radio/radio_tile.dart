import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class RadioHorizontalTile extends StatelessWidget {
  final RadioModel radio;

  const RadioHorizontalTile({Key? key, required this.radio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          radio.image,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ).round(10),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(radio.name, style: Theme.of(context).textTheme.titleLarge),
            // Text('${artist.albums} albums', style: TextStyles.body.subTitleColor),
            // Text('10 albums', style: TextStyles.body.subTitleColor),
          ],
        ),
      ],
    );
  }
}

class RadioCard extends StatelessWidget {
  final RadioModel radio;

  const RadioCard({Key? key, required this.radio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
                aspectRatio: 1.2,
                child: Image.network(
                  radio.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ).round(10)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Theme.of(context).primaryColor.darken(0.5),
                  child: Column(
                    children: [
                      Text(radio.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                    ],
                  ).setPadding(left: 4, right: 4, top: 8, bottom: 8),
                ).bottomRounded(10))
          ],
        )
      ],
    ).round(10);
  }
}

class CircleRadioCard extends StatefulWidget {
  final RadioModel radio;
  final bool isSelected;
  final VoidCallback? selectionCallback;

  const CircleRadioCard(
      {Key? key,
      required this.radio,
      required this.isSelected,
      this.selectionCallback})
      : super(key: key);

  @override
  CircleRadioCardState createState() => CircleRadioCardState();
}

class CircleRadioCardState extends State<CircleRadioCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      widget.radio.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ).circular),
                Text(
                  widget.radio.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ).tP8,
              ],
            ),
            widget.isSelected == true
                ? Positioned(
                    child: ThemeIconWidget(
                    ThemeIcon.filledCheckMark,
                    color: Theme.of(context).primaryColor,
                    size: 25,
                  ))
                : Container()
          ],
        ).ripple(() {
          // if(widget.selectionCallback != null){
          widget.selectionCallback!();
          // }
        })
      ],
    );
  }
}
