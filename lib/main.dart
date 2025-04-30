import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multiservices_app/core/theme/theme.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/app_routes.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/splash_view.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool(AppConstants.isDarkMode) ?? false;
  final lang = prefs.getString(AppConstants.lang);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkMode),
      child: ChangeNotifierProvider(
        create: (context) => LocalizationProvider(lang ?? 'en'),
        child: const MultiServicesApp(),
      ),
    ),
  );
}

class MultiServicesApp extends StatelessWidget {
  const MultiServicesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashView(),
      routes: AppRoutes.routes,
    );
  }
}
