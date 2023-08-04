// import 'package:flutter/material.dart';
// import 'package:music_streaming_admin_panel/helper/navigator_key.dart';
//
// GlobalKey<NavigatorState> navigationKey = NoomiKeys.navKey;
//
// class NavigationService {
//   static NavigationService instance = NavigationService();
//
//   Future<dynamic> navigateToReplacement(MaterialPageRoute _rn) {
//     return navigationKey.currentState!.pushReplacement(_rn);
//   }
//
//   Future<dynamic> navigateTo(String _rn) {
//     return navigationKey.currentState!.pushNamed(_rn);
//   }
//
//   Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
//     return navigationKey.currentState!.push(_rn);
//   }
//
//   BuildContext getCurrentStateContext() {
//     return navigationKey.currentState!.context;
//   }
//
//   Future<dynamic> navigateToRouteWithScale(MaterialPageRoute _rn) {
//     return navigationKey.currentState!.push(_rn);
//   }
//
//   goBack() {
//     return navigationKey.currentState!.pop();
//   }
//
//   // goTo(Widget page) {
//   //   navigationKey.currentState!
//   //       .push(MaterialPageRoute(builder: (context) => page));
//   // }
//
// }
