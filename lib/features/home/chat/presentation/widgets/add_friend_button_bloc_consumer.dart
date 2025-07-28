import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_loading_circle_progers.dart';
import 'package:multiservices_app/features/home/chat/states_manager/add_friend/add_friend_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_users/get_users_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AddFreindButtonBlocConsumer extends StatelessWidget {
  const AddFreindButtonBlocConsumer({super.key, required this.userData});

  final UserModal userData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFriendCubit, AddFriendState>(
      listener: (context, state) {
        if (state is AddFriendFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
        if (state is AddFriendSuccess) {
          BlocProvider.of<GetUsersCubit>(context).getUsers();
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            BlocProvider.of<AddFriendCubit>(
              context,
            ).addFriend(freindData: userData);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(10),
          ),
          child: Row(
            children: [
              Text(
                S.of(context).AddFriend,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
            ],
          ),
        );
      },
    );
  }
}
