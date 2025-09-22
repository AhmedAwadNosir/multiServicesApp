part of 'update_chat_room_cubit.dart';

@immutable
sealed class UpdateChatRoomState {}

final class UpdateChatRoomInitial extends UpdateChatRoomState {}

final class UpdateChatRoomSuccess extends UpdateChatRoomState {
  final String chatRoom;

  UpdateChatRoomSuccess({required this.chatRoom});
}
