import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/freinds_list_view.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friends/get_friends_cubit.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/generated/l10n.dart';

class FreindsListViewBlocBuilder extends StatelessWidget {
  const FreindsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is GetFriendsFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetFriendsSuccess) {
          if (state.friends.isEmpty) {
            return NoDataFound(
              title: S.of(context).NoFriendsYetgoMakeSomeFreinds,
              dataImage: AppImages.noUsers,
            );
          } else {
            return FreindListView(users: state.friends);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      },
    );
  }
}
