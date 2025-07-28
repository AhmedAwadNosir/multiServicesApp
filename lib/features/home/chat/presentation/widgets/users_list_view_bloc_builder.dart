import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_users/get_users_cubit.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/users_list_view.dart';
import 'package:multiservices_app/generated/l10n.dart';

class UsersListViewBlocBuilder extends StatelessWidget {
  const UsersListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        if (state is GetUsersFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetUsersSuccess) {
          if (state.users.isEmpty) {
            return NoDataFound(
              title: S.of(context).NoUsersYet,
              dataImage: AppImages.noUsers,
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: UsersListView(users: state.users),
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
