import 'package:flutter/material.dart';
import 'package:multiservices_app/core/app_images.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHieght = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var lang = S.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.appIcon,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: screenHieght * 0.28,
            left: screenWidth * 0.08,
            child: CustomCirclarContainer(
              title: lang.explorebooks,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Positioned(
            top: screenHieght * 0.28,
            right: screenWidth * 0.08,
            child: CustomCirclarContainer(
              title: lang.whathapend,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            bottom: screenHieght * 0.28,
            right: screenWidth * 0.08,
            child: CustomCirclarContainer(
              title: lang.chatwithfriends,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          Positioned(
            bottom: screenHieght * 0.28,
            left: screenWidth * 0.08,
            child: CustomCirclarContainer(
              title: lang.takenotes,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<LocalizationProvider>(
                    context,
                    listen: false,
                  ).toggleLanguage();
                },
                icon: Icon(Icons.language),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleTheme();
                },
                icon: Icon(Icons.light_mode),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomCirclarContainer extends StatelessWidget {
  const CustomCirclarContainer({super.key, required this.title, this.color});
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,

        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(30),
      child: SizedBox(
        height: title.length * 5.5,
        width: 62,
        child: Text(
          title,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
