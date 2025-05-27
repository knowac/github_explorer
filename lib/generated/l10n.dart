// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Github Explorer`
  String get appTitle {
    return Intl.message(
      'Github Explorer',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Github does not allow more requests. Please try again later.`
  String get rateLimitError {
    return Intl.message(
      'Github does not allow more requests. Please try again later.',
      name: 'rateLimitError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch repositories`
  String get generalError {
    return Intl.message(
      'Failed to fetch repositories',
      name: 'generalError',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Search repositories`
  String get enterKeyword {
    return Intl.message(
      'Search repositories',
      name: 'enterKeyword',
      desc: '',
      args: [],
    );
  }

  /// `Start typing`
  String get enterKeywordHint {
    return Intl.message(
      'Start typing',
      name: 'enterKeywordHint',
      desc: '',
      args: [],
    );
  }

  /// `Search repositories`
  String get searchButtonAccessibility {
    return Intl.message(
      'Search repositories',
      name: 'searchButtonAccessibility',
      desc: '',
      args: [],
    );
  }

  /// `Clear query`
  String get clearQueryButtonAccessibility {
    return Intl.message(
      'Clear query',
      name: 'clearQueryButtonAccessibility',
      desc: '',
      args: [],
    );
  }

  /// `No pull requests`
  String get noPullRequests {
    return Intl.message(
      'No pull requests',
      name: 'noPullRequests',
      desc: '',
      args: [],
    );
  }

  /// `No issues`
  String get noIssues {
    return Intl.message('No issues', name: 'noIssues', desc: '', args: []);
  }

  /// `Cannot open link`
  String get cannotOpenLink {
    return Intl.message(
      'Cannot open link',
      name: 'cannotOpenLink',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message('No data', name: 'noData', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Stars`
  String get stars {
    return Intl.message('Stars', name: 'stars', desc: '', args: []);
  }

  /// `Issues`
  String get issues {
    return Intl.message('Issues', name: 'issues', desc: '', args: []);
  }

  /// `Pull requests`
  String get pullRequests {
    return Intl.message(
      'Pull requests',
      name: 'pullRequests',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Given page does not exist`
  String get pageNotExist {
    return Intl.message(
      'Given page does not exist',
      name: 'pageNotExist',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
