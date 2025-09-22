import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit({required this.chatRepoImpl}) : super(SendMessageInitial());
  final ChatRepoImpl chatRepoImpl;
  Future<void> sendMessage({
    required MessageModal messageModal,
    required UserModal reciverModal,
  }) async {
    emit(SendMessageLoading());
    var reslut = await chatRepoImpl.sendMessage(
      messageModal: messageModal,
      reciverModal: reciverModal,
    );
    reslut.fold(
      (failure) => emit(SendMessageFailure(errorMessage: failure.errorMessage)),
      (chatRoom) => emit(SendMessageSuccess(chatRoom: chatRoom)),
    );
  }
}
