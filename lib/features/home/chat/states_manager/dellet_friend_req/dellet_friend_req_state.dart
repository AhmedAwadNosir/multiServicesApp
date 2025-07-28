part of 'dellet_friend_req_cubit.dart';

@immutable
sealed class DelletFriendReqState {}

final class DelletFriendReqInitial extends DelletFriendReqState {}

final class DelletFriendReqLoading extends DelletFriendReqState {}

final class DelletFriendReqFailure extends DelletFriendReqState {
  final String errorMessage;

  DelletFriendReqFailure({required this.errorMessage});
}

final class DelletFriendReqSuccess extends DelletFriendReqState {}
