part of 'accept_friend_req_cubit.dart';

@immutable
sealed class AcceptFriendReqState {}

final class AcceptFriendReqInitial extends AcceptFriendReqState {}

final class AcceptFriendReqLoading extends AcceptFriendReqState {}

final class AcceptFriendReqFailure extends AcceptFriendReqState {
  final String errorMessage;

  AcceptFriendReqFailure({required this.errorMessage});
}

final class AcceptFriendReqSuccess extends AcceptFriendReqState {}
