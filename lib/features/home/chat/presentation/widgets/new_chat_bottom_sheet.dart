import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/cusotm_search_bar.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/freinds_list_view.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
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
            // NoDataFound(
            //   title: S.of(context).NoFriendsYetgoMakeSomeFreinds,
            //   dataImage: AppImages.noUsers,
            // ),
            FreindListView(),
          ],
        ),
      ),
    );
  }
}
