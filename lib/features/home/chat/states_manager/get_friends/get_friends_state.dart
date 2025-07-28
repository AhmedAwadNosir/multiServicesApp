part of 'get_friends_cubit.dart';

@immutable
sealed class GetFriendsState {}

final class GetFriendsInitial extends GetFriendsState {}

final class GetFriendsLoading extends GetFriendsState {}

final class GetFriendsFailure extends GetFriendsState {
  final String errorMessage;

  GetFriendsFailure({required this.errorMessage});
}

final class GetFriendsSuccess extends GetFriendsState {
  final List<UserModal> friends;

  GetFriendsSuccess({required this.friends});
}
