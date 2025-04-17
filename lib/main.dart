import 'package:flutter/material.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MultiServicesApp(),
    ),
  );
}

class MultiServicesApp extends StatelessWidget {
  const MultiServicesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashView(),
    );
  }
}
