import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/core/utils/widgets/custom_profile_stack.dart';
import 'package:multiservices_app/core/utils/widgets/my_social_accounts.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.29,
            child: CustomProfileStack(
              coverImage: AppImages.appDevelopmentcover,
              profileImage: AppImages.myImage,
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                S.of(context).AhmedAwadNosier,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 8),
          MySocialAccounts(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.of(context).WhoIm,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S
                  .of(context)
                  .IamaSoftwareEngineerspecializedinmobiledevelopmentwithFlutter,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S
                  .of(context)
                  .Ihavestrongfoundationsinsoftwareengineeringprinciples,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S
                  .of(context)
                  .BeyondjustFlutterIunderstandhowtointegratebackendservices,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S.of(context).Asaprofessionaldeveloper,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.of(context).Values,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S.of(context).Customersatisfactionismytoppriority,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S.of(context).Istriveforcontinousimprovment,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S.of(context).Ivaluehonestyandintegrityinallmyactions,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
