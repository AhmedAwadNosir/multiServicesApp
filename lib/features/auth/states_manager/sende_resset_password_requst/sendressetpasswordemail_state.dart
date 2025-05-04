part of 'sendressetpasswordemail_cubit.dart';

@immutable
sealed class SendressetpasswordemailState {}

final class SendressetpasswordemailInitial
    extends SendressetpasswordemailState {}

final class SendressetpasswordemailLoading
    extends SendressetpasswordemailState {}

final class SendressetpasswordemailSuccess
    extends SendressetpasswordemailState {}

final class SendressetpasswordemailFailure
    extends SendressetpasswordemailState {
  final String errorMessage;

  SendressetpasswordemailFailure({required this.errorMessage});
}
