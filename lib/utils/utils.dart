import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/services/services.dart';
import 'package:folio/widget/footer.dart';
import 'package:url_launcher/url_launcher.dart';

mixin Utils {
  // URL Launcher
  void openURL(String url) => launchUrl(Uri.parse(url));
}

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String avatar1 = 'assets/photos/avatar1.jpeg';
  static const String avatar = 'assets/photos/avatar.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String fullterIsb = 'assets/work/flutterIsl.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Stack_Overflow-512.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/android/480/ffffff/twitter.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
  ];

  static const List<String> socialLinks = [
    "https://linkedin.com/in/quyen-anh-nguyen",
    "https://stackoverflow.com/users/4399085/quyen-anh-nguyen",
    "https://github.com/boxingnguyen",
    "https://facebook.com/QuyenAnh175",
    "https://twitter.com/boxingnguyen",
    "https://instagram.com/brian.nguyen13579",
  ];

  static const String resume =
      'https://drive.google.com/file/d/1bDNNrkQtNVJbXcdwMSx0crQQvAF_nMwV/view?usp=sharing';

  static const String gitHub = 'https://github.com/mhmzdev';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
