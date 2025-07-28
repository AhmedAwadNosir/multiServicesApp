import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/create_message_container.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_all_contacts/get_all_contacts_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/send_message/send_message_cubit.dart';

class CreateMessageContainerBlocConsumer extends StatelessWidget {
  const CreateMessageContainerBlocConsumer({
    super.key,
    required this.scrollController,
    required this.reciverModal,
  });

  final ScrollController scrollController;
  final UserModal reciverModal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if (state is SendMessageSuccess) {
          BlocProvider.of<GetAllContactsCubit>(context).getAllContacts();
        }
        if (state is SendMessageFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CreateMessageContainerForm(
          scrollController: scrollController,
          reciverUserModal: reciverModal,
        );
      },
    );
  }
}
