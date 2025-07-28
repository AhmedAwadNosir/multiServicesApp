import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_loading_circle_progers.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:multiservices_app/features/home/chat/states_manager/accept_friend_req/accept_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/dellet_friend_req/dellet_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friend_req/get_friend_req_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class CustomFriendRequstItem extends StatelessWidget {
  const CustomFriendRequstItem({super.key, required this.userData});
  final UserModal userData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProfilePhotoCircleAvatar(
          profileImage: userData.profilImageLink,
          radius: 40,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Text(
                userData.userName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                ConfirmButtonBlocConsumer(userData: userData),
                SizedBox(width: 20),
                BlocConsumer<DelletFriendReqCubit, DelletFriendReqState>(
                  listener: (context, state) {
                    if (state is DelletFriendReqFailure) {
                      showErrorDialog(
                        context: context,
                        errorMessage: state.errorMessage,
                      );
                    }
                    if (state is DelletFriendReqSuccess) {
                      BlocProvider.of<GetFriendReqCubit>(
                        context,
                      ).getFriendsReq();
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DelletFriendReqCubit>(
                          context,
                        ).delletFreindReq(friendData: userData);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.shadow,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        S.of(context).Dellete,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ConfirmButtonBlocConsumer extends StatelessWidget {
  const ConfirmButtonBlocConsumer({super.key, required this.userData});

  final UserModal userData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcceptFriendReqCubit, AcceptFriendReqState>(
      listener: (context, state) {
        if (state is AcceptFriendReqFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
        if (state is AcceptFriendReqSuccess) {
          BlocProvider.of<GetFriendReqCubit>(context).getFriendsReq();
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            BlocProvider.of<AcceptFriendReqCubit>(
              context,
            ).acceptFriendReq(friendData: userData);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
          child: Text(
            S.of(context).Confirm,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        );
      },
    );
  }
}
