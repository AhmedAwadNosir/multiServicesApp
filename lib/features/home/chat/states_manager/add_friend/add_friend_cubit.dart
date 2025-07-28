import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'add_friend_state.dart';

class AddFriendCubit extends Cubit<AddFriendState> {
  AddFriendCubit({required this.chatRepoImpl}) : super(AddFriendInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> addFriend({required UserModal freindData}) async {
    var reslut = await chatRepoImpl.addFriend(friendData: freindData);
    reslut.fold(
      (failure) => emit(AddFriendFailure(errorMessage: failure.errorMessage)),
      (success) => emit(AddFriendSuccess()),
    );
  }
}
