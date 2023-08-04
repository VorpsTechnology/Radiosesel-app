import 'package:url_launcher/url_launcher.dart';

class HelperServices {
 static Future<void> launchLink(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }
}