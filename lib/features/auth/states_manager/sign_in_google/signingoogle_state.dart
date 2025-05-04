part of 'signingoogle_cubit.dart';

@immutable
sealed class SigningoogleState {}

final class SigningoogleInitial extends SigningoogleState {}

final class SigningoogleLoading extends SigningoogleState {}

final class SigningoogleSuccess extends SigningoogleState {
  final UserModal userModal;

  SigningoogleSuccess({required this.userModal});
}

final class SigningoogleFailure extends SigningoogleState {
  final String errorMessage;

  SigningoogleFailure({required this.errorMessage});
}
