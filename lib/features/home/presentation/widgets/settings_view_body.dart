import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/edit_note_custom_text_form_field.dart';
import 'package:multiservices_app/features/home/presentation/views/about_us_view.dart';
import 'package:multiservices_app/features/home/presentation/views/contact_us.dart';
import 'package:multiservices_app/features/home/presentation/widgets/dark_mode_setting_item.dart';
import 'package:multiservices_app/features/home/presentation/widgets/dellet_account_button.dart';
import 'package:multiservices_app/features/home/presentation/widgets/edit_profile_image.dart';
import 'package:multiservices_app/features/home/presentation/widgets/language_setting_item.dart';
import 'package:multiservices_app/features/home/presentation/widgets/setting_item.dart';
import 'package:multiservices_app/features/home/presentation/widgets/sign_out_button.dart';
import 'package:multiservices_app/generated/l10n.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({
    super.key,
    required this.intialUserName,
    @required this.userNameOnChanged,
    @required this.imageOnPressed,
    required this.userData,
    @required this.pickedImage,
    @required this.pickedImageUrl,
  });
  final String intialUserName;
  final void Function(String?)? userNameOnChanged;
  final void Function()? imageOnPressed;
  final UserModal userData;
  final File? pickedImage;
  final String? pickedImageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              S.of(context).Account,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Center(
              child: EditProfileImageWidget(
                onPressed: imageOnPressed,
                pickedImage: pickedImage,
                userData: userData,
                pickedImageUrl: pickedImageUrl,
              ),
            ),
            SizedBox(height: 6),
            EditNoteCustomTextFormFilled(
              maxLength: 18,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              foucsedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              onChanged: userNameOnChanged,
              hint: S.of(context).Name,
              intialValue: intialUserName,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              textColor: Theme.of(context).colorScheme.secondary,
              suffixIcon: Icon(
                Icons.edit_document,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              S.of(context).Settings,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            DarkModeSettingItem(),
            SizedBox(height: 16),
            LanguageSettingItem(),
            SizedBox(height: 16),
            SettingItem(
              icon: Icons.contact_mail_rounded,
              settingName: S.of(context).ContactUs,
              navigatOnTap: () {
                Navigator.pushNamed(context, ContactUsView.id);
              },
            ),
            SizedBox(height: 16),
            SettingItem(
              icon: Icons.group_rounded,
              settingName: S.of(context).AboutUs,
              navigatOnTap: () {
                Navigator.pushNamed(context, AboutUsView.id);
              },
            ),
            Divider(thickness: 2),
            SizedBox(height: 16),
            Row(children: [SignOutButton(), Spacer(), DelletAccountButton()]),
          ],
        ),
      ),
    );
  }
}
