import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/cusotm_search_bar.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/freinds_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friends/get_friends_cubit.dart';

import 'package:multiservices_app/generated/l10n.dart';

class NewChatBottomSheet extends StatefulWidget {
  const NewChatBottomSheet({super.key});

  @override
  State<NewChatBottomSheet> createState() => _NewChatBottomSheetState();
}

class _NewChatBottomSheetState extends State<NewChatBottomSheet> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    BlocProvider.of<GetFriendsCubit>(context).getFriends();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            CustomSearchBar(
              controller: textEditingController,
              hintText: S.of(context).SearchbyName,
            ),
            SizedBox(height: 16),
            FreindsListViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
