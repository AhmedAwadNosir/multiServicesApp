part of 'get_all_contacts_cubit.dart';

@immutable
sealed class GetAllContactsState {}

final class GetAllContactsInitial extends GetAllContactsState {}

final class GetAllContactsLoading extends GetAllContactsState {}

final class GetAllContactsSuccess extends GetAllContactsState {
  final List<ContactModal> contacts;

  GetAllContactsSuccess({required this.contacts});
}

final class GetAllContactsFailure extends GetAllContactsState {
  final String errorMessage;

  GetAllContactsFailure({required this.errorMessage});
}
