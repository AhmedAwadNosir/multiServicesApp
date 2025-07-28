import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friend_req/get_friend_req_cubit.dart';

part 'get_friends_state.dart';

class GetFriendsCubit extends Cubit<GetFriendsState> {
  GetFriendsCubit({required this.chatRepoImpl}) : super(GetFriendsInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> getFriends() async {
    emit(GetFriendsLoading());
    var reslut = await chatRepoImpl.getFriends();
    reslut.fold(
      (faliure) => emit(GetFriendsFailure(errorMessage: faliure.errorMessage)),
      (friends) => emit(GetFriendsSuccess(friends: friends)),
    );
  }
}
