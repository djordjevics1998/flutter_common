import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_sr.dart' deferred as app_localizations_sr;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of FlutterCommonLocalizations
/// returned by `FlutterCommonLocalizations.of(context)`.
///
/// Applications need to include `FlutterCommonLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FlutterCommonLocalizations.localizationsDelegates,
///   supportedLocales: FlutterCommonLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FlutterCommonLocalizations.supportedLocales
/// property.
abstract class FlutterCommonLocalizations {
  FlutterCommonLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FlutterCommonLocalizations? of(BuildContext context) {
    return Localizations.of<FlutterCommonLocalizations>(context, FlutterCommonLocalizations);
  }

  static const LocalizationsDelegate<FlutterCommonLocalizations> delegate = _FlutterCommonLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sr')
  ];

  /// No description provided for @error_title.
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get error_title;

  /// No description provided for @success_title.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get success_title;

  /// No description provided for @confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get confirm_title;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
}

class _FlutterCommonLocalizationsDelegate extends LocalizationsDelegate<FlutterCommonLocalizations> {
  const _FlutterCommonLocalizationsDelegate();

  @override
  Future<FlutterCommonLocalizations> load(Locale locale) {
    return lookupFlutterCommonLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_FlutterCommonLocalizationsDelegate old) => false;
}

Future<FlutterCommonLocalizations> lookupFlutterCommonLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return app_localizations_en.loadLibrary().then((dynamic _) => app_localizations_en.FlutterCommonLocalizationsEn());
    case 'sr': return app_localizations_sr.loadLibrary().then((dynamic _) => app_localizations_sr.FlutterCommonLocalizationsSr());
  }

  throw FlutterError(
    'FlutterCommonLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
