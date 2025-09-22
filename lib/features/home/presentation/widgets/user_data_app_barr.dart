import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/data/repos/setting_repo_impl.dart';
import 'package:multiservices_app/features/home/functions/get_user_data.dart';
import 'package:multiservices_app/features/home/presentation/views/settings_view.dart';
import 'package:multiservices_app/features/home/states_manager/get_user_data/get_user_data_cubit.dart';
import 'package:multiservices_app/features/home/states_manager/update_user_profile/update_user_profile_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class UserDataAppBarr extends StatefulWidget {
  const UserDataAppBarr({super.key});

  @override
  State<UserDataAppBarr> createState() => _UserDataAppBarrState();
}

class _UserDataAppBarrState extends State<UserDataAppBarr> {
  @override
  void initState() {
    BlocProvider.of<GetUserDataCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModal? userData;
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          userData = state.userModal;
        }
        return Row(
          children: [
            CircleAvatar(
              radius: 29,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      userData?.profilImageLink ?? "",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.67,
              child: Text(
                "${S.of(context).Hi}${userData?.userName ?? ""}😎",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider(
                          create:
                              (context) => UpdateUserProfileCubit(
                                settingRepoImpl: SettingRepoImpl(
                                  firebaseServieces: FirebaseServieces(),
                                  auth: FirebaseAuth.instance,
                                ),
                              ),
                          child: SettingsView(userModal: userData!),
                        ),
                  ),
                );
              },
              child: Icon(
                Icons.settings,
                size: 33,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
