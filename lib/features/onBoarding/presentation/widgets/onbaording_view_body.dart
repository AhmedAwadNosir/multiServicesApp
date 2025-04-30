import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/onBoarding/data/onboard_view_modal.dart';
import 'package:multiservices_app/features/onBoarding/functions/go_to_next_page.dart';
import 'package:multiservices_app/features/onBoarding/presentation/widgets/custom_onbaording_view.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbaordingViewBody extends StatelessWidget {
  const OnbaordingViewBody({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    List<OnboardViewModal> onboardingModal = [
      OnboardViewModal(
        image: AppImages.booksLogo,
        title: lang.onbaordingbookstitle,
        subTitle: lang.onbaordingbookssubtitle,
      ),
      OnboardViewModal(
        image: AppImages.newsLogo,
        title: lang.onbaordingNewstitle,
        subTitle: lang.onbaordingNewssubtitle,
      ),
      OnboardViewModal(
        image: AppImages.chatLogo,
        title: lang.onbaordingchattitle,
        subTitle: lang.onbaordingchatsubtitle,
      ),
      OnboardViewModal(
        image: AppImages.notesLogo,
        title: lang.onbaordingnotestitle,
        subTitle: lang.onbaordingnotessubtitle,
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: PageView.builder(
            controller: pageController,
            itemCount: onboardingModal.length,
            itemBuilder: (context, index) {
              return CustomOnboardingView(
                onboardViewModal: onboardingModal[index],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: onboardingModal.length,
          effect: WormEffect(
            dotColor: Theme.of(context).colorScheme.shadow,
            activeDotColor: Theme.of(context).primaryColor,
            dotHeight: 10,
            dotWidth: 10,
          ),
          onDotClicked: (index) {
            pageController.jumpToPage(index);
          },
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            goToNextPage(
              pageControler: pageController,
              context: context,
              onboardingLength: onboardingModal.length - 1,
            );
          },

          child: Icon(Icons.arrow_forward, size: 30),
        ),
        Spacer(),
      ],
    );
  }
}
