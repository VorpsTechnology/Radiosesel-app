import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/dashboard/dashboard_controller.dart';
import 'package:music_streaming_mobile/screens/contact_us/contactus_controller.dart';
import 'package:music_streaming_mobile/screens/misc/base_controller.dart';
import 'package:music_streaming_mobile/screens/misc/sleep_timer_controller.dart';
import 'package:music_streaming_mobile/screens/news/news_controller.dart';
import 'package:music_streaming_mobile/screens/radio/radio_detail_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var devices = [
    "E4823FBAE26FF01B49728AAAD3D6D40A",
    "D1868151FB6A810A8BCDB11D2F23CA68"
  ];
  await setupServiceLocator();
  // const firebaseConfig = FirebaseOptions(
  //     apiKey: "AIzaSyCZBAH7uczL4Y50_8v2HnCKwu-bdNKQZJI",
  //     authDomain: "radiosesel-c4617.firebaseapp.com",
  //     projectId: "radiosesel-c4617",
  //     storageBucket: "radiosesel-c4617.appspot.com",
  //     messagingSenderId: "175051300068",
  //     appId: "1:175051300068:web:135d19173141cdbbad60f1",
  //     measurementId: "G-4L4J2K9BML");
  // if (Firebase.apps.isEmpty) {
  //   await Firebase.initializeApp(name: 'Radiosesel', options: firebaseConfig);
  // }

  await Firebase.initializeApp(
    name: "Radiosesel",
    options: const FirebaseOptions(
        apiKey: "AIzaSyCflv0PsP2sxDKyFtNZb0KCfLga9lOmGgU",
        authDomain: "radiosesel-7d945.firebaseapp.com",
        projectId: "radiosesel-7d945",
        storageBucket: "radiosesel-7d945.appspot.com",
        messagingSenderId: "1072836679751",
        appId: "1:1072836679751:android:25318a04cf3c7ea0d1b962",
        measurementId: "G-7G7PHVPZ0M"),
  );
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  await getIt<UserProfileManager>().refreshProfile();

  bool isDarkTheme = await SharedPrefs().isDarkMode();

  Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);

  // Get.put(SettingController());
  Get.put(DashboardController());
  Get.put(ContactUsController());
  Get.put(LanguageController());
  Get.put(RadioDetailController());
  Get.put(NewsController());
  Get.put(BaseController());
  Get.put(SleepTimerController());

  runApp(
    EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'AE'),
          Locale('ar', 'SA'),
          Locale('ar', 'DZ'),
          Locale('de', 'DE'),
          Locale('fr', 'FR'),
          Locale('ru', 'RU')
        ],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    getIt<PlayerManager>().init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: EasyLoading.init(),
      home: const MainScreen(),
    );
  }
}
