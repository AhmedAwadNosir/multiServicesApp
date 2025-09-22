import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/presentation/widgets/about_us_view_body.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static const id = "aboutUs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).AboutUs), elevation: 4),
      body: AboutUsViewBody(),
    );
  }
}
