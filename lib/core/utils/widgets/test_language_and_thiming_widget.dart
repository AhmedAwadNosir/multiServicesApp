import 'package:flutter/material.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class TestLnaguageAndThimingWidget extends StatelessWidget {
  const TestLnaguageAndThimingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: Icon(Icons.light_mode),
        ),
        IconButton(
          onPressed: () {
            Provider.of<LocalizationProvider>(
              context,
              listen: false,
            ).toggleLanguage();
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}
