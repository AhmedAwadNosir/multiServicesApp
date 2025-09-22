import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/core/functions/tregir_cubit_check_connectavity.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/pick_image.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/store_user_data_localy.dart';
import 'package:multiservices_app/features/auth/functions/upload_image_geturl.dart';
import 'package:multiservices_app/features/home/chat/functions/compress_image.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/pick_image_options.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_search_button.dart';
import 'package:multiservices_app/features/home/presentation/widgets/settings_view_body.dart';
import 'package:multiservices_app/features/home/states_manager/get_user_data/get_user_data_cubit.dart';
import 'package:multiservices_app/features/home/states_manager/update_user_profile/update_user_profile_cubit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, required this.userModal});
  final UserModal userModal;
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late String userName;
  File? profileImage;
  String? pickedImageUrl;
  late String mainUserName;
  @override
  void initState() {
    userName = widget.userModal.userName;
    mainUserName = widget.userModal.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          (userName.trim() != mainUserName.trim() || profileImage != null)
              ? CustomIconButton(
                ontap: () async {
                  var hasInternetAcess =
                      await InternetConnection().hasInternetAccess;
                  if (!hasInternetAcess) {
                    showErrorConectionDialog(context: context);
                  } else {
                    if (profileImage != null) {
                      File? compresedImage = await compressImageAsFile(
                        profileImage!,
                      );
                      pickedImageUrl = await uploadfileGetUrl(
                        file: compresedImage!,
                      );
                      if (pickedImageUrl != null) {
                        BlocProvider.of<UpdateUserProfileCubit>(
                          context,
                        ).updateUserProfile(
                          userModal: UserModal(
                            userName: userName,
                            profilImageLink: pickedImageUrl!,
                            docId: FirebaseAuth.instance.currentUser!.uid,
                          ),
                        );
                        storeUserDataLocaly(
                          userModal: UserModal(
                            userName: userName,
                            profilImageLink: pickedImageUrl!,
                          ),
                        );
                      }
                      mainUserName = userName;
                      profileImage = null;
                      setState(() {});
                    } else {
                      BlocProvider.of<UpdateUserProfileCubit>(
                        context,
                      ).updateUserProfile(
                        userModal: UserModal(
                          userName: userName,
                          profilImageLink: widget.userModal.profilImageLink,
                          docId: FirebaseAuth.instance.currentUser!.uid,
                        ),
                      );
                      storeUserDataLocaly(
                        userModal: UserModal(
                          userName: userName,
                          profilImageLink: widget.userModal.profilImageLink,
                        ),
                      );
                      mainUserName = userName;
                      profileImage = null;
                      setState(() {});
                    }
                  }
                  ;
                },
                icon: Icons.border_color_sharp,
                iconColor: Theme.of(context).colorScheme.surface,
                containerColor: Theme.of(context).colorScheme.primary,
              )
              : SizedBox(),
          SizedBox(width: 16),
        ],
      ),
      body: BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
        listener: (context, state) {
          if (state is UpdateUserProfileFailure) {
            showErrorDialog(context: context, errorMessage: state.errorMessage);
          }
          if (state is UpdateUserProfileSuccess) {
            BlocProvider.of<GetUserDataCubit>(context).getData();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is UpdateUserProfileLoding,
            child: SettingsViewBody(
              intialUserName: widget.userModal.userName,
              userNameOnChanged: (value) {
                userName = value!;
                setState(() {});
              },
              imageOnPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => IntrinsicHeight(
                        child: PickImageOptions(
                          onCameraTap: () async {
                            profileImage = await pickCameraImage();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          onGalleryTap: () async {
                            profileImage = await pickGallaryImage();
                            setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                      ),
                );
              },
              userData: widget.userModal,
              pickedImage: profileImage,
              pickedImageUrl: pickedImageUrl,
            ),
          );
        },
      ),
    );
  }
}
