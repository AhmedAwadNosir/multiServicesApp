part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageLoading extends SendMessageState {}

final class SendMessageSuccess extends SendMessageState {
  final String chatRoom;

  SendMessageSuccess({required this.chatRoom});
}

final class SendMessageFailure extends SendMessageState {
  final String errorMessage;

  SendMessageFailure({required this.errorMessage});
}
