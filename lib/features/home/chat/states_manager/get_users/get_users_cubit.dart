import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit({required this.chatRepoImpl}) : super(GetUsersInitial());
  final ChatRepoImpl chatRepoImpl;

  Future<void> getUsers() async {
    emit(GetUsersLoading());
    var result = await chatRepoImpl.getUsers();
    result.fold(
      (filure) => emit(GetUsersFailure(errorMessage: filure.errorMessage)),
      (users) {
        emit(GetUsersSuccess(users: users));
      },
    );
  }
}
