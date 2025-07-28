import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo_impl.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._authRepoImpl) : super(SigninInitial());
  final AuthRepoImpl _authRepoImpl;
  Future<void> signIn({
    required String emailAddress,
    required String password,
  }) async {
    emit(SigninLoading());
    var result = await _authRepoImpl.signInWithEmailAndPassword(
      emailAddress: emailAddress,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.errorMessage)),
      (userData) => emit(SigninSuccess(userData: userData)),
    );
  }
}
