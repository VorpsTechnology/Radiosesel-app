import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:flutter/material.dart';

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PlayerManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return ThemeIconWidget(
          ThemeIcon.prev,
          color: isFirst == false
              ? Theme.of(context).iconTheme.color
              : Colors.white.withOpacity(0.7),
          size: 50,
        ).ripple(() {
          isFirst == true ? null : pageManager.previous();
        });
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  final double size;

  const PlayButton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PlayerManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return size == 40
                ? Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 32.0,
                    height: 32.0,
                    child: const CircularProgressIndicator(),
                  )
                : ThemeIconWidget(
                    ThemeIcon.pause,
                    color: CommonColor.secondaryColor,
                    size: size,
                  ).ripple(() {
                    pageManager.pause();
                  });
          case ButtonState.paused:
            return ThemeIconWidget(
              ThemeIcon.play,
              color: Colors.white,
              size: size,
            ).ripple(() {
              pageManager.play();
            });
          default:
            return ThemeIconWidget(
              ThemeIcon.pause,
              color: CommonColor.secondaryColor,
              size: size,
            ).ripple(() {
              pageManager.pause();
            });
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PlayerManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return ThemeIconWidget(
          ThemeIcon.next,
          color: isLast == false
              ? Theme.of(context).iconTheme.color
              : Colors.white.withOpacity(0.7),
          size: 50,
        ).ripple(() {
          isLast == true ? null : pageManager.next();
        });
      },
    );
  }
}
