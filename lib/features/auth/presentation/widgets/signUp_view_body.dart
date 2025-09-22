import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:multiservices_app/core/functions/show_awesome_dialog.dart';
import 'package:multiservices_app/core/functions/tregir_cubit_check_connectavity.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/pick_image.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/upload_image_geturl.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_image_picker_container.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_passowrd_text_form_field.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_up/signup_cubit.dart';
import 'package:multiservices_app/features/home/chat/functions/compress_image.dart';
import 'package:multiservices_app/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? profileImage;
  @override
  Widget build(BuildContext context) {
    final screenHiegt = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String userName = "";
    String email = "";
    String Password = "";
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
                Center(
                  child: CustomIMagePickerContainer(
                    onTap: () async {
                      profileImage = await pickGallaryImage();
                      setState(() {});
                    },
                    image: profileImage,
                  ),
                ),
                SizedBox(height: screenHiegt * 0.05),
                Center(
                  child: Text(
                    S.of(context).createyourownaccount,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),

                SizedBox(height: screenHiegt * 0.02),
                Text(
                  S.of(context).signUp,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  label: S.of(context).userName,
                  onSaved: (value) {
                    userName = value!;
                  },
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
                    Password = value!;
                  },
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
                          if (profileImage != null) {
                            var hasInternetAcess =
                                await InternetConnection().hasInternetAccess;
                            if (!hasInternetAcess) {
                              showErrorConectionDialog(context: context);
                            } else {
                              String? imgdonloadUrl;
                              try {
                                File? compresedImage =
                                    await compressImageAsFile(profileImage!);
                                imgdonloadUrl = await uploadfileGetUrl(
                                  file: compresedImage!,
                                );
                              } catch (e) {
                                showErrorDialog(
                                  context: context,
                                  errorMessage: e.toString(),
                                );
                              }
                              if (imgdonloadUrl != null) {
                                BlocProvider.of<SignupCubit>(context).signUp(
                                  emailAddress: email,
                                  password: Password,
                                  userModal: UserModal(
                                    userName: userName,
                                    profilImageLink: imgdonloadUrl,
                                  ),
                                );
                              }
                            }
                          } else {
                            showAwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              dialogTitle: "About",
                              dialogDesc: "Profile Photo is required",
                            );
                          }
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
