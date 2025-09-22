import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/data/repos/setting_repo_impl.dart';

part 'update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit({required this.settingRepoImpl})
    : super(UpdateUserProfileInitial());
  final SettingRepoImpl settingRepoImpl;

  Future<void> updateUserProfile({required UserModal userModal}) async {
    emit(UpdateUserProfileLoding());
    var result = await settingRepoImpl.updateUserProfileData(
      userModal: userModal,
    );
    result.fold(
      (failure) =>
          emit(UpdateUserProfileFailure(errorMessage: failure.errorMessage)),
      (data) => emit(UpdateUserProfileSuccess()),
    );
  }
}
