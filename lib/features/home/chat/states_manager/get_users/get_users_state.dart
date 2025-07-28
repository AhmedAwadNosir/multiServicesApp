part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersFailure extends GetUsersState {
  final String errorMessage;

  GetUsersFailure({required this.errorMessage});
}

final class GetUsersSuccess extends GetUsersState {
  final List<UserModal> users;

  GetUsersSuccess({required this.users});
}
