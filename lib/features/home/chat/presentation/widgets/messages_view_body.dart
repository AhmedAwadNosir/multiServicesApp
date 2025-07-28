import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_rooms_list_view_bloc_builder.dart';

import 'package:multiservices_app/generated/l10n.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            S.of(context).Messages,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: ChatRoomsListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
