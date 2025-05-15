import 'package:flutter/material.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class BottomRelatedBooksHeader extends StatelessWidget {
  const BottomRelatedBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left:
            Provider.of<LocalizationProvider>(context).locale == Locale('en')
                ? 20
                : 0,
        right:
            Provider.of<LocalizationProvider>(context).locale == Locale('ar')
                ? 20
                : 0,
        top: 51,
      ),
      child: Row(
        children: [
          Text(
            S.of(context).YouCanAlsoLike,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
