import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_requsts_view_Body.dart';
import 'package:multiservices_app/features/home/chat/states_manager/accept_friend_req/accept_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friend_req/get_friend_req_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/dellet_friend_req/dellet_friend_req_cubit.dart';

class FriendsReqsViewMuilyBlocProvider extends StatelessWidget {
  const FriendsReqsViewMuilyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create:
              (context) => GetFriendReqCubit(
                chatRepoImpl: ChatRepoImpl(
                  firebaseServieces: FirebaseServieces(),
                  auth: FirebaseAuth.instance,
                ),
              ),
        ),
        RepositoryProvider(
          create:
              (context) => DelletFriendReqCubit(
                chatRepoImpl: ChatRepoImpl(
                  firebaseServieces: FirebaseServieces(),
                  auth: FirebaseAuth.instance,
                ),
              ),
        ),
        RepositoryProvider(
          create:
              (context) => AcceptFriendReqCubit(
                chatRepoImpl: ChatRepoImpl(
                  firebaseServieces: FirebaseServieces(),
                  auth: FirebaseAuth.instance,
                ),
              ),
        ),
      ],
      child: FriendRequstsViewBody(),
    );
  }
}
