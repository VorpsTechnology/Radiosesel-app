import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class DashboardController extends GetxController {
  RxList<HomeSliderModel> homeSliders = <HomeSliderModel>[].obs;
  RxList sections = [].obs;
  RxBool isLoading = false.obs;

  loadData() {
    getAllHomeSliders();
    isLoading.value = true;
    // getIt<FirebaseManager>().getHomePageData().then((result) {
    //   isLoading.value = false;
    //   sections.value = result;
    //   update();
    // });
  }

  sliderTapped(HomeSliderModel slider) {
    // getIt<FirebaseManager>()
    //     .getMultipleRadiosByIds(radiosId: [slider.itemId]).then((result) {
    //   if (result.isNotEmpty) {
    //     Get.to(() => RadioDetail(
    //           radio: result.first,
    //         ));
    //   }
    // });
  }

  getAllHomeSliders() {
    // getIt<FirebaseManager>().getAllHomeSliders().then((result) {
    //   homeSliders.value = result;
    //   update();
    // });
  }
}
