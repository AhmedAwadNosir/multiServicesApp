import 'package:flutter/cupertino.dart';

class PageInitialinfo extends StatelessWidget {
  const PageInitialinfo({
    super.key,
    required this.pagegole,
    required this.pagegoledefination,
    this.pagegoleStyle,
    this.textAlign,
    this.spacebetween,
    this.sutptitleStyle,
  });
  final String pagegole;
  final String pagegoledefination;
  final TextStyle? pagegoleStyle;
  final TextAlign? textAlign;
  final double? spacebetween;
  final TextStyle? sutptitleStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          pagegole,
          textAlign: textAlign ?? TextAlign.start,
          style:
              pagegoleStyle ??
              TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.4),
        ),
        SizedBox(height: spacebetween ?? 8),
        Text(
          pagegoledefination,
          textAlign: textAlign ?? TextAlign.start,
          style: sutptitleStyle ?? TextStyle(fontSize: 16, height: 1.3),
        ),
      ],
    );
  }
}
