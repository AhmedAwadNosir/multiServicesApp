import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'dellet_friend_req_state.dart';

class DelletFriendReqCubit extends Cubit<DelletFriendReqState> {
  DelletFriendReqCubit({required this.chatRepoImpl})
    : super(DelletFriendReqInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> delletFreindReq({required UserModal friendData}) async {
    var reslut = await chatRepoImpl.deletFriendReq(friendData: friendData);
    reslut.fold(
      (faliure) =>
          emit(DelletFriendReqFailure(errorMessage: faliure.errorMessage)),
      (success) => emit(DelletFriendReqSuccess()),
    );
  }
}
