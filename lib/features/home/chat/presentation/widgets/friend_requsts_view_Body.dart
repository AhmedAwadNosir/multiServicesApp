import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/freind_req_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_requsts_list_view.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friend_req/get_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/generated/l10n.dart';

class FriendRequstsViewBody extends StatefulWidget {
  const FriendRequstsViewBody({super.key});

  @override
  State<FriendRequstsViewBody> createState() => _FriendRequstsViewBodyState();
}

class _FriendRequstsViewBodyState extends State<FriendRequstsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetFriendReqCubit>(context).getFriendsReq();
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
            S.of(context).FreindRequsts,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          FreindReqListViewBlocBuilder(),
        ],
      ),
    );
  }
}
