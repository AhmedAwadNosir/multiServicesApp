import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/users_list_view_bloc_builder.dart';

import 'package:multiservices_app/features/home/chat/states_manager/get_users/get_users_cubit.dart';

import 'package:multiservices_app/generated/l10n.dart';

class AddFriendsViewBody extends StatefulWidget {
  const AddFriendsViewBody({super.key});

  @override
  State<AddFriendsViewBody> createState() => _AddFriendsViewBodyState();
}

class _AddFriendsViewBodyState extends State<AddFriendsViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetUsersCubit>(context).getUsers();
    super.initState();
  }

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
          UsersListViewBlocBuilder(),
        ],
      ),
    );
  }
}
