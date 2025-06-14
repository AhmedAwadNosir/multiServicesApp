import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/users_list_view.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AddFriendsViewBody extends StatelessWidget {
  const AddFriendsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            S.of(context).AddFreinds,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          // NoDataFound(
          //   title: S.of(context).NoUsersYet,
          //   dataImage: AppImages.noUsers,
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: UsersListView(),
          ),
        ],
      ),
    );
  }
}
