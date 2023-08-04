// import 'package:flutter/material.dart';
// import 'package:music_streaming_mobile/helper/common_import.dart';
// import 'package:get/get.dart';

// class BannerAds extends StatefulWidget {
//   const BannerAds({Key? key}) : super(key: key);

//   @override
//   _BannerAdsState createState() => _BannerAdsState();
// }

// class _BannerAdsState extends State<BannerAds> {
//   final SettingController settingController = Get.find();

//   // TODO: Add _bannerAd
//   BannerAd? bannerAd;

//   String? bannerId;

//   // TODO: Add _isBannerAdReady

//   @override
//   void initState() {
//     super.initState();
//     prepare();
//   }

//   prepare() async {
//     bool isPro = await SharedPrefs().isProMode();

//     if (Platform.isAndroid) {
//       if (settingController.settings.androidAdmobBannerId != null) {
//         bannerId = settingController.settings.androidAdmobBannerId!;
//       }
//     } else if (Platform.isIOS) {
//       if (settingController.settings.iOSAdmobBannerId != null) {
//         bannerId = settingController.settings.iOSAdmobBannerId!;
//       }
//     }

//     if (isPro == false && bannerId != null) {
//       loadAds();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: bannerAd == null ? 0 : bannerAd!.size.height.toDouble(),
//         child:  bannerAd == null ? Container() : AdWidget(ad: bannerAd!),
//       ),
//     );
//   }

//   void loadAds() {
//     // TODO: Initialize _bannerAd
//     bannerAd = BannerAd(
//       adUnitId: bannerId!,
//       request: const AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (_) {
//           setState(() {});
//         },
//         onAdFailedToLoad: (ad, err) {
//           //ad.dispose();
//         },
//       ),
//     );
//     bannerAd!.load();
//   }
// }

// //ignore: must_be_immutable
// class InterstitialAds extends StatelessWidget {
//   InterstitialAds({Key? key}) : super(key: key);

//   // TODO: Add _interstitialAd
//   InterstitialAd? _interstitialAd;

//   // TODO: Add _isInterstitialAdReady
//   bool isInterstitialAdReady = false;

//   String? interstitialId;

//   final SettingController settingController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   void loadInterstitialAd() async {
//     bool isPro = await SharedPrefs().isProMode();

//     if (Platform.isAndroid) {
//       if (settingController.settings.androidAdmobInterstitailId != null) {
//         interstitialId = settingController.settings.androidAdmobInterstitailId!;
//       }
//     } else if (Platform.isIOS) {
//       if (settingController.settings.iOSAdmobInterstitailId != null) {
//         interstitialId = settingController.settings.iOSAdmobInterstitailId!;
//       }
//     }

//     if (isPro == true || interstitialId == null) {
//       return;
//     }

//     InterstitialAd.load(
//       adUnitId: interstitialId!,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           _interstitialAd = ad;
//           _interstitialAd?.show();

//           ad.fullScreenContentCallback = FullScreenContentCallback(
//             onAdDismissedFullScreenContent: (ad) {},
//           );

//           isInterstitialAdReady = true;
//         },
//         onAdFailedToLoad: (err) {
//           isInterstitialAdReady = false;
//         },
//       ),
//     );
//   }
// }
