import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo_impl.dart';

part 'sendressetpasswordemail_state.dart';

class SendressetpasswordemailCubit extends Cubit<SendressetpasswordemailState> {
  SendressetpasswordemailCubit(this._authRepoImpl)
    : super(SendressetpasswordemailInitial());
  final AuthRepoImpl _authRepoImpl;
  Future<void> sendRessetPasswordRequst({required String emailAddress}) async {
    emit(SendressetpasswordemailLoading());
    var reslut = await _authRepoImpl.sendRessetPasswordEmail(
      emailAddress: emailAddress,
    );
    reslut.fold(
      (failure) {
        emit(
          SendressetpasswordemailFailure(errorMessage: failure.errorMessage),
        );
      },
      (reslult) {
        emit(SendressetpasswordemailSuccess());
      },
    );
  }
}
