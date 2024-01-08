// import 'package:flutter/material.dart';
// import 'package:music_streaming_mobile/helper/common_import.dart';
// import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

const adUnitId = "ca-app-pub-3940256099942544/6300978111";
const adUnitIdIOS = "";

const adUnitIdFull = "ca-app-pub-3940256099942544/5354046379";
const adUnitIdFullIOS = "";

class AdsHelper {
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  //  String testDevice = 'YOUR_DEVICE_ID';
  int maxFailedLoadAttempts = 3;
  // InterstitialAd? _interstitialAd;
  // int _numInterstitialLoadAttempts = 0;

  static RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? adUnitIdFull
            : 'ca-app-pub-3940256099942544/1712485313',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print(
                '$ad loaded.....................................................');
            _rewardedAd = ad;
            print("ASSIGNING SUCCESS $_rewardedAd");

            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
    log("Create Reward...............................");
  }

  void showRewardedAd() {
    print("showRewardedAd $_rewardedAd");
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }
}

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
