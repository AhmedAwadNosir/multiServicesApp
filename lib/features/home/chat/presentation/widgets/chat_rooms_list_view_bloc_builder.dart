import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_rooms_list_view.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_all_contacts/get_all_contacts_cubit.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/generated/l10n.dart';

class ChatRoomsListViewBlocBuilder extends StatelessWidget {
  const ChatRoomsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllContactsCubit, GetAllContactsState>(
      builder: (context, state) {
        if (state is GetAllContactsFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetAllContactsSuccess) {
          if (state.contacts.isEmpty) {
            return NoDataFound(
              title:
                  ' ${S.of(context).NoMessagesFound} \n${S.of(context).StartNewChat}',
              dataImage: AppImages.noMessagesFound,
            );
          } else {
            return ChatRoomsListView(chats: state.contacts);
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
