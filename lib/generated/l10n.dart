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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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

  /// `what hapned`
  String get whathapend {
    return Intl.message('what hapned', name: 'whathapend', desc: '', args: []);
  }

  /// `explore books`
  String get explorebooks {
    return Intl.message(
      'explore books',
      name: 'explorebooks',
      desc: '',
      args: [],
    );
  }

  /// `take notes`
  String get takenotes {
    return Intl.message('take notes', name: 'takenotes', desc: '', args: []);
  }

  /// `chat with friends`
  String get chatwithfriends {
    return Intl.message(
      'chat with friends',
      name: 'chatwithfriends',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Read, Discover, Escape`
  String get onbaordingbookstitle {
    return Intl.message(
      'Read, Discover, Escape',
      name: 'onbaordingbookstitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore a world of stories, knowledge, and inspiration with thousands of eBooks and audiobooks in one easy-to-use app`
  String get onbaordingbookssubtitle {
    return Intl.message(
      'Explore a world of stories, knowledge, and inspiration with thousands of eBooks and audiobooks in one easy-to-use app',
      name: 'onbaordingbookssubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Stay Informed, Stay Ahead`
  String get onbaordingNewstitle {
    return Intl.message(
      'Stay Informed, Stay Ahead',
      name: 'onbaordingNewstitle',
      desc: '',
      args: [],
    );
  }

  /// `Get the latest headlines, breaking news, and personalized stories from around the world — right at your fingertips`
  String get onbaordingNewssubtitle {
    return Intl.message(
      'Get the latest headlines, breaking news, and personalized stories from around the world — right at your fingertips',
      name: 'onbaordingNewssubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Connect, Share, Communicate`
  String get onbaordingchattitle {
    return Intl.message(
      'Connect, Share, Communicate',
      name: 'onbaordingchattitle',
      desc: '',
      args: [],
    );
  }

  /// `Instantly message friends, family, or teams with text, images, and voice — anytime, anywhere`
  String get onbaordingchatsubtitle {
    return Intl.message(
      'Instantly message friends, family, or teams with text, images, and voice — anytime, anywhere',
      name: 'onbaordingchatsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Capture, Organize, Remember`
  String get onbaordingnotestitle {
    return Intl.message(
      'Capture, Organize, Remember',
      name: 'onbaordingnotestitle',
      desc: '',
      args: [],
    );
  }

  /// `Quickly jot down ideas, reminders, and to-do lists to keep your life organized and your thoughts in one place`
  String get onbaordingnotessubtitle {
    return Intl.message(
      'Quickly jot down ideas, reminders, and to-do lists to keep your life organized and your thoughts in one place',
      name: 'onbaordingnotessubtitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
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
