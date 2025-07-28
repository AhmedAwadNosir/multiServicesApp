part of 'get_friend_req_cubit.dart';

@immutable
sealed class GetFriendReqState {}

final class GetFriendReqInitial extends GetFriendReqState {}

final class GetFriendReqLoading extends GetFriendReqState {}

final class GetFriendReqFilure extends GetFriendReqState {
  final String errorMessage;

  GetFriendReqFilure({required this.errorMessage});
}

final class GetFriendReqSuccess extends GetFriendReqState {
  final List<UserModal> friendsReqs;

  GetFriendReqSuccess({required this.friendsReqs});
}
