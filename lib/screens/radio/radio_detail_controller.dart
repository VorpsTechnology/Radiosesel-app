import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class RadioDetailController extends GetxController {
  RxList<RadioModel> similarRadios = <RadioModel>[].obs;
  RxBool isFav = false.obs;
  Rx<RadioModel?> radio = Rx<RadioModel?>(null);

  setCurrentRadio(RadioModel model) {
    radio.value = model;
    update();
  }

  checkIfAlreadyLiked() {
    getIt<FirebaseManager>()
        .checkIfAlreadyLikedRadio(radio.value!.id)
        .then((value) {
      isFav.value = value;
      update();
    });
  }

  getSimilarRadios() {
    getIt<FirebaseManager>()
        .getAllRadios(genreId: radio.value!.genreId)
        .then((result) {
      similarRadios.value = result;
      update();
    });
  }

  favBtnTapped() {
    // if (isFav.value == true) {
    //   getIt<FirebaseManager>().unlikeRadio(radio.value!.id);
    //   isFav.value = false;
    // } else {
    //   getIt<FirebaseManager>().likeRadio(radio.value!.id);
    //   isFav.value = true;
    // }
  }
}
