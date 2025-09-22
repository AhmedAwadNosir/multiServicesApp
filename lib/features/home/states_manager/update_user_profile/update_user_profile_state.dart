part of 'update_user_profile_cubit.dart';

@immutable
sealed class UpdateUserProfileState {}

final class UpdateUserProfileInitial extends UpdateUserProfileState {}

final class UpdateUserProfileLoding extends UpdateUserProfileState {}

final class UpdateUserProfileSuccess extends UpdateUserProfileState {}

final class UpdateUserProfileFailure extends UpdateUserProfileState {
  final String errorMessage;

  UpdateUserProfileFailure({required this.errorMessage});
}
