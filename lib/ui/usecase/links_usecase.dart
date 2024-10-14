import 'package:flutter/widgets.dart';
import 'package:regardless_site/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app.locator.dart';

class LinksUseCase {
  final ScrollController? scrollController;
  final _navigationService = locator<RouterService>();

  LinksUseCase({this.scrollController});

  void scrollToPage(String page) {
    switch (page) {
      case "Home":
        scrollController?.animateTo(0.0,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
        break;
      case "About":
        scrollController?.animateTo(0.0,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
        break;
      case "Shop":
        scrollController?.animateTo(0.0,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
        break;
      case "Contact":
        scrollController?.animateTo(0.0,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
        break;
    }
  }

  void goToPage(String page) {
    switch (page.toLowerCase()) {
      case "home":
        _navigationService.navigateToHomeView();
        break;
      case "terms":
        _navigationService.navigateToTerms();
        break;
      case "policy":
        _navigationService.navigateToPolicy();
        break;
      case "facebook":
        launchUrl(
            Uri.parse("https://web.facebook.com/regardlessmode?_rdc=1&_rdr"));
        break;
      case "instagram":
        launchUrl(Uri.parse("https://www.instagram.com/regardlessmode/"));
        break;
      case "twitter":
        launchUrl(Uri.parse("https://twitter.com/regardlessmode"));
        break;
      case "youtube":
        launchUrl(Uri.parse("https://www.youtube.com/@regardlessmode1698"));
        break;
      case "whatsapp":
        launchUrl(Uri.parse("https://wa.me/+233550188881"));
        break;
      case "faq":
        _navigationService.navigateToFaqView();
        break;
    }
  }
}
