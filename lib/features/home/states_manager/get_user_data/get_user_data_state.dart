part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataSuccess extends GetUserDataState {
  final UserModal userModal;

  GetUserDataSuccess({required this.userModal});
}
