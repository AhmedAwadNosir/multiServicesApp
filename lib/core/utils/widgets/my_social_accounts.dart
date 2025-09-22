import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multiservices_app/features/home/news/functions/url_luncher.dart';

class MySocialAccounts extends StatelessWidget {
  const MySocialAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await urlLuncher("https://www.facebook.com/AhmedAwadNosir/");
          },
          icon: Icon(FontAwesomeIcons.facebook, size: 30),
        ),
        IconButton(
          onPressed: () async {
            await urlLuncher("https://www.facebook.com/AhmedAwadNosir/");
          },
          icon: Icon(FontAwesomeIcons.linkedin, size: 30),
        ),
        IconButton(
          onPressed: () async {
            await urlLuncher("https://github.com/AhmedAwadNosir");
          },
          icon: Icon(FontAwesomeIcons.github, size: 30),
        ),
        IconButton(
          onPressed: () async {
            await urlLuncher("https://www.instagram.com/nosir7385/");
          },
          icon: Icon(FontAwesomeIcons.instagram, size: 30),
        ),
      ],
    );
  }
}
