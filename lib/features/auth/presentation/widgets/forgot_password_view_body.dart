import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/page_initail_info.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/user_instractions.dart';
import 'package:multiservices_app/features/auth/states_manager/sende_resset_password_requst/sendressetpasswordemail_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  late String email;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 44),
            PageInitialinfo(
              spacebetween: 8,
              pagegole: S.of(context).resetPassword,
              pagegoledefination: S.of(context).entertheemailaddressyouused,
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              label: S.of(context).enteryouremail,
              prefixIcon: const Icon(Icons.sms),
              onSaved: (value) {
                setState(() {
                  email = value!;
                });
              },
            ),
            const Spacer(),
            UserInstractions(
              userDestenation: S.of(context).Login,
              onTap: () {
                Navigator.pop(context);
              },
              userQution: S.of(context).yourememberyourpassword,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: CustomButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    BlocProvider.of<SendressetpasswordemailCubit>(
                      context,
                    ).sendRessetPasswordRequst(emailAddress: email);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                buttonName: S.of(context).requestpasswordresset,
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
