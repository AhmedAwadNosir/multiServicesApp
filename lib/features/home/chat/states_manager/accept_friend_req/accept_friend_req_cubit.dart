import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'accept_friend_req_state.dart';

class AcceptFriendReqCubit extends Cubit<AcceptFriendReqState> {
  AcceptFriendReqCubit({required this.chatRepoImpl})
    : super(AcceptFriendReqInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> acceptFriendReq({required UserModal friendData}) async {
    emit(AcceptFriendReqLoading());
    var result = await chatRepoImpl.acceptFreindReq(friendData: friendData);
    result.fold(
      (failure) =>
          emit(AcceptFriendReqFailure(errorMessage: failure.errorMessage)),
      (success) => emit(AcceptFriendReqSuccess()),
    );
  }
}
