import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo_impl.dart';

part 'signingoogle_state.dart';

class SigningoogleCubit extends Cubit<SigningoogleState> {
  SigningoogleCubit(this._authRepoImpl) : super(SigningoogleInitial());
  final AuthRepoImpl _authRepoImpl;
  Future<void> signInGoogle() async {
    emit(SigningoogleLoading());
    var reslut = await _authRepoImpl.signInWithGoogle();
    reslut.fold(
      (failure) =>
          emit(SigningoogleFailure(errorMessage: failure.errorMessage)),
      (userData) => emit(SigningoogleSuccess(userModal: userData)),
    );
  }
}
