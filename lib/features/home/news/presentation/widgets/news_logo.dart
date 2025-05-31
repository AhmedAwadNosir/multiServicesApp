import 'package:flutter/material.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class NewsLogo extends StatelessWidget {
  const NewsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      Provider.of<LocalizationProvider>(context).locale == Locale("en")
          ? TextSpan(
            children: [
              TextSpan(text: S.of(context).News),
              TextSpan(
                text: S.of(context).Cloud,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          )
          : TextSpan(
            children: [
              TextSpan(
                text: S.of(context).Cloud,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(text: S.of(context).News),
            ],
          ),
    );
  }
}
