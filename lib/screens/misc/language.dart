import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  ChangeLanguageState createState() => ChangeLanguageState();
}

class ChangeLanguageState extends State<ChangeLanguage> {
  final LanguageController languageController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    languageController.getLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomNavigationBar(
       
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          GetBuilder<LanguageController>(
              init: languageController,
              builder: (ctx) {
                return GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: languageController.languages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: languageController.selectedLanguages
                              .contains(languageController.languages[index])
                          ? Theme.of(context).primaryColor.darken(0.2)
                          : Theme.of(context).primaryColor,
                      child: Row(
                        children: [
                          Text(
                            languageController.languages[index].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          languageController.selectedLanguages
                                  .contains(languageController.languages[index])
                              ? ThemeIconWidget(
                                  ThemeIcon.checkMark,
                                  color: Theme.of(context).iconTheme.color,
                                )
                              : Container()
                        ],
                      ).p(12).ripple(() {
                        languageController.selectLanguage(
                            languageController.languages[index]);
                      }),
                    ).round(5);
                  },
                );
              }),
          const Spacer(),
          Obx(() => languageController.showMaximumLanguagesMessage.value == true
              ? Center(
                  child: Text(
                    LocalizationString.maximumFourLanguageCanBeSelected,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).vP8,
                )
              : Container()),
          Container(
            height: 0.2,
            width: double.infinity,
            color: Theme.of(context).dividerColor,
          ).vP16,
          SizedBox(
              height: 45,
              width: double.infinity,
              child: FilledButtonType1(
                  text: LocalizationString.save,
                  onPress: () {
                    languageController.savePref();
                  })).bP16
        ],
      ).hP25,
    );
  }
}
