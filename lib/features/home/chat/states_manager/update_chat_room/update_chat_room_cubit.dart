import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_chat_room_state.dart';

class UpdateChatRoomCubit extends Cubit<UpdateChatRoomState> {
  UpdateChatRoomCubit() : super(UpdateChatRoomInitial());
  String chatRoom = "";
  updateChatRoom({required String newchatRoom}) {
    chatRoom = newchatRoom;
    emit(UpdateChatRoomSuccess(chatRoom: newchatRoom));
  }
}
