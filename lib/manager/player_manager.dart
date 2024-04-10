

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class PlayerManager {
  // Listeners: Updates going to the UI
  final currentRadioChangeNotifier = RadioChangeNotifier();
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);
  final playStateNotifier = ValueNotifier<bool>(false);
  final currentSong = ValueNotifier<String>("Radiosesel.com");

  final FlutterRadioPlayer _flutterRadioPlayer = FlutterRadioPlayer();

  String lastListenSongId = '';

  List<RadioModel> stations = [];
  int playingIndex = 0;

  // Events: Calls coming from the UI
  void init() async {}

  Future<void> addPlaylist({
    required RadioModel radio,
  }) async {
    // stations = allRadios;
    // playingIndex = allRadios.indexWhere((element) => element.id == radio.id);

    isFirstSongNotifier.value = playingIndex == 0;
    // isLastSongNotifier.value = playingIndex == allRadios.length - 1;
    playStation(radio);
  }

  playStation(RadioModel radio) async {
    playStateNotifier.value = true;
    playButtonNotifier.value = ButtonState.loading;
    try {
      await _flutterRadioPlayer.init(
        AppConfig.projectName,
        radio.name,
        "https://stream.radiosesel.com/stream#.mp3",
        "true",
      );
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
    await _flutterRadioPlayer.play();
    await _flutterRadioPlayer.setVolume(1);
    _flutterRadioPlayer.metaDataStream?.listen((event) async {
      print(event);
      final _splitted=(event!.split(",").first.split("-"));
      currentSong.value =
          _splitted.last.replaceAll('"', " ")+_splitted.first.replaceAll('ICY: title="', " , ");
          
    });
    playButtonNotifier.value = ButtonState.playing;

    currentRadioChangeNotifier.value = radio;

    if (lastListenSongId != radio.id) {
      // increase song stream count
      getIt<FirebaseManager>().increaseRadioListener(radio);
      lastListenSongId = radio.id;
    }
  }

  pause() {
    _flutterRadioPlayer.pause();
    playButtonNotifier.value = ButtonState.paused;
  }

  play() {
    _flutterRadioPlayer.play();
    playButtonNotifier.value = ButtonState.playing;
  }

  next() {
    playingIndex += 1;
    isFirstSongNotifier.value = playingIndex == 0;
    isLastSongNotifier.value = playingIndex == stations.length - 1;

    if (stations.length > playingIndex) {
      playStation(stations[playingIndex]);
    }
  }

  previous() {
    playingIndex -= 1;

    isFirstSongNotifier.value = playingIndex == 0;
    isLastSongNotifier.value = playingIndex == stations.length - 1;

    if (stations.length > playingIndex) {
      playStation(stations[playingIndex]);
    }
  }
}
