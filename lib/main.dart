import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multiservices_app/core/theme/theme.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/core/utils/app_routes.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/splash_view.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  final lang = prefs.getString('lang') ?? 'en';
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: "https://sdgunsqqtcskclxgtydj.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkZ3Vuc3FxdGNza2NseGd0eWRqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxODgxODYsImV4cCI6MjA2MTc2NDE4Nn0.Bx37A1YlnPjEXmUy8FkGnK886kPKrKeKaQCuy7I2EaY",
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkMode),
      child: ChangeNotifierProvider(
        create: (context) => LocalizationProvider(lang),
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
      theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
      home: SplashView(),
      routes: AppRoutes.routes,
    );
  }
}
