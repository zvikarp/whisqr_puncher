import 'dart:async';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:whisqr_puncher/consts/general.dart';

class L18nUtil {
  Locale _locale;
  Map<String, dynamic> _localizedStrings;
  VoidCallback _onLocaleChangedCallback;

  Future<void> init() async {
    await setPreferredLanguage();
  }

  dynamic _dotNotationParser(String key) =>
      (key.split(".")).fold(_localizedStrings, (curr, next) => curr[next]);

  dynamic _stringInject(dynamic translation, Map<String, dynamic> inject) {
    RegExp injectRegex = RegExp(r"\{{(.+?)\}}");
    List<RegExpMatch> injectMatches =
        injectRegex.allMatches(translation).toList();
    injectMatches.forEach(
      (RegExpMatch injectMatch) {
        String regexString = injectMatches.first.group(0);
        translation = translation.replaceAll(regexString,
            inject[regexString.substring(2, regexString.length - 2)]);
      },
    );
    return translation;
  }

  dynamic t(String key, [Map<String, dynamic> inject = const {}]) {
    String notFoundMsg = '** $key not found';
    try {
      dynamic translation = _dotNotationParser(key);
      if (inject.isNotEmpty) {
        translation = _stringInject(translation, inject);
      }
      return translation ?? notFoundMsg;
    } catch (e) {
      print(e);
      return notFoundMsg;
    }
  }

  Locale _languageToLocale(String language) {
    if (language == null) return GeneralConsts.DEFAULT_LOCALE;
    Locale locale = GeneralConsts.LOCALES
        .firstWhere((Locale locale) => locale.languageCode == language);
    if (locale == null) return GeneralConsts.DEFAULT_LOCALE;
    return locale;
  }

  Future<void> _loadTranslations() async {
    String jsonString = await rootBundle
        .loadString('${GeneralConsts.LANG_DIR}${_locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });
  }

  Future<void> setPreferredLanguage([String language]) async {
    _locale = _languageToLocale(language);
    await _loadTranslations();
    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback();
    }
  }

  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  get locale => _locale;

  get isRtl => _locale.languageCode == "he";

  static final L18nUtil _translations = L18nUtil._internal();
  factory L18nUtil() {
    return _translations;
  }
  L18nUtil._internal();
}

L18nUtil l18nUtil = L18nUtil();
