import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/manager/helper_manager.dart';
import 'package:music_streaming_mobile/screens/contact_us/contactus_controller.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsController contactUsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            "assets/icons/drawer_icon.png",
            width: 30,
            height: 30,
            color: CommonColor.kWhite,
          ),
          onTap: () {
            ZoomDrawer.of(context)?.open();
          },
        ),
        backgroundColor: Colors.green,
        title: Text(LocalizationString.contactUs),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Sent mail to  ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'radiosesel.com@hotmail.com',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CommonColor.secondaryColor,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => InputField(
                      isDisabled: false,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      controller: contactUsController.email.value,
                      hintText: "Enter your email",
                      showDivider: false,
                      showBorder: true,
                      cornerRadius: 10,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => InputField(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      controller: contactUsController.subject.value,
                      hintText: LocalizationString.subject,
                      showBorder: true,
                      showDivider: false,
                      cornerRadius: 10,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => InputField(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      controller: contactUsController.message.value,
                      hintText: LocalizationString.message,
                      showBorder: true,
                      showDivider: false,
                      maxLines: 6,
                      cornerRadius: 10,
                    )),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButtonType1(
                        isEnabled: true,
                        cornerRadius: 10,
                        text: LocalizationString.send,
                        enabledTextStyle: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                            color: CommonColor.kWhite),
                        onPress: () async {
                          contactUsController.sendMessage();
                        }))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                socialButtons("assets/icons/www.png", () async {
                  await HelperServices.launchLink("https://www.radiosesel.com");
                }),
                socialButtons("assets/icons/facebook.png", () async {
                  await HelperServices.launchLink(
                      "https://www.facebook.com/radiosesel");
                }),
                socialButtons("assets/icons/twitter.png", () async {
                  await HelperServices.launchLink(
                      "https://twitter.com/radiosesel?lang=en");
                }),
                socialButtons("assets/icons/whatsapp.png", () async {
                  await HelperServices.launchLink(
                      "https://wa.me/+447459279119");
                }),
              ],
            ).vP25,
          ],
        ).hP16,
      ),
    );
  }

  GestureDetector socialButtons(
    String cover,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(cover),
                colorFilter: const ColorFilter.mode(
                    CommonColor.primaryColor, BlendMode.srcATop))),
      ),
    );
  }
}
