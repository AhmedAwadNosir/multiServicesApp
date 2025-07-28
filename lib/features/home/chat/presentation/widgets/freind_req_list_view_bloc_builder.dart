import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_requsts_list_view.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friend_req/get_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/generated/l10n.dart';

class FreindReqListViewBlocBuilder extends StatelessWidget {
  const FreindReqListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFriendReqCubit, GetFriendReqState>(
      builder: (context, state) {
        if (state is GetFriendReqFilure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetFriendReqSuccess) {
          if (state.friendsReqs.isEmpty) {
            return NoDataFound(
              title: S.of(context).NoUsersYet,
              dataImage: AppImages.noUsers,
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: FreindRequstListView(users: state.friendsReqs),
            );
          }
        } else {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.33),
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
