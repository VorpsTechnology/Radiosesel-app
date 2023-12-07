import 'package:get/get.dart';
import 'package:music_streaming_mobile/manager/news_manager.dart';
import 'package:music_streaming_mobile/model/news_model.dart';

class NewsController extends GetxController {
  final _newsManager = NewsManager();
  RxList<Item> news = <Item>[].obs;
  RxBool isLoading = false.obs;
  RxString currentCategory = "All".obs;

  getNews(int index) async {
    isLoading.value = true;
    currentCategory.value = NewsManager().newsCategories[index];
    news.value =
        await _newsManager.getNews(_newsManager.newsCategoriesApi[index]);
    isLoading.value = false;
    update();
  }
}
