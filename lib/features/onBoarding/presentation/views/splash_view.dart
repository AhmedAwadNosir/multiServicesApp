import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/core/theme/theme_provider.dart';
import 'package:multiservices_app/features/onBoarding/functions/splash_navigation_controler.dart';
import 'package:multiservices_app/features/onBoarding/presentation/widgets/custom_circle_container.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      spashNavigationControler(context);
    });
  }

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
              color: Theme.of(context).colorScheme.onTertiary,
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
        ],
      ),
    );
  }
}
