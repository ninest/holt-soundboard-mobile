import 'package:url_launcher/url_launcher.dart';

class Url {
  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}