import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class ContactUsController extends GetxController {
  // Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> subject = TextEditingController().obs;
  Rx<TextEditingController> message = TextEditingController().obs;

  sendMessage() {
    // if (name.value.text.isEmpty) {
    //   showMessage(LocalizationString.pleaseEnterName, true);
    //   return;
    // }
    if (email.value.text.isEmpty) {
      showMessage(LocalizationString.pleaseEnterEmail, true);
      return;
    }
    if (subject.value.text.isEmpty) {
      showMessage(LocalizationString.pleaseEnterPhoneNumber, true);
      return;
    }
    if (message.value.text.isEmpty) {
      showMessage(LocalizationString.pleaseEnterMessage, true);
      return;
    }

    EasyLoading.show(status: LocalizationString.loading);
    getIt<FirebaseManager>()
        .sendContactusMessage(
            email.value.text, subject.value.text, message.value.text)
        .then((result) {
      EasyLoading.dismiss();
      if (result.status == true) {
        showMessage(result.message ?? LocalizationString.requestSent, false);
        email.value.clear();
        subject.value.clear();
        message.value.clear();
      } else {
        showMessage(result.message ?? LocalizationString.errorMessage, true);
      }
    });
  }

  showMessage(String message, bool isError) {
    AppUtil.showToast(message: message, isSuccess: !isError);
  }
}
