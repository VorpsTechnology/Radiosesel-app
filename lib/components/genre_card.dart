import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class GenreCard extends StatelessWidget {
  final GenreModel genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);

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
                  genre.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ).round(10)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  color: Colors.black38,
                  child: Center(
                    child: Text(genre.name,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                  ),
                ))
          ],
        )
      ],
    ).round(10);
  }
}
