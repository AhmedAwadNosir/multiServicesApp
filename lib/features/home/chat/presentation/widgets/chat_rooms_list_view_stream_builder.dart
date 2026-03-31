import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/functions/get_all_contacts_stream.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_rooms_list_view.dart';

class ChatRoomsListVieStreamBuilder extends StatefulWidget {
  const ChatRoomsListVieStreamBuilder({super.key});

  @override
  State<ChatRoomsListVieStreamBuilder> createState() =>
      _ChatRoomsListVieStreamBuilderState();
}

class _ChatRoomsListVieStreamBuilderState
    extends State<ChatRoomsListVieStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ContactModal>>(
      stream: getallcontactsStream(),
      builder: (context, snapshot) {
        /// 🔄 LOADING
        if (snapshot.hasError) {
          showErrorDialog(
            context: context,
            errorMessage: snapshot.error.toString(),
          );
          return SizedBox();
        } else if (snapshot.hasData) {
          return ChatRoomsListView(
            chats: snapshot.data!.isEmpty ? [] : snapshot.data!,
          );
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
  

//the previous version of code with bloc builder state manager
// class ChatRoomsListViewBlocBuilder extends StatelessWidget {
//   const ChatRoomsListViewBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetAllContactsCubit, GetAllContactsState>(
//       builder: (context, state) {
//         if (state is GetAllContactsFailure) {
//           showErrorDialog(context: context, errorMessage: state.errorMessage);
//           return SizedBox();
//         } else if (state is GetAllContactsSuccess) {
//           if (state.contacts.isEmpty) {
//             return NoDataFound(
//               title:
//                   ' ${S.of(context).NoMessagesFound} \n${S.of(context).StartNewChat}',
//               dataImage: AppImages.noMessagesFound,
//             );
//           } else {
//             return ChatRoomsListView(chats: state.contacts);
//           }
//         } else {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Theme.of(context).colorScheme.primary,
//             ),
//           );
//         }
//       },
//     );
//   }
// }

