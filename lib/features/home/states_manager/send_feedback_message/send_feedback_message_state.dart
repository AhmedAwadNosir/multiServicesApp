part of 'send_feedback_message_cubit.dart';

@immutable
sealed class SendFeedbackMessageState {}

final class SendFeedbackMessageInitial extends SendFeedbackMessageState {}

final class SendFeedbackMessageLoading extends SendFeedbackMessageState {}

final class SendFeedbackMessageSuccess extends SendFeedbackMessageState {}

final class SendFeedbackMessageFailure extends SendFeedbackMessageState {
  final String errorMessage;

  SendFeedbackMessageFailure({required this.errorMessage});
}
