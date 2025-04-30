import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/login/presentation/views/sign_up_view.dart';
import 'package:multiservices_app/features/auth/login/presentation/widgets/custom_button.dart';
import 'package:multiservices_app/features/auth/login/presentation/widgets/custom_passowrd_text_form_field.dart';
import 'package:multiservices_app/features/auth/login/presentation/widgets/custom_text_form_filed.dart';
import 'package:multiservices_app/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:multiservices_app/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final screenHiegt = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHiegt * 0.1),
                Center(
                  child: Text(
                    S.of(context).createyourownaccount,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),

                SizedBox(height: screenHiegt * 0.05),
                Text(
                  S.of(context).signUp,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12),
                CustomTextFormField(label: S.of(context).firstname),
                SizedBox(height: 12),
                CustomTextFormField(label: S.of(context).lastname),
                SizedBox(height: 12),
                CustomTextFormField(label: S.of(context).email),
                SizedBox(height: 12),
                CustomPasswordTextFormField(title: S.of(context).password),
                SizedBox(height: screenHiegt * 0.06),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      buttonName: S.of(context).signUp,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).ifyouhaveaccount,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).Login,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
