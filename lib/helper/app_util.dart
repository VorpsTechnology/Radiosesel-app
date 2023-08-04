import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';

class AppUtil {
  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static showToast({required String message, required bool isSuccess}) {
    Get.snackbar(
        isSuccess == true
            ? LocalizationString.success
            : LocalizationString.error,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: isSuccess == true ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
        icon: const Icon(Icons.error, color: Colors.white));
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showLoader(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
          );
        });
  }

  static void dismissLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget addProgressIndicator(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
    ));
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<File> findPath(String imageUrl) async {
    final cache = DefaultCacheManager();
    final file = await cache.getSingleFile(imageUrl);
    return file;
  }

}
