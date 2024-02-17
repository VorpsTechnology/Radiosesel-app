import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/donation/donation.dart';
import 'package:music_streaming_mobile/screens/news/news_listing.dart';

import '../player/mini_player.dart';

//ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  final RadioModel? radio;

  final String? extraData;

  const MainScreen({
    Key? key,
    this.radio,
    this.extraData,
  }) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  // late MenuType menuType;
  late String? extraData;
  late MenuType menuType;
  int selectedIndex = 0; //New

  bool fullScreenPlayer = false;
  final pageManager = getIt<PlayerManager>();
  // final SettingController settingController = Get.find();
  late BannerAd bannerAd;
  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: adUnitId,
        listener: const BannerAdListener(),
        request: const AdRequest());
    bannerAd.load();
  }

  @override
  void initState() {
    // settingController.getSettings();
    menuType = MenuType.home;
    extraData = widget.extraData;
    super.initState();
    initBannerAd();
    AdsHelper().createInterstitialAd();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    // menuType = widget.menuType;
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  final zoomDrawerController = ZoomDrawerController();
  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    const double _panelMinSize = 160.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
      backgroundColor: getBGColor(currentItem),
      body: ZoomDrawer(
        controller: zoomDrawerController,
        menuScreen: Builder(builder: (context) {
          return MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (value) {
              setState(() {
                currentItem = value;
                ZoomDrawer.of(context)!.close();
              });
            },
          );
        }),
        mainScreen: mainScreen(_panelMinSize, _panelMaxSize),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }

  Widget? getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const Dashboard();

      case MenuItems.donation:
        return const DonationScreen();

      case MenuItems.contactUs:
        return const ContactUs();

      case MenuItems.news:
        return const NewsListing();
    }
    return null;
  }

  Widget mainScreen(double panelMinSize, double panelMaxSize) {
    return ValueListenableBuilder<bool>(
        valueListenable: pageManager.playStateNotifier,
        builder: (_, value, __) {
          return WeSlide(
              backgroundColor: Theme.of(context).colorScheme.background,
              panelMinSize: 60,
              panelMaxSize: panelMaxSize,
              body: getScreen()!,
              // footer: bottomNavBar(),
              footerHeight: 95,
              panel: value == true
                  ? const FullSizePlayerController()
                  : Container(),
              panelHeader:
                  // value == true ? const
                  const SmallSizePlayerController()
              // : Container(),
              );
        });
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen(
      {required this.currentItem, required this.onSelectedItem, Key? key})
      : super(key: key);
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBGColor(currentItem),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) {
    return ListTile(
      selectedTileColor: CommonColor.secondaryColor,
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(
        item.icon,
        color: Colors.white,
      ),
      title: Text(
        item.title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => onSelectedItem(item),
    );
  }
}

Color getBGColor(MenuItem menuType) {
  if (menuType == MenuItems.home) {
    return CommonColor.kBlue;
  } else if (menuType == MenuItems.news) {
    return CommonColor.kYellow;
  } else if (menuType == MenuItems.donation) {
    return CommonColor.kRed;
  } else if (menuType == MenuItems.contactUs) {
    return CommonColor.kGreen;
  }
  return CommonColor.kWhite;
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}

class MenuItems {
  static const home = MenuItem("Home", Icons.home);
  static const donation = MenuItem("Donation", Icons.attach_money_rounded);
  static const news = MenuItem("News", Icons.language);
  static const contactUs = MenuItem("Contact Us", Icons.contact_mail);
  static const all = <MenuItem>[home, donation, news, contactUs];
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}
