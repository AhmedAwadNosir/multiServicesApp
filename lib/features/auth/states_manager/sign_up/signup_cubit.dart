import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo_impl.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepoImpl) : super(SignupInitial());
  final AuthRepoImpl _authRepoImpl;
  Future<void> signUp({
    required String emailAddress,
    required String password,
    required UserModal userModal,
  }) async {
    emit(SignupLoading());
    var reslut = await _authRepoImpl.signUpWithEmailAndPassword(
      emailAddress: emailAddress.trim(),
      password: password.trim(),
      usermodal: userModal,
    );
    reslut.fold(
      (failure) => emit(SignupFailure(errorMessage: failure.errorMessage)),
      (userData) => emit(SignupSuccess(userModal: userData)),
    );
  }
}
