import 'package:flutter/material.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class LanguageSettingItem extends StatefulWidget {
  const LanguageSettingItem({super.key});

  @override
  State<LanguageSettingItem> createState() => _LanguageSettingItemState();
}

class _LanguageSettingItemState extends State<LanguageSettingItem> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [S.of(context).English, S.of(context).Arabic];

    String? slectedItem =
        Provider.of<LocalizationProvider>(context, listen: false).locale ==
                Locale("en")
            ? S.of(context).English
            : S.of(context).Arabic;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.all(12),

          child: Icon(
            Icons.language,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: 14),
        Text(
          S.of(context).Language,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        DropdownButton(
          value: slectedItem,
          underline: SizedBox(),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 20)),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            slectedItem = value;
            Provider.of<LocalizationProvider>(
              context,
              listen: false,
            ).toggleLanguage();
            setState(() {});
          },
        ),
      ],
    );
  }
}
