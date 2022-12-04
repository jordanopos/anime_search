import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppContants {
  static Color mainColor = Color(0xff175cff);

  static Color bgColor = Color(0xff031b4e);

 static void launchUrl(String url) {
    launch(url);
  }
}
