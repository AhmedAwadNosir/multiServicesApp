import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/widgets/contact_item.dart';
import 'package:multiservices_app/core/utils/widgets/my_social_accounts.dart';
import 'package:multiservices_app/features/home/presentation/widgets/send_feedback_message_container.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({
    super.key,
    @required this.nametextEditingControler,
    @required this.emailtextEditingControler,
    @required this.messagetextEditingControler,
  });
  final TextEditingController? nametextEditingControler;
  final TextEditingController? emailtextEditingControler;
  final TextEditingController? messagetextEditingControler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              S.of(context).GetInTouch,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SendFeedBackMessageContainer(
              nametextEditingControler: nametextEditingControler,
              emailtextEditingControler: emailtextEditingControler,
              messagetextEditingControler: messagetextEditingControler,
            ),
            SizedBox(height: 12),
            Text(
              S.of(context).ContactInformation,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            ContactItem(
              icon: Icons.call,
              contactName: S.of(context).Phone,
              contact: S.of(context).myPhoneNumber,
              onTap: () async {
                await launchUrl(Uri.parse('tel://01273856912'));
              },
            ),
            SizedBox(height: 8),
            ContactItem(
              icon: Icons.email,
              contactName: S.of(context).email,
              contact: S.of(context).myEmail,
              onTap: () async {
                await launchUrl(Uri.parse('mailto:ahmedawadnosier@gmail.com'));
              },
            ),
            SizedBox(height: 14),
            Center(child: Text(S.of(context).FollowUs)),
            SizedBox(height: 8),
            MySocialAccounts(),
          ],
        ),
      ),
    );
  }
}
