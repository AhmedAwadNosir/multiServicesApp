import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'get_all_contacts_state.dart';

class GetAllContactsCubit extends Cubit<GetAllContactsState> {
  GetAllContactsCubit(this.chatRepoImpl) : super(GetAllContactsInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> getAllContacts() async {
    emit(GetAllContactsLoading());
    var result = await chatRepoImpl.getAllContact();
    result.fold(
      (failure) =>
          emit(GetAllContactsFailure(errorMessage: failure.errorMessage)),
      (contacts) => emit(GetAllContactsSuccess(contacts: contacts)),
    );
  }
}
