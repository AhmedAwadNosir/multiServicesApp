import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:multiservices_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_passowrd_text_form_field.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_social_auth_button.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in/signin_cubit.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in_google/signingoogle_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final screenHiegt = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        right: 12,
        left: 12,
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHiegt * 0.15),
              Center(
                child: Text(
                  S.of(context).Welcometoourapp,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: screenHiegt * 0.05),
              Text(
                S.of(context).Login,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                label: S.of(context).email,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 12),
              CustomPasswordTextFormField(
                title: S.of(context).password,
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPasswordView.id);
                    },
                    child: Text(
                      S.of(context).ForgotPassword,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHiegt * 0.06),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await FirebaseAuth.instance.signOut();
                        BlocProvider.of<SigninCubit>(
                          context,
                        ).signIn(emailAddress: email, password: password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    buttonName: S.of(context).Login,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.55,
                  height: 50,
                  child: CustomSocialAuthButton(
                    onPressed: () async {
                      BlocProvider.of<SigningoogleCubit>(
                        context,
                      ).signInGoogle();
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    buttonName: S.of(context).Loginwithgoogle,
                    buttonNameColor: Theme.of(context).colorScheme.secondary,
                    socialAuthIcon: AppImages.googleIcone,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).ifyoudonothaveaccount,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    child: Text(
                      S.of(context).signUp,
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
    );
  }
}
