import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/add_friends_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/states_manager/add_friend/add_friend_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_users/get_users_cubit.dart';

class AddFriendsMulitBlocProviders extends StatelessWidget {
  const AddFriendsMulitBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => GetUsersCubit(
                chatRepoImpl: ChatRepoImpl(
                  firebaseServieces: FirebaseServieces(),
                  auth: FirebaseAuth.instance,
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => AddFriendCubit(
                chatRepoImpl: ChatRepoImpl(
                  firebaseServieces: FirebaseServieces(),
                  auth: FirebaseAuth.instance,
                ),
              ),
        ),
      ],
      child: AddFriendsViewBody(),
    );
  }
}
