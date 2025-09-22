import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.settingName,
    @required this.navigatOnTap,
  });
  final IconData icon;
  final String settingName;
  final void Function()? navigatOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.all(12),

          child: Icon(
            icon,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: 14),
        Text(
          settingName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        navigatOnTap != null
            ? GestureDetector(
              onTap: navigatOnTap,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blueGrey.withValues(alpha: 0.3),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}
