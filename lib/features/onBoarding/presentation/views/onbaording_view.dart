import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:multiservices_app/features/onBoarding/presentation/widgets/onbaording_view_body.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbaordingView extends StatefulWidget {
  const OnbaordingView({super.key});
  static const id = 'OnbaordingView';

  @override
  State<OnbaordingView> createState() => _OnbaordingViewState();
}

class _OnbaordingViewState extends State<OnbaordingView> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppImages.appIcon,
          height: 10,
          width: 10,
          fit: BoxFit.cover,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool(AppConstants.onbaordingIsViewd, true);
              Navigator.pushReplacementNamed(context, LoginView.id);
            },
            child: Text(
              S.of(context).skip,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: OnbaordingViewBody(pageController: _pageController),
    );
  }
}
