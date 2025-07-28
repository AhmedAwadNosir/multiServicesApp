import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'get_friend_req_state.dart';

class GetFriendReqCubit extends Cubit<GetFriendReqState> {
  GetFriendReqCubit({required this.chatRepoImpl})
    : super(GetFriendReqInitial());
  final ChatRepoImpl chatRepoImpl;

  Future<void> getFriendsReq() async {
    emit(GetFriendReqLoading());
    var result = await chatRepoImpl.getFriendReq();
    result.fold(
      (failure) => emit(GetFriendReqFilure(errorMessage: failure.errorMessage)),
      (friendsReqs) => emit(GetFriendReqSuccess(friendsReqs: friendsReqs)),
    );
  }
}
