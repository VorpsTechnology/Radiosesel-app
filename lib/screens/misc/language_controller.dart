import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class LanguageController extends GetxController {
  RxList<LanguageModel> languages = <LanguageModel>[].obs;
  RxList<LanguageModel> selectedLanguages = <LanguageModel>[].obs;

  RxBool showMaximumLanguagesMessage = false.obs;

  selectLanguage(LanguageModel language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
      showMaximumLanguagesMessage.value = false;
    } else {
      if (selectedLanguages.length == 4) {
        showMaximumLanguagesMessage.value = true;
      } else {
        selectedLanguages.add(language);
      }
    }
    update();
  }

  savePref() {
    if (selectedLanguages.isEmpty) {
      showMessage(LocalizationString.pleaseSelectAtLeastOneLanguage, true);
      return;
    }
    // getIt<FirebaseManager>()
    //     .updateUserLanguagePref(selectedLanguages)
    //     .then((response) {
    //   if (response.status == true) {
    //     getIt<UserProfileManager>().refreshProfile();
    //     Get.back();
    //   } else {
    //     showMessage(LocalizationString.errorMessage, true);
    //   }
    // });
  }

  getLanguages() {
    // getIt<FirebaseManager>().getAllLanguages().then((result) {
    //   languages.value = result;

    //   for (LanguageModel language in languages) {
    //     if (getIt<UserProfileManager>()
    //         .user!
    //         .prefLanguages
    //         .contains(language.name)) {
    //       selectedLanguages.add(language);
    //     }
    //   }
    //   update();
    // });
  }

  showMessage(String message, bool isError) {
    AppUtil.showToast(message: message, isSuccess: !isError);
  }
}
