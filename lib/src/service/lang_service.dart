import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class LangService with ChangeNotifier {
  LangService({
    Locale? locale,
  }) : locale = locale ?? IntlHelper.en;
  //현재 언어
  Locale locale;

  void toggleLang() {
    locale = IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko;
    notifyListeners();
  }
}
