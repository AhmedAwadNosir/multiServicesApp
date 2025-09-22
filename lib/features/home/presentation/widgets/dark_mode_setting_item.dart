import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/functions/is_dark_mode.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class DarkModeSettingItem extends StatefulWidget {
  const DarkModeSettingItem({super.key});

  @override
  State<DarkModeSettingItem> createState() => _DarkModeSettingItemState();
}

class _DarkModeSettingItemState extends State<DarkModeSettingItem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isDarkMode(),
      builder: (context, isDarkMode) {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.all(12),

              child: Icon(
                Icons.brightness_4_outlined,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 14),
            Text(
              S.of(context).DarkMode,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              isDarkMode.data! ? S.of(context).On : S.of(context).Off,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.5),
              ),
            ),
            CupertinoSwitch(
              value: isDarkMode.data!,
              onChanged: (value) {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
            ),
          ],
        );
      },
    );
  }
}
