import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/home/data/models/feedback_message_modal.dart';
import 'package:multiservices_app/features/home/data/repos/setting_repo_impl.dart';

part 'send_feedback_message_state.dart';

class SendFeedbackMessageCubit extends Cubit<SendFeedbackMessageState> {
  SendFeedbackMessageCubit({required this.settingRepoImpl})
    : super(SendFeedbackMessageInitial());
  final SettingRepoImpl settingRepoImpl;
  Future<void> sendFedbackMessage({
    required FeedbackMessageModla feedbackMessage,
  }) async {
    emit(SendFeedbackMessageLoading());
    var result = await settingRepoImpl.sendFeedBackMessage(
      feedbackMessage: feedbackMessage,
    );

    result.fold(
      (failure) =>
          emit(SendFeedbackMessageFailure(errorMessage: failure.errorMessage)),
      (data) => emit(SendFeedbackMessageSuccess()),
    );
  }
}
