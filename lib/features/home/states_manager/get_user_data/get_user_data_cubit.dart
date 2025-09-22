import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/functions/get_user_data.dart';
part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  Future<UserModal> getData() async {
    UserModal? userModal;
    userModal = await getUserData();
    emit(GetUserDataSuccess(userModal: userModal));
    return userModal;
  }
}
