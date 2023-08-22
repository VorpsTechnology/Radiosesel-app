import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/donation/donation.dart';
import 'package:music_streaming_mobile/screens/news/news_listing.dart';

import '../player/mini_player.dart';

//ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  final RadioModel? radio;
  final GenreModel? genre;

  final String? extraData;

  const MainScreen({
    Key? key,
    this.radio,
    this.genre,
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

  @override
  void initState() {
    // TODO: implement initState
    // settingController.getSettings();
    menuType = MenuType.home;
    extraData = widget.extraData;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    // TODO: implement didUpdateWidget
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
      backgroundColor: getBGColor(currentItem),
      // bottomNavigationBar: bottomNavBar(),
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
  }

  Widget mainScreen(double panelMinSize, double panelMaxSize) {
    return ValueListenableBuilder<bool>(
        valueListenable: pageManager.playStateNotifier,
        builder: (_, value, __) {
          return WeSlide(
            backgroundColor: Theme.of(context).backgroundColor,
            panelMinSize: 70,
            panelMaxSize: panelMaxSize,
            body: getScreen()!,
            // footer: bottomNavBar(),
            footerHeight: 95,
            panel:
                value == true ? const FullSizePlayerController() : Container(),
            panelHeader:
                value == true ? const SmallSizePlayerController() : Container(),
          );
        });
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex, //New
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Theme.of(context).iconTheme.color),
          label: LocalizationString.home,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        //   label: LocalizationString.search,
        //   backgroundColor: Theme.of(context).backgroundColor,
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail_rounded,
              color: Theme.of(context).iconTheme.color),
          label: "Contact Us",
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.account_circle,
        //       color: Theme.of(context).iconTheme.color),
        //   label: LocalizationString.account,
        //   backgroundColor: Theme.of(context).backgroundColor,
        // ),
      ],
      onTap: _onItemTapped, //New
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        menuType = MenuType.home;
      } else if (index == 1) {
        menuType = MenuType.search;
      } else if (index == 2) {
        menuType = MenuType.favRadios;
      } else if (index == 3) {
        menuType = MenuType.account;
      }
    });
  }

  Widget loadView() {
    // if (menuType == MenuType.home) {
      return const Dashboard();
   
  }

// getAllSongsFromAlbum(AlbumModel album) {
//   getIt<PlayerManager>().addPlaylist(album.songs);
//   getIt<PlayerManager>().play();
// }
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
      selectedTileColor: Colors.grey,
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
  // }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
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
