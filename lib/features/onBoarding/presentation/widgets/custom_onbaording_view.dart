import 'package:flutter/material.dart';
import 'package:multiservices_app/features/onBoarding/data/onboard_view_modal.dart';

class CustomOnboardingView extends StatelessWidget {
  const CustomOnboardingView({super.key, required this.onboardViewModal});

  final OnboardViewModal onboardViewModal;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        Center(
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),

              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(onboardViewModal.image),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          onboardViewModal.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            onboardViewModal.subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
